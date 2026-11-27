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

#ifndef TRINITYCORE_SHOP_BOOST_H
#define TRINITYCORE_SHOP_BOOST_H

#include "Define.h"

class Player;

// Classic 1.60 in-game Store: a character raised by a boost token is changed in the database while it is offline (level only),
// so it has none of the spells, weapon and armor skills its class trainers teach. The boost marks the character
// (characters.shop_boost_pending); its next login teaches them free of charge (classic_shop_commands.cpp).
namespace ShopBoost
{
/// Creates the table if needed and loads the marked characters (world startup).
TC_GAME_API void LoadPending();
/// Marks a boosted character (boost type) for its class spells, skills and set at its next login.
TC_GAME_API void MarkPending(uint64 guid, uint32 boostType);
/// True once (and unmarks the character, giving its boost type) if it was marked.
TC_GAME_API bool TakePending(uint64 guid, uint32& boostType);
/// Teaches everything the trainers of the player's class teach at its level (professions and pet trainers excluded), raises the weapon
/// skills to the level's cap, gives the riding skill and the race's ground mount. Returns the count.
TC_GAME_API uint32 LearnClassSpells(Player* player);
/// The boost's set (world.shop_boost_item) for the player's class: worn where it fits, else in the bags, else mailed; the gold
/// (Classic.Shop.BoostGold) goes straight to the purse. Returns the number of items given.
TC_GAME_API uint32 GrantBoostSet(Player* player, uint32 boostType);

/// Extra setup a module registers to run at the end of LearnClassSpells (the bot module: the class abilities quests teach and the class's
/// talent build). Without a module the boost simply does without.
using PostBoostHook = void (*)(Player* player);
TC_GAME_API void SetPostBoostHook(PostBoostHook hook);
}

#endif // TRINITYCORE_SHOP_BOOST_H
