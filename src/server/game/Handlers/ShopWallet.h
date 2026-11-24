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

#ifndef TRINITYCORE_SHOP_WALLET_H
#define TRINITYCORE_SHOP_WALLET_H

#include "DatabaseEnv.h"
#include "Define.h"
#include "StringFormat.h"
#include <string>
#include <string_view>

// Classic 1.60 in-game Store: shop points live in the site bonus ledger (acore_site.account_coins).
// The site maps the game account to a site user in acore_site.forever_shop_account_link, so the game
// account id is all the core needs. Debit/credit go through stored procedures that serialize per
// account, check the balance and keep an idempotency key in acore_site.forever_shop_wallet_tx.
//
// The procedures return no result set on purpose: the core calls the procedure and then reads the
// forever_shop_wallet_tx row, so the connection never sees multiple result sets ("commands out of sync").
//
// Requires the core's LoginDatabase user to have SELECT/INSERT on acore_site.account_coins,
// acore_site.forever_shop_account_link, acore_site.forever_shop_wallet_tx and EXECUTE on the procedures
// (see docs/forever-shop-wallet-deploy.md).
namespace ShopWallet
{
struct Result
{
    bool ok = false;
    int32 code = -1;          // 1 ok, -2 not linked, -3 not enough points, -4 invalid amount, -1 sql error
    uint32 balance = 0;
};

inline std::string Escape(std::string_view value)
{
    std::string escaped(value);
    LoginDatabase.EscapeString(escaped);
    return escaped;
}

/// Current shop points of the game account (site bonus balance of the linked site user).
inline uint32 Balance(uint32 gameAccountId)
{
    if (QueryResult result = LoginDatabase.PQuery(
        "SELECT COALESCE(SUM(c.`coins`), 0) FROM `acore_site`.`account_coins` c "
        "JOIN `acore_site`.`forever_shop_account_link` l ON l.`site_user_id` = c.`account_id` "
        "WHERE l.`game_account_id` = {}", gameAccountId))
    {
        int64 balance = (*result)[0].GetInt64();
        return balance > 0 ? uint32(balance) : 0;
    }
    return 0;
}

/// Whether the game account is linked to a site user (required to spend and receive shop points).
inline bool IsLinked(uint32 gameAccountId)
{
    return LoginDatabase.PQuery(
        "SELECT 1 FROM `acore_site`.`forever_shop_account_link` WHERE `game_account_id` = {} LIMIT 1",
        gameAccountId) != nullptr;
}

/// Call forever_shop_debit / forever_shop_credit and read the resulting wallet transaction.
/// key is a non-empty idempotency key: a repeated call with the same key never charges twice.
inline Result Call(std::string_view procedure, uint32 gameAccountId, uint32 amount, std::string_view reason, std::string_view key)
{
    Result result;
    if (amount == 0 || key.empty())
    {
        result.code = -4;
        return result;
    }

    std::string reasonEscaped = Escape(reason);
    std::string keyEscaped = Escape(key);

    // The procedure writes the ledger and the tx row in one transaction and returns no result set.
    LoginDatabase.PQuery("CALL `acore_site`.`{}` ({}, {}, '{}', '{}')",
        procedure, gameAccountId, amount, reasonEscaped, keyEscaped);

    if (LoginDatabase.PQuery("SELECT 1 FROM `acore_site`.`forever_shop_wallet_tx` WHERE `tx_key` = '{}'", keyEscaped))
    {
        result.ok = true;
        result.code = 1;
        result.balance = Balance(gameAccountId);
        return result;
    }

    if (!IsLinked(gameAccountId))
    {
        result.code = -2;
        return result;
    }

    result.balance = Balance(gameAccountId);
    result.code = result.balance < amount ? -3 : -1;
    return result;
}

/// Atomically take shop points from the linked site account. key is an idempotency key (non-empty).
inline Result Debit(uint32 gameAccountId, uint32 amount, std::string_view reason, std::string_view key)
{
    return Call("forever_shop_debit", gameAccountId, amount, reason, key);
}

/// Add shop points to the linked site account (refund, Gold Market payout, GM command).
inline Result Credit(uint32 gameAccountId, uint32 amount, std::string_view reason, std::string_view key)
{
    return Call("forever_shop_credit", gameAccountId, amount, reason, key);
}
}

#endif // TRINITYCORE_SHOP_WALLET_H
