-- Ghost Wolf: back to 2645 (undoes 2026_11_13_82). The 70938 client has no SkillLineAbility row for 1238640, so the spell is not in
-- the shaman's spellbook and the client will not cast it; live sends that row as a hotfix, we do not have it. Trainers teach 2645
-- again until we have the row (or a client that ships it); characters move back in characters 2026_11_15_91. Safe to run again.
INSERT IGNORE INTO `trainer_spell` (`TrainerId`,`SpellId`,`MoneyCost`,`ReqSkillLine`,`ReqSkillRank`,`ReqAbility1`,`ReqAbility2`,`ReqAbility3`,`ReqLevel`,`VerifiedBuild`)
SELECT `TrainerId`,2645,`MoneyCost`,`ReqSkillLine`,`ReqSkillRank`,`ReqAbility1`,`ReqAbility2`,`ReqAbility3`,`ReqLevel`,0 FROM `trainer_spell` WHERE `SpellId`=1238640;
DELETE FROM `trainer_spell` WHERE `SpellId`=1238640;
UPDATE `trainer_spell` SET `ReqAbility1`=2645 WHERE `ReqAbility1`=1238640;
UPDATE `trainer_spell` SET `ReqAbility2`=2645 WHERE `ReqAbility2`=1238640;
UPDATE `trainer_spell` SET `ReqAbility3`=2645 WHERE `ReqAbility3`=1238640;
