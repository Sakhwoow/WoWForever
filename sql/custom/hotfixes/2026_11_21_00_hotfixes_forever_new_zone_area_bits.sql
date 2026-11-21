-- New Classic 1.60 zones (from the client's live hotfix data) carry an AreaBit far outside the server's
-- explored-zone bit field: Riverglades 12221, Shen'dralas / Magram Front / Outcast Hideaway / Bristleback
-- Retreat / Evenshade's Overlook 13302-13307, Forlorn Gardens 13306. Discovering such a location made
-- Player::CheckAreaExplore extend the player's explored-zone bit vector for an area the client cannot store
-- (and, before the core guard, it was the only place in the code that wrote to that field without a bounds
-- check). The new-zone rows are reset to the bit the client itself uses for such areas, 0; the core now also
-- ignores out-of-range and negative AreaBit values instead of touching the field.
--
-- Safe to run again.

UPDATE `area_table` SET `AreaBit` = 0 WHERE `ID` IN (16591, 16651, 16675, 16676, 16677, 16678, 16742);

-- Rows whose AreaBit is still outside the client's explored-zone field:
-- SELECT ID, ZoneName, AreaName, AreaBit FROM `area_table` WHERE AreaBit < 0 OR AreaBit >= 4096;
