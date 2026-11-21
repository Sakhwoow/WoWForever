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

#include "tc_catch2.h"

#include "../../src/modules/PlayerbotV2/Bot/ClassicHealScope.h"

using Playerbot::Combat::ClassicHeal::EfficiencyRulesApply;
using Playerbot::Combat::ClassicHeal::HealerDamageGateFor;
using Playerbot::Combat::ClassicHeal::HealerMayCrowdControl;
using Playerbot::Combat::ClassicHeal::HybridMaySaveAlly;

// Deadmines 2026-10-09: a level 21 party's priest ran out of mana (the efficiency rules were raid maps only).
TEST_CASE("The healer efficiency rules apply inside a raid map", "[ClassicHealScope]")
{
    CHECK(EfficiencyRulesApply(true, false, false, true));
}

TEST_CASE("The healer efficiency rules apply inside a 5-man dungeon", "[ClassicHealScope]")
{
    CHECK(EfficiencyRulesApply(false, true, false, true));
}

TEST_CASE("The healer efficiency rules stay off in the open world", "[ClassicHealScope]")
{
    CHECK_FALSE(EfficiencyRulesApply(false, false, false, true));
}

TEST_CASE("The healer efficiency rules stay off in a battleground and on a non-vanilla realm", "[ClassicHealScope]")
{
    CHECK_FALSE(EfficiencyRulesApply(false, false, true, true));
    CHECK_FALSE(EfficiencyRulesApply(true, false, true, true));
    CHECK_FALSE(EfficiencyRulesApply(false, true, false, false));
}

// Discord 2026-11-16: "healers are extremely passive in combat" (Playerbot.Behavior.HealerAssist).
TEST_CASE("A dungeon healer with HealerAssist damages after 3 s quiet at 60% mana", "[ClassicHealScope]")
{
    CHECK(HealerDamageGateFor(false, true).quiet_ms == 3000u);
    CHECK(HealerDamageGateFor(false, true).mana_pct == 60);
}

TEST_CASE("A raid healer, or HealerAssist off, keeps 10 s quiet at 90% mana", "[ClassicHealScope]")
{
    CHECK(HealerDamageGateFor(true, true).quiet_ms == 10000u);
    CHECK(HealerDamageGateFor(true, true).mana_pct == 90);
    CHECK(HealerDamageGateFor(false, false).quiet_ms == 10000u);
    CHECK(HealerDamageGateFor(false, false).mana_pct == 90);
}

// rfd_tutenkash 127: a healer's holds in a fight drained it to 15% mana and the tank died.
TEST_CASE("A healer crowd-controls only with HealerAssist, outside raids, at 60% mana and everyone at 70%", "[ClassicHealScope]")
{
    CHECK(HealerMayCrowdControl(true, false, 60, 70));
    CHECK(HealerMayCrowdControl(true, false, 100, 100));
    CHECK_FALSE(HealerMayCrowdControl(true, false, 59, 100));
    CHECK_FALSE(HealerMayCrowdControl(true, false, 100, 69));
    CHECK_FALSE(HealerMayCrowdControl(true, true, 100, 100));
    CHECK_FALSE(HealerMayCrowdControl(false, false, 100, 100));
}

// leenergetic, Discord 2026-11-17: "When in a DPS spec, Paladins don't cast heals on allies at all".
TEST_CASE("A damage-spec paladin saves a member at 35% with no healer covering, at 20% always", "[ClassicHealScope]")
{
    CHECK(HybridMaySaveAlly(false, 35, false, 20));
    CHECK_FALSE(HybridMaySaveAlly(false, 36, false, 100));
    CHECK_FALSE(HybridMaySaveAlly(false, 30, true, 100));     // a healer covers him: not yet
    CHECK(HybridMaySaveAlly(false, 20, true, 100));           // the last moment: whoever covers him
    CHECK_FALSE(HybridMaySaveAlly(false, 10, false, 19));     // no mana for it
    CHECK_FALSE(HybridMaySaveAlly(true, 10, false, 100));     // a raid keeps its healers' plan
}
