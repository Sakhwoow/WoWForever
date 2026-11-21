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

#include "../../src/modules/PlayerbotV2/Bot/World/GrindSpot.h"

#include <set>

using namespace Playerbot::V2::World;

namespace
{
std::vector<GrindSample> Camp(std::uint32_t map, float cx, float cy, std::uint32_t level, int n)
{
    std::vector<GrindSample> v;
    for (int i = 0; i < n; ++i)
        v.push_back({ map, cx + float(i % 4) * 5.f, cy + float(i / 4) * 5.f, 10.f, level });
    return v;
}
}

TEST_CASE("GrindSpot: a cell with enough mobs is a spot at their average level, strays are not", "[grindspot]")
{
    auto s = Camp(0, -3000.f, -1040.f, 20, 10);
    auto stray = Camp(0, -2000.f, -500.f, 20, 3);
    s.insert(s.end(), stray.begin(), stray.end());
    auto spots = BuildGrindSpots(s);
    REQUIRE(spots.size() == 1);
    CHECK(spots[0].level == 20);
    CHECK(spots[0].mobs == 10);
    CHECK(std::abs(spots[0].x + 3000.f) < 30.f);
}

TEST_CASE("GrindSpot: a bot only gets a spot of its level, on its map, near its town", "[grindspot]")
{
    auto s = Camp(0, -3000.f, -1040.f, 21, 10);
    auto far = Camp(0, 5000.f, 5000.f, 21, 10);
    auto other_map = Camp(1, -3000.f, -1040.f, 21, 10);
    auto grey = Camp(0, -3100.f, -1100.f, 8, 10);
    s.insert(s.end(), far.begin(), far.end());
    s.insert(s.end(), other_map.begin(), other_map.end());
    s.insert(s.end(), grey.begin(), grey.end());
    auto spots = BuildGrindSpots(s);
    int const i = PickGrindSpot(spots, 0, -3796.f, -777.f, 22, 7);
    REQUIRE(i >= 0);
    CHECK(spots[i].map == 0);
    CHECK(spots[i].level == 21);
    CHECK(PickGrindSpot(spots, 0, -3796.f, -777.f, 35, 7) == -1);
}

TEST_CASE("GrindSpot: a crowd of one level spreads over every camp of the zone", "[grindspot]")
{
    std::vector<GrindSample> s;
    for (int k = 0; k < 4; ++k)
    {
        auto c = Camp(0, -3685.f + float(k) * 180.f, -1040.f, 22, 10);
        s.insert(s.end(), c.begin(), c.end());
    }
    auto spots = BuildGrindSpots(s);
    REQUIRE(spots.size() == 4);
    std::set<int> used;
    for (std::uint64_t bot = 1; bot <= 40; ++bot)
        used.insert(PickGrindSpot(spots, 0, -3796.f, -777.f, 22, bot));
    CHECK(used.size() == 4);
}

TEST_CASE("GrindSpot: the mob supply counts the camps of the level in reach", "[grindspot]")
{
    std::vector<GrindSample> s;
    for (int k = 0; k < 3; ++k)
    {
        auto c = Camp(0, 2000.f + float(k) * 180.f, -4000.f, 55, 12);
        s.insert(s.end(), c.begin(), c.end());
    }
    auto far = Camp(0, 2000.f, -2000.f, 55, 12);       // 2000 yards away
    auto grey = Camp(0, 2100.f, -4100.f, 45, 12);      // ten levels lower
    auto other_map = Camp(1, 2000.f, -4000.f, 55, 12);
    s.insert(s.end(), far.begin(), far.end());
    s.insert(s.end(), grey.begin(), grey.end());
    s.insert(s.end(), other_map.begin(), other_map.end());
    auto spots = BuildGrindSpots(s);
    CHECK(MobSupplyNear(spots, 0, 2100.f, -4000.f, 55, 600.f) == 36);
    CHECK(MobSupplyNear(spots, 0, 2100.f, -4000.f, 57, 600.f) == 36);   // within the level spread
    CHECK(MobSupplyNear(spots, 0, 2100.f, -4000.f, 30, 600.f) == 0);
}

TEST_CASE("GrindSpot: the supply cap is one bot per MobsPerBot mobs, with a floor", "[grindspot]")
{
    CHECK(SupplyBotCap(150, 10, 5) == 15);
    CHECK(SupplyBotCap(36, 10, 5) == 5);     // the floor
    CHECK(SupplyBotCap(0, 10, 5) == 5);
    CHECK(SupplyBotCap(150, 0, 5) == UINT32_MAX);   // MobsPerBot 0: no cap
}
