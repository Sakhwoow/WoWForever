-- Forever (Classic 1.60): данные официальных снифов, слияние полного файла 01_creature_template.sql с живой базой (gen/merge_full.py).
-- Только изменения снифов относительно прошлой выкладки (2026_10_20_00_world_forever_actual_sniff_01_creature_template.sql): новые строки, изменившиеся ячейки, изменившиеся списки.
-- Доработки, сделанные после прошлой выкладки, и номера уже выложенных спавнов сохраняются. Можно запускать повторно.

INSERT IGNORE INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES
(273264,12,12),
(277766,12,12);
INSERT IGNORE INTO `creature_equip_template` (`CreatureID`,`ID`,`ItemID1`,`AppearanceModID1`,`ItemVisual1`,`ItemID2`,`AppearanceModID2`,`ItemVisual2`,`ItemID3`,`AppearanceModID3`,`ItemVisual3`,`VerifiedBuild`) VALUES
(277766,1,1983,0,0,0,0,0,0,0,0,70450);
INSERT IGNORE INTO `creature_model_info` (`DisplayID`,`BoundingRadius`,`CombatReach`,`DisplayID_Other_Gender`,`VerifiedBuild`) VALUES
(146926,0.306e0,1.5e0,0,70450),
(147351,0.383e0,1.5e0,0,70450),
(149023,0.383e0,1.5e0,0,70450);
INSERT IGNORE INTO `creature_template` (`entry`,`KillCredit1`,`KillCredit2`,`name`,`femaleName`,`subname`,`TitleAlt`,`IconName`,`RequiredExpansion`,`VignetteID`,`faction`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`Classification`,`dmgschool`,`BaseAttackTime`,`RangeAttackTime`,`BaseVariance`,`RangeVariance`,`unit_class`,`unit_flags`,`unit_flags2`,`unit_flags3`,`family`,`trainer_class`,`type`,`VehicleId`,`AIName`,`MovementType`,`ExperienceModifier`,`RacialLeader`,`movementId`,`WidgetSetID`,`WidgetSetUnitConditionID`,`RegenHealth`,`CreatureImmunitiesId`,`flags_extra`,`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(273264,0,0,'Талисара Низинный Ветер',NULL,NULL,NULL,NULL,0,0,3600,0,1.0e0,1.14286e0,1.0e0,0,0,2000,2000,1.0e0,1.0e0,1,33536,2048,0,0,0,7,0,'',0,1.0e0,0,1693,0,0,1,0,0,'',NULL,70450),
(277766,0,0,'Энджи Сайлас',NULL,NULL,NULL,NULL,0,0,68,0,1.0e0,1.14286e0,1.0e0,0,0,2000,2000,1.0e0,1.0e0,2,33280,2048,0,0,0,7,0,'',0,1.0e0,0,1693,0,0,1,0,0,'',NULL,70450);
UPDATE `creature_template` SET `KillCredit1` = 1746, `VerifiedBuild` = 70450 WHERE `entry` = 251001 AND (NOT (`KillCredit1` <=> 1746));
UPDATE `creature_template` SET `npcflag` = 4307, `VerifiedBuild` = 70450 WHERE `entry` = 251993 AND (NOT (`npcflag` <=> 4307));
UPDATE `creature_template` SET `npcflag` = 51, `VerifiedBuild` = 70450 WHERE `entry` = 254084 AND (NOT (`npcflag` <=> 51));
UPDATE `creature_template` SET `KillCredit1` = 1746, `VerifiedBuild` = 70450 WHERE `entry` = 272101 AND (NOT (`KillCredit1` <=> 1746));
UPDATE `creature_template` SET `KillCredit1` = 1746, `VerifiedBuild` = 70450 WHERE `entry` = 275103 AND (NOT (`KillCredit1` <=> 1746));
INSERT IGNORE INTO `creature_template_difficulty` (`Entry`,`DifficultyID`,`LevelScalingDeltaMin`,`LevelScalingDeltaMax`,`ContentTuningID`,`HealthScalingExpansion`,`HealthModifier`,`ManaModifier`,`ArmorModifier`,`DamageModifier`,`CreatureDifficultyID`,`TypeFlags`,`TypeFlags2`,`TypeFlags3`,`LootID`,`PickPocketLootID`,`SkinLootID`,`GoldMin`,`GoldMax`,`StaticFlags1`,`StaticFlags2`,`StaticFlags3`,`StaticFlags4`,`StaticFlags5`,`StaticFlags6`,`StaticFlags7`,`StaticFlags8`,`VerifiedBuild`) VALUES
(273264,0,0,0,0,0,1.0e0,1.0e0,1.0e0,1.0e0,357049,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,70450),
(277766,0,0,0,0,0,1.25e0,1.0e0,1.0e0,1.0e0,361841,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,70450);
INSERT IGNORE INTO `creature_template_locale` (`entry`,`locale`,`Name`,`NameAlt`,`Title`,`TitleAlt`,`VerifiedBuild`) VALUES
(273264,'ruRU','Талисара Низинный Ветер',NULL,NULL,NULL,70450),
(277766,'ruRU','Энджи Сайлас',NULL,NULL,NULL,70450);
UPDATE `creature_template_locale` SET `Name` = 'Мессана Поднебесный Ветер', `VerifiedBuild` = 70450 WHERE `entry` = 257022 AND `locale` = 'ruRU' AND (NOT (CAST(`Name` AS BINARY) <=> CAST('Мессана Поднебесный Ветер' AS BINARY)));
UPDATE `creature_template_locale` SET `NameAlt` = 'Израненный страж смерти', `VerifiedBuild` = 70450 WHERE `entry` = 259377 AND `locale` = 'ruRU' AND (NOT (CAST(`NameAlt` AS BINARY) <=> CAST('Израненный страж смерти' AS BINARY)));
UPDATE `creature_template_locale` SET `Name` = 'Порочный фанатик', `NameAlt` = 'Порочный фанатик', `VerifiedBuild` = 70450 WHERE `entry` = 259433 AND `locale` = 'ruRU' AND (NOT (CAST(`Name` AS BINARY) <=> CAST('Порочный фанатик' AS BINARY)) OR NOT (CAST(`NameAlt` AS BINARY) <=> CAST('Порочный фанатик' AS BINARY)));
UPDATE `creature_template_locale` SET `Name` = 'Порочный чернорабочий', `NameAlt` = 'Порочная чернорабочая', `VerifiedBuild` = 70450 WHERE `entry` = 259434 AND `locale` = 'ruRU' AND (NOT (CAST(`Name` AS BINARY) <=> CAST('Порочный чернорабочий' AS BINARY)) OR NOT (CAST(`NameAlt` AS BINARY) <=> CAST('Порочная чернорабочая' AS BINARY)));
UPDATE `creature_template_locale` SET `Name` = 'Маргарет Уивер', `Title` = 'Учитель основ снятия шкур', `VerifiedBuild` = 70450 WHERE `entry` = 267324 AND `locale` = 'ruRU' AND (NOT (CAST(`Name` AS BINARY) <=> CAST('Маргарет Уивер' AS BINARY)) OR NOT (CAST(`Title` AS BINARY) <=> CAST('Учитель основ снятия шкур' AS BINARY)));
UPDATE `creature_template_locale` SET `Title` = 'Учитель основ травничества', `VerifiedBuild` = 70450 WHERE `entry` = 267326 AND `locale` = 'ruRU' AND (NOT (CAST(`Title` AS BINARY) <=> CAST('Учитель основ травничества' AS BINARY)));
UPDATE `creature_template_locale` SET `Name` = 'Каурый конь-скелет', `VerifiedBuild` = 70450 WHERE `entry` = 267364 AND `locale` = 'ruRU' AND (NOT (CAST(`Name` AS BINARY) <=> CAST('Каурый конь-скелет' AS BINARY)));
UPDATE `creature_template_locale` SET `Name` = 'Оплетенный Отрекшийся', `VerifiedBuild` = 70450 WHERE `entry` = 271961 AND `locale` = 'ruRU' AND (NOT (CAST(`Name` AS BINARY) <=> CAST('Оплетенный Отрекшийся' AS BINARY)));
UPDATE `creature_template_locale` SET `Name` = 'Искатель приключений – Отрекшийся', `NameAlt` = 'Искательница приключений – Отрекшаяся', `VerifiedBuild` = 70450 WHERE `entry` = 271968 AND `locale` = 'ruRU' AND (NOT (CAST(`Name` AS BINARY) <=> CAST('Искатель приключений – Отрекшийся' AS BINARY)) OR NOT (CAST(`NameAlt` AS BINARY) <=> CAST('Искательница приключений – Отрекшаяся' AS BINARY)));
UPDATE `creature_template_locale` SET `Name` = 'Стражница смерти Лизавета', `VerifiedBuild` = 70450 WHERE `entry` = 272101 AND `locale` = 'ruRU' AND (NOT (CAST(`Name` AS BINARY) <=> CAST('Стражница смерти Лизавета' AS BINARY)));
UPDATE `creature_template_locale` SET `Name` = 'Страж смерти – ветеран', `NameAlt` = 'Страж смерти – ветеран', `VerifiedBuild` = 70450 WHERE `entry` = 275103 AND `locale` = 'ruRU' AND (NOT (CAST(`Name` AS BINARY) <=> CAST('Страж смерти – ветеран' AS BINARY)) OR NOT (CAST(`NameAlt` AS BINARY) <=> CAST('Страж смерти – ветеран' AS BINARY)));
DELETE FROM `creature_template_model` WHERE `CreatureID` = 273264;
INSERT IGNORE INTO `creature_template_model` (`CreatureID`,`Idx`,`CreatureDisplayID`,`DisplayScale`,`Probability`,`VerifiedBuild`) VALUES
(273264,0,147351,1.0e0,1.0e0,70450);
DELETE FROM `creature_template_model` WHERE `CreatureID` = 277766;
INSERT IGNORE INTO `creature_template_model` (`CreatureID`,`Idx`,`CreatureDisplayID`,`DisplayScale`,`Probability`,`VerifiedBuild`) VALUES
(277766,0,149023,1.0e0,1.0e0,70450);
