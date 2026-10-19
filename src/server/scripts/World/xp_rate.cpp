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

// Personal experience rate: every player of the Normal (PvE) realm may pick x1..x5 with ".xp rate <number>"
// (".xp rate" shows the current one, ".xp rate default" goes back to x1). The multiplier applies to all experience
// the player earns (kills, quests, exploration) through the OnGiveXP hook and is kept in `character_xp_rate`
// (characters database), so it survives relogs and restarts. Hardcore realms (Classic.Hardcore = 1) ignore it.
//
// worldserver.conf: XpRateCommand.Enable (1), XpRateCommand.Min (1), XpRateCommand.Max (5).

#include "Chat.h"
#include "ChatCommand.h"
#include "Config.h"
#include "DatabaseEnv.h"
#include "Player.h"
#include "RBAC.h"
#include "ScriptMgr.h"
#include "StringConvert.h"
#include "StringFormat.h"
#include "WorldSession.h"
#include <algorithm>
#include <mutex>
#include <unordered_map>

using namespace Trinity::ChatCommands;

namespace
{
    std::mutex RatesLock;
    std::unordered_map<uint64, uint32> PersonalRates;   // character guid -> chosen rate, only players with a rate above 1

    bool Enabled()
    {
        return sConfigMgr->GetBoolDefault("XpRateCommand.Enable", true) && !sConfigMgr->GetBoolDefault("Classic.Hardcore", false);
    }

    uint32 MinRate()
    {
        return std::max<int32>(1, sConfigMgr->GetIntDefault("XpRateCommand.Min", 1));
    }

    uint32 MaxRate()
    {
        return std::max<uint32>(MinRate(), uint32(std::max<int32>(1, sConfigMgr->GetIntDefault("XpRateCommand.Max", 5))));
    }

    uint32 GetRate(uint64 guid)
    {
        std::lock_guard<std::mutex> guard(RatesLock);
        auto itr = PersonalRates.find(guid);
        return itr != PersonalRates.end() ? itr->second : 1;
    }

    void SetRate(Player* player, uint32 rate)
    {
        uint64 const guid = player->GetGUID().GetCounter();
        {
            std::lock_guard<std::mutex> guard(RatesLock);
            if (rate <= 1)
                PersonalRates.erase(guid);
            else
                PersonalRates[guid] = rate;
        }

        if (rate <= 1)
            CharacterDatabase.PExecute("DELETE FROM character_xp_rate WHERE guid = {}", guid);
        else
            CharacterDatabase.PExecute("REPLACE INTO character_xp_rate (guid, rate) VALUES ({}, {})", guid, rate);
    }
}

class xp_rate_PlayerScript : public PlayerScript
{
public:
    xp_rate_PlayerScript() : PlayerScript("xp_rate_PlayerScript") { }

    void OnLogin(Player* player, bool /*firstLogin*/) override
    {
        if (!Enabled())
            return;

        uint64 const guid = player->GetGUID().GetCounter();
        QueryResult result = CharacterDatabase.PQuery("SELECT rate FROM character_xp_rate WHERE guid = {}", guid);
        if (!result)
            return;

        // the allowed range may have been changed by the administrator since the rate was chosen
        uint32 const rate = std::clamp<uint32>((*result)[0].GetUInt8(), MinRate(), MaxRate());
        std::lock_guard<std::mutex> guard(RatesLock);
        if (rate > 1)
            PersonalRates[guid] = rate;
        else
            PersonalRates.erase(guid);
    }

    void OnLogout(Player* player) override
    {
        std::lock_guard<std::mutex> guard(RatesLock);
        PersonalRates.erase(player->GetGUID().GetCounter());
    }

    void OnDelete(ObjectGuid guid, uint32 /*accountId*/) override
    {
        CharacterDatabase.PExecute("DELETE FROM character_xp_rate WHERE guid = {}", guid.GetCounter());
    }

    void OnGiveXP(Player* player, uint32& amount, Unit* /*victim*/) override
    {
        uint32 const rate = GetRate(player->GetGUID().GetCounter());
        if (rate > 1)
            amount *= rate;
    }
};

class xp_rate_commandscript : public CommandScript
{
public:
    xp_rate_commandscript() : CommandScript("xp_rate_commandscript") { }

    std::span<ChatCommandBuilder const> GetCommands() const override
    {
        static ChatCommandTable commandTable =
        {
            // every player, like .commands
            { "xp rate", HandleXpRateCommand, rbac::RBAC_PERM_COMMAND_COMMANDS, Console::No },
        };
        return commandTable;
    }

    static bool HandleXpRateCommand(ChatHandler* handler, Tail args)
    {
        Player* player = handler->GetSession()->GetPlayer();
        ChatHandler chat(handler->GetSession());

        if (!Enabled())
        {
            chat.SendSysMessage("Личный рейт опыта на этом реалме недоступен.");
            return true;
        }

        uint32 const minRate = MinRate();
        uint32 const maxRate = MaxRate();
        std::string_view arg = args;
        while (!arg.empty() && arg.front() == ' ')
            arg.remove_prefix(1);
        while (!arg.empty() && arg.back() == ' ')
            arg.remove_suffix(1);

        if (arg.empty())
        {
            chat.SendSysMessage(Trinity::StringFormat("Ваш рейт опыта: x{}. Выбрать: .xp rate <число от {} до {}>, сбросить: .xp rate default.",
                GetRate(player->GetGUID().GetCounter()), minRate, maxRate));
            return true;
        }

        if (arg == "default" || arg == "0")
        {
            SetRate(player, 1);
            chat.SendSysMessage("Рейт опыта сброшен: x1.");
            return true;
        }

        Optional<uint32> const requested = Trinity::StringTo<uint32>(arg);
        if (!requested || *requested < minRate || *requested > maxRate)
        {
            chat.SendSysMessage(Trinity::StringFormat("Рейт опыта должен быть числом от {} до {}.", minRate, maxRate));
            return true;
        }

        SetRate(player, *requested);
        chat.SendSysMessage(Trinity::StringFormat("Рейт опыта установлен: x{}. Он действует на убийства, задания и исследование.", *requested));
        return true;
    }
};

void AddSC_xp_rate()
{
    new xp_rate_PlayerScript();
    new xp_rate_commandscript();
}
