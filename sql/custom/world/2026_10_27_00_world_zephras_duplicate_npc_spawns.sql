-- Zephras Isle: Aamelia Windfield (252800) and the Malfunctioning Cyclone Construct (250929) each had two spawns
-- a hundred-odd yards apart; Wowhead Forever's community sightings (7 logged positions) cluster into a single spot
-- for each, confirming the second spawn of each is a duplicate (our own bug reports hc#94, hc#95). Owner confirmed
-- which copy to keep does not matter; keeping the lower guid of each pair.
DELETE FROM `creature` WHERE `guid` IN (21101144, 21100152);
