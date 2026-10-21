-- Classic 1.60 (WoW Forever): расстановка существ по снифам: перенос/добавление стабильных спавнов, тип движения, стойка и эмоция
-- Источник: снифы официального сервера Classic (бета «актуал»), сборки 70245, 70291, 70338, 70425, 70450; сгенерировано ForeverSniffTools.
-- UPDATE с защитным условием; INSERT NOT EXISTS / IGNORE; новые guid с 22600000.
-- Повторный запуск безопасен (проверено прогоном дважды на копии снимка БД).

UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0.0 WHERE `guid` = '20089927' AND (`MovementType` = 1) AND (NOT (`MovementType` <=> 0) OR ABS(`wander_distance` - 0.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '25357784' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20090043' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '20089444' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '20090127' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '20090129' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '20045544' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '25346632' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '25346484' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20086658' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20086621' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '20090075' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '20090084' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '25360360' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '25360336' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '20086613' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100573' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20028708' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20039035' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20041902' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20042076' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20038330' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20044839' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20044960' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '20028711' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20042014' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20044695' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20044974' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '20028468' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20044735' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20044859' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20044721' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20044725' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20044886' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20044891' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20044897' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20038333' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20044964' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20038324' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20029809' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0.0 WHERE `guid` = '20029812' AND (`MovementType` = 1) AND (NOT (`MovementType` <=> 0) OR ABS(`wander_distance` - 0.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '20028441' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '20044670' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '20028442' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20044715' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0.0 WHERE `guid` = '21200461' AND (`MovementType` = 1) AND (NOT (`MovementType` <=> 0) OR ABS(`wander_distance` - 0.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20044593' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20037891' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20029909' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0.0 WHERE `guid` = '20044882' AND (`MovementType` = 1) AND (NOT (`MovementType` <=> 0) OR ABS(`wander_distance` - 0.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '25180588' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '20045167' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0.0 WHERE `guid` = '20045053' AND (`MovementType` = 1) AND (NOT (`MovementType` <=> 0) OR ABS(`wander_distance` - 0.0) > 0.01);
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0.0 WHERE `guid` = '20044756' AND (`MovementType` = 1) AND (NOT (`MovementType` <=> 0) OR ABS(`wander_distance` - 0.0) > 0.01);
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0.0 WHERE `guid` = '20044752' AND (`MovementType` = 1) AND (NOT (`MovementType` <=> 0) OR ABS(`wander_distance` - 0.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '20038290' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20044548' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '21200482' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20029924' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 16.0 WHERE `guid` = '21100065' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 16.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 11.0 WHERE `guid` = '21500263' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 11.0) > 0.01);
UPDATE `gameobject` SET `rotation2` = -0.748956, `rotation3` = 0.66262 WHERE `guid` = '30055458' AND (ABS(`rotation2` - -0.748956) > 0.0005 OR ABS(`rotation3` - 0.66262) > 0.0005);
INSERT INTO `creature` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnDifficulties`,`phaseUseFlags`,`PhaseId`,`PhaseGroup`,`terrainSwapMap`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`wander_distance`,`currentwaypoint`,`curHealthPct`,`MovementType`,`npcflag`,`unit_flags`,`unit_flags2`,`unit_flags3`,`ScriptName`,`StringId`,`VerifiedBuild`)
SELECT `guid`,`id`,`map`,`zoneId`,`areaId`,`spawnDifficulties`,`phaseUseFlags`,`PhaseId`,`PhaseGroup`,`terrainSwapMap`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`wander_distance`,`currentwaypoint`,`curHealthPct`,`MovementType`,`npcflag`,`unit_flags`,`unit_flags2`,`unit_flags3`,`ScriptName`,`StringId`,`VerifiedBuild`
FROM (
SELECT 22600000 AS `guid`, 117 AS `id`, 0 AS `map`, 0 AS `zoneId`, 0 AS `areaId`, '0' AS `spawnDifficulties`, 0 AS `phaseUseFlags`, 0 AS `PhaseId`, 0 AS `PhaseGroup`, -1 AS `terrainSwapMap`, 0 AS `modelid`, 1 AS `equipment_id`, -9754.67676 AS `position_x`, 1191.72229 AS `position_y`, 41.16303 AS `position_z`, 5.88176 AS `orientation`, 420 AS `spawntimesecs`, 0.0 AS `wander_distance`, 0 AS `currentwaypoint`, NULL AS `curHealthPct`, 0 AS `MovementType`, NULL AS `npcflag`, NULL AS `unit_flags`, NULL AS `unit_flags2`, NULL AS `unit_flags3`, '' AS `ScriptName`, NULL AS `StringId`, 70450 AS `VerifiedBuild`
UNION ALL SELECT 22600001, 1738, 0, 0, 0, '0', 0, 0, 0, -1, 0, 1, 2225.97925, 254.44098, 34.16913, 0.907571, 300, 0.0, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, 70450
UNION ALL SELECT 22600002, 1936, 0, 0, 0, '0', 0, 0, 0, -1, 0, 1, 2267.5686, 1493.98108, 33.41746, 5.078908, 3600, 0.0, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, 70450
UNION ALL SELECT 22600003, 268048, 0, 0, 0, '0', 0, 0, 0, -1, 0, 0, 1329.24658, 344.72571, -63.62132, 5.061455, 120, 0.0, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, 70338
UNION ALL SELECT 22600004, 268048, 0, 0, 0, '0', 0, 0, 0, -1, 0, 0, 1598.125, 174.02083, -41.3411, 3.612832, 120, 0.0, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, 70338
UNION ALL SELECT 22600005, 277766, 0, 0, 0, '0', 0, 0, 0, -1, 0, 0, 2230.81641, 282.69302, 35.24931, 5.913361, 300, 0.0, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, 70450
UNION ALL SELECT 22600006, 268048, 1, 0, 0, '0', 0, 0, 0, -1, 0, 0, 1938.84033, -4719.33838, 41.64162, 0.767945, 120, 0.0, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, 70338
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature` AS `x` WHERE `x`.`guid` = `v`.`guid`);
