/*
 * This file is part of the TrinityCore Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

// In-game Store (TokenHandler.cpp) commands for the support site (contrib/support_site), run through Remote Access:
//   .shop reload                              reload shop_group / shop_product / shop_product_action
//   .shop goldlist <character> <gold> <points> take the gold from the character (online or not) and list it on the Gold Market
//   .shop goldcancel <listing id>             remove a listing and mail its gold back to the seller
// Output lines start with "OK" or "ERROR" so the site can read them.

#include "ScriptMgr.h"
#include "CharacterCache.h"
#include "Chat.h"
#include "ChatCommand.h"
#include "DatabaseEnv.h"
#include "Log.h"
#include "Mail.h"
#include "ObjectAccessor.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "RBAC.h"
#include "Random.h"
#include "ShopWallet.h"
#include "StringFormat.h"
#include "WorldSession.h"

using namespace Trinity::ChatCommands;

namespace
{
constexpr uint32 GoldMarketMaxGold = 200000;    // the gold action is sent as int32 copper
constexpr uint32 GoldMarketMinPrice = 2;        // the fee is at least 1 point
}

class classic_shop_commandscript : public CommandScript
{
public:
    classic_shop_commandscript() : CommandScript("classic_shop_commandscript") { }

    std::span<ChatCommandBuilder const> GetCommands() const override
    {
        static ChatCommandTable shopCommandTable =
        {
            { "reload",     HandleReloadCommand,     rbac::RBAC_PERM_COMMAND_RELOAD, Console::Yes },
            { "points",     HandlePointsCommand,     rbac::RBAC_PERM_COMMAND_RELOAD, Console::Yes },
            { "balance",    HandleBalanceCommand,    rbac::RBAC_PERM_COMMAND_RELOAD, Console::Yes },
            { "boost",      HandleBoostCommand,      rbac::RBAC_PERM_COMMAND_RELOAD, Console::Yes },
            { "refund",     HandleRefundCommand,     rbac::RBAC_PERM_COMMAND_RELOAD, Console::Yes },
            { "goldlist",   HandleGoldListCommand,   rbac::RBAC_PERM_COMMAND_RELOAD, Console::Yes },
            { "goldcancel", HandleGoldCancelCommand, rbac::RBAC_PERM_COMMAND_RELOAD, Console::Yes },
        };
        static ChatCommandTable commandTable =
        {
            { "shop", shopCommandTable },
        };
        return commandTable;
    }

    static bool HandleReloadCommand(ChatHandler* handler)
    {
        sObjectMgr->LoadShop();
        handler->PSendSysMessage("OK магазин перезагружен: %u вкладок, %u товаров", uint32(sObjectMgr->GetShopGroups().size()), uint32(sObjectMgr->GetShopProducts().size()));
        return true;
    }

    static uint32 GetPoints(uint32 accountId)
    {
        // Unified wallet: shop points are the site bonus balance of the linked site account.
        return ShopWallet::Balance(accountId);
    }

    // .shop points <amount> [character]: add shop points to the character's account (negative takes them, not below 0)
    static bool HandlePointsCommand(ChatHandler* handler, int32 amount, Optional<PlayerIdentifier> player)
    {
        if (!player)
            player = PlayerIdentifier::FromTargetOrSelf(handler);
        if (!player)
        {
            handler->SendSysMessage("Использование: .shop points <количество> [персонаж] (или выберите игрока)");
            handler->SetSentErrorMessage(true);
            return false;
        }

        uint32 accountId = sCharacterCache->GetCharacterAccountIdByGuid(player->GetGUID());
        if (!accountId)
        {
            handler->SendSysMessage("ERROR неизвестный персонаж");
            handler->SetSentErrorMessage(true);
            return false;
        }

        if (amount != 0)
        {
            std::string key = Trinity::StringFormat("gm-{}-{}", accountId, urand(1, 100000000));
            ShopWallet::Result result = amount > 0
                ? ShopWallet::Credit(accountId, uint32(amount), "Корректировка бонусов ГМ", key)
                : ShopWallet::Debit(accountId, uint32(-amount), "Корректировка бонусов ГМ", key);
            if (!result.ok)
            {
                if (result.code == -2)
                    handler->SendSysMessage("ERROR аккаунт не привязан к аккаунту на сайте (привяжите на azeroth.su: Магазин → Forever в клиенте → Бонусы)");
                else if (result.code == -3)
                    handler->SendSysMessage("ERROR недостаточно бонусов");
                else
                    handler->SendSysMessage("ERROR не удалось изменить бонусы (ошибка базы)");
                handler->SetSentErrorMessage(true);
                return false;
            }
        }

        uint32 points = GetPoints(accountId);

        handler->PSendSysMessage("OK %s: %d бонусов, на аккаунте %u теперь %u.", player->GetName().c_str(), amount, accountId, points);
        if (Player* target = player->GetConnectedPlayer())
            if (target->GetSession() != handler->GetSession())
                ChatHandler(target->GetSession()).SendSysMessage(Trinity::StringFormat("Магазин: вы получили {} бонусов. У вас {} бонусов.", amount, points));
        TC_LOG_INFO("entities.player", "Shop: {} points for account {} ({}), now {}", amount, accountId, player->GetName(), points);
        return true;
    }

    // .shop boost [character] [type]: a character boost token for the character's account (type 6 = level 60)
    static bool HandleBoostCommand(ChatHandler* handler, Optional<PlayerIdentifier> player, Optional<uint32> boostType)
    {
        if (!player)
            player = PlayerIdentifier::FromTargetOrSelf(handler);
        if (!player)
        {
            handler->SendSysMessage("Использование: .shop boost [персонаж] [тип] (или выберите игрока)");
            handler->SetSentErrorMessage(true);
            return false;
        }

        uint32 accountId = sCharacterCache->GetCharacterAccountIdByGuid(player->GetGUID());
        if (!accountId)
        {
            handler->SendSysMessage("ERROR неизвестный персонаж");
            handler->SetSentErrorMessage(true);
            return false;
        }

        LoginDatabase.DirectPExecute("INSERT INTO account_boost_token (AccountID, BoostType, Source) VALUES ({}, {}, 'gm')", accountId, boostType.value_or(6));
        handler->PSendSysMessage("OK аккаунт %u игрока %s получил токен буста (тип %u); кнопка появится на экране персонажей.",
            accountId, player->GetName().c_str(), boostType.value_or(6));
        return true;
    }

    // .shop balance [character]
    static bool HandleBalanceCommand(ChatHandler* handler, Optional<PlayerIdentifier> player)
    {
        if (!player)
            player = PlayerIdentifier::FromTargetOrSelf(handler);
        if (!player)
        {
            handler->SendSysMessage("Использование: .shop balance [персонаж] (или выберите игрока)");
            handler->SetSentErrorMessage(true);
            return false;
        }

        uint32 accountId = sCharacterCache->GetCharacterAccountIdByGuid(player->GetGUID());
        if (!accountId)
        {
            handler->SendSysMessage("ERROR неизвестный персонаж");
            handler->SetSentErrorMessage(true);
            return false;
        }

        handler->PSendSysMessage("OK %s: на аккаунте %u %u бонусов.", player->GetName().c_str(), accountId, GetPoints(accountId));
        return true;
    }

    // .shop refund <purchase id>: return the charged shop points of a purchase (delivery failed or a manual refund)
    static bool HandleRefundCommand(ChatHandler* handler, uint64 purchaseId)
    {
        QueryResult result = LoginDatabase.PQuery("SELECT `AccountID`, `Price`, `Status` FROM shop_purchase WHERE `PurchaseID` = {}", purchaseId);
        if (!result)
        {
            handler->SendSysMessage("ERROR такой покупки нет");
            handler->SetSentErrorMessage(true);
            return false;
        }

        uint32 accountId = (*result)[0].GetUInt32();
        uint32 price = (*result)[1].GetUInt32();
        std::string_view status = (*result)[2].GetStringView();
        if (status == "refunded")
        {
            handler->SendSysMessage("ERROR эта покупка уже возвращена");
            handler->SetSentErrorMessage(true);
            return false;
        }

        ShopWallet::Result refund = ShopWallet::Credit(accountId, price,
            Trinity::StringFormat("Возврат покупки {}", purchaseId),
            Trinity::StringFormat("refund-{}", purchaseId));
        if (!refund.ok)
        {
            handler->PSendSysMessage("ERROR возврат не удался (код %d)", refund.code);
            handler->SetSentErrorMessage(true);
            return false;
        }

        LoginDatabase.PExecute("UPDATE shop_purchase SET `Status` = 'refunded' WHERE `PurchaseID` = {}", purchaseId);
        handler->PSendSysMessage("OK покупка %llu возвращена: %u бонусов на аккаунт %u, баланс %u.",
            purchaseId, price, accountId, refund.balance);
        TC_LOG_INFO("entities.player", "Shop: purchase {} refunded to account {} ({} points)", purchaseId, accountId, price);
        return true;
    }

    static bool HandleGoldListCommand(ChatHandler* handler, std::string name, uint32 gold, uint32 price)
    {
        if (!normalizePlayerName(name))
        {
            handler->SendSysMessage("ERROR неизвестный персонаж");
            return true;
        }

        if (gold < 1 || gold > GoldMarketMaxGold || price < GoldMarketMinPrice)
        {
            handler->PSendSysMessage("ERROR золота должно быть от 1 до %u, цена — не меньше %u бонусов", GoldMarketMaxGold, GoldMarketMinPrice);
            return true;
        }

        CharacterCacheEntry const* character = sCharacterCache->GetCharacterCacheByName(name);
        if (!character)
        {
            handler->SendSysMessage("ERROR неизвестный персонаж");
            return true;
        }

        // The seller is paid in shop points on the site ledger, so the game account has to be linked to a site account.
        if (!ShopWallet::IsLinked(character->AccountId))
        {
            handler->SendSysMessage("ERROR аккаунт не привязан к аккаунту на сайте (привяжите на azeroth.su: Магазин → Forever в клиенте → Бонусы)");
            return true;
        }

        // the player save uses prepared statements, which only the async connections have (a Direct* commit asserts): gold through the
        // normal async save, the listing row synchronously so its id can be returned (commands run in the world thread, one at a time)
        uint64 copper = uint64(gold) * GOLD;
        if (Player* player = ObjectAccessor::FindConnectedPlayer(character->Guid))
        {
            if (!player->HasEnoughMoney(copper))
            {
                handler->SendSysMessage("ERROR у персонажа нет столько золота");
                return true;
            }
            player->ModifyMoney(-int64(copper));
            CharacterDatabaseTransaction trans = CharacterDatabase.BeginTransaction();
            player->SaveInventoryAndGoldToDB(trans);
            CharacterDatabase.CommitTransaction(trans);
            ChatHandler(player->GetSession()).SendSysMessage(Trinity::StringFormat("Магазин: {} золота выставлено на Золотой рынок.", gold));
        }
        else
        {
            QueryResult result = CharacterDatabase.PQuery("SELECT money FROM characters WHERE guid = {}", character->Guid.GetCounter());
            if (!result || (*result)[0].GetUInt64() < copper)
            {
                handler->SendSysMessage("ERROR у персонажа нет столько золота");
                return true;
            }
            CharacterDatabase.DirectPExecute("UPDATE characters SET money = money - {} WHERE guid = {}", copper, character->Guid.GetCounter());
        }

        CharacterDatabase.DirectPExecute("INSERT INTO shop_gold_listing (SellerAccount, SellerGuid, Gold, Price) VALUES ({}, {}, {}, {})",
            character->AccountId, character->Guid.GetCounter(), gold, price);

        uint32 listingId = 0;
        if (QueryResult result = CharacterDatabase.PQuery("SELECT MAX(ID) FROM shop_gold_listing WHERE SellerGuid = {}", character->Guid.GetCounter()))
            listingId = (*result)[0].GetUInt32();

        TC_LOG_INFO("entities.player", "Shop: {} ({}) listed {} gold for {} points (listing {})", name, character->Guid.ToString(), gold, price, listingId);
        handler->PSendSysMessage("OK %u", listingId);
        return true;
    }

    static bool HandleGoldCancelCommand(ChatHandler* handler, uint32 listingId)
    {
        QueryResult result = CharacterDatabase.PQuery("SELECT SellerGuid, Gold FROM shop_gold_listing WHERE ID = {}", listingId);
        if (!result)
        {
            handler->SendSysMessage("ERROR такого лота нет (продан или снят)");
            return true;
        }

        uint64 sellerGuid = (*result)[0].GetUInt64();
        uint32 gold = (*result)[1].GetUInt32();

        // the listing goes first (synchronously), so a second cancel or a purchase can not pay the gold out twice; the mail uses prepared
        // statements and goes through the async connection
        CharacterDatabase.DirectPExecute("DELETE FROM shop_gold_listing WHERE ID = {}", listingId);
        if (sellerGuid)
        {
            ObjectGuid seller = ObjectGuid::Create<HighGuid::Player>(sellerGuid);
            CharacterDatabaseTransaction trans = CharacterDatabase.BeginTransaction();
            MailDraft("Золотой рынок", Trinity::StringFormat("Ваш лот на Золотом рынке ({} золота) снят. Золото возвращено.", gold))
                .AddMoney(uint64(gold) * GOLD)
                .SendMailTo(trans, MailReceiver(ObjectAccessor::FindConnectedPlayer(seller), sellerGuid), MailSender(MAIL_NORMAL, UI64LIT(0), MAIL_STATIONERY_GM), MAIL_CHECK_MASK_NOT_RETURNABLE);
            CharacterDatabase.CommitTransaction(trans);
        }

        TC_LOG_INFO("entities.player", "Shop: Gold Market listing {} ({} gold) removed, gold mailed to {}", listingId, gold, sellerGuid);
        handler->PSendSysMessage("OK %u", listingId);
        return true;
    }
};

// realm transfers arriving at this realm: at start and every minute
class classic_character_transfer_world : public WorldScript
{
public:
    classic_character_transfer_world() : WorldScript("classic_character_transfer_world") { }

    void OnStartup() override
    {
        // pvp talent rows of characters that do not exist (an aborted creation or load left them): a new character that gets their
        // guid (creation, realm transfer) fails with a duplicate key. Character deletion itself removes them.
        CharacterDatabase.DirectExecute("DELETE p FROM character_pvp_talent p LEFT JOIN characters c ON c.guid = p.guid WHERE c.guid IS NULL");

        WorldSession::ProcessIncomingCharacterTransfers();
    }

    void OnUpdate(uint32 diff) override
    {
        _timer += diff;
        if (_timer < 60 * IN_MILLISECONDS)
            return;
        _timer = 0;
        WorldSession::ProcessIncomingCharacterTransfers();
    }

private:
    uint32 _timer = 0;
};

void AddSC_classic_shop_commands()
{
    new classic_shop_commandscript();
    new classic_character_transfer_world();
}
