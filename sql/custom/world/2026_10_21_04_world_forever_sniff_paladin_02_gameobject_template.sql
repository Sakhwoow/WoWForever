-- Forever (Classic 1.60): данные официальных снифов, слияние полного файла 02_gameobject_template.sql с живой базой (gen/merge_full.py).
-- Только изменения снифов относительно прошлой выкладки (2026_10_20_00_world_forever_actual_sniff_02_gameobject_template.sql): новые строки, изменившиеся ячейки, изменившиеся списки.
-- Доработки, сделанные после прошлой выкладки, и номера уже выложенных спавнов сохраняются. Можно запускать повторно.

INSERT IGNORE INTO `gameobject_template` (`entry`,`type`,`displayId`,`name`,`IconName`,`castBarCaption`,`unk1`,`size`,`Data0`,`Data1`,`Data2`,`Data3`,`Data4`,`Data5`,`Data6`,`Data7`,`Data8`,`Data9`,`Data10`,`Data11`,`Data12`,`Data13`,`Data14`,`Data15`,`Data16`,`Data17`,`Data18`,`Data19`,`Data20`,`Data21`,`Data22`,`Data23`,`Data24`,`Data25`,`Data26`,`Data27`,`Data28`,`Data29`,`Data30`,`Data31`,`Data32`,`Data33`,`Data34`,`ContentTuningId`,`RequiredLevel`,`AIName`,`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(706992,8,1287,'Обычный костер','','','',0.1e0,2341,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',NULL,70450);
INSERT IGNORE INTO `gameobject_template_addon` (`entry`,`faction`,`flags`,`mingold`,`maxgold`,`artkit0`,`artkit1`,`artkit2`,`artkit3`,`artkit4`,`WorldEffectID`,`AIAnimKitID`) VALUES
(706178,0,4,0,0,0,0,0,0,0,0,0),
(706992,35,0,0,0,0,0,0,0,0,0,0);
INSERT IGNORE INTO `gameobject_template_locale` (`entry`,`locale`,`name`,`castBarCaption`,`unk1`,`VerifiedBuild`) VALUES
(706992,'ruRU','Обычный костер',NULL,NULL,70450);
UPDATE `gameobject_template_locale` SET `name` = 'Ученик фармацевтического общества', `VerifiedBuild` = 70450 WHERE `entry` = 405879 AND `locale` = 'ruRU' AND (NOT (CAST(`name` AS BINARY) <=> CAST('Ученик фармацевтического общества' AS BINARY)));
UPDATE `gameobject_template_locale` SET `name` = 'Ловушка силовых линий (задание)', `VerifiedBuild` = 70450 WHERE `entry` = 602739 AND `locale` = 'ruRU' AND (NOT (CAST(`name` AS BINARY) <=> CAST('Ловушка силовых линий (задание)' AS BINARY)));
UPDATE `gameobject_template_locale` SET `name` = 'Силовая линия', `VerifiedBuild` = 70450 WHERE `entry` = 613248 AND `locale` = 'ruRU' AND (NOT (CAST(`name` AS BINARY) <=> CAST('Силовая линия' AS BINARY)));
