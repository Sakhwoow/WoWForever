-- Ghost Wolf: back to 2645 (undoes 2026_11_13_80, see world 2026_11_15_90). Characters (players and bots) who know 1238640 get 2645
-- in its place, and their action buttons follow. Run on every realm's characters database. Safe to run again.
INSERT IGNORE INTO `character_spell` (`guid`,`spell`,`active`,`disabled`)
SELECT `guid`,2645,`active`,`disabled` FROM `character_spell` WHERE `spell`=1238640;
DELETE FROM `character_spell` WHERE `spell`=1238640;
UPDATE `character_action` SET `action`=2645 WHERE `action`=1238640 AND `type`=0;
