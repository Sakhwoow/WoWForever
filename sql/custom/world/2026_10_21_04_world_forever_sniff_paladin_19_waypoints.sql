-- Classic 1.60 (WoW Forever): маршруты патрулей для существ, уже лежащих в БД и не имеющих маршрута
-- Источник: снифы официального сервера Classic (бета «актуал»), сборки 70245, 70291, 70338, 70425, 70450; сгенерировано ForeverSniffTools.
-- Только добавление: INSERT IGNORE (PathId = guid * 10) и UPDATE с защитой (MovementType <> 2; PathId = 0). Маршрут восстановлен по повторяющимся отрезкам SMSG_ON_MONSTER_MOVE (цикл пройден минимум дважды).
-- Повторный запуск безопасен (проверено прогоном дважды на копии снимка БД).

INSERT IGNORE INTO `waypoint_path` (`PathId`,`MoveType`,`Flags`,`Velocity`,`Comment`) VALUES
(200447330,0,0,NULL,'1512 (sniff, guid 20044733)'),
(200420760,0,0,NULL,'1502 (sniff, guid 20042076)'),
(200383320,0,0,NULL,'1505 (sniff, guid 20038332)'),
(200449760,0,0,NULL,'1506 (sniff, guid 20044976)'),
(251770560,0,0,NULL,'1526 (sniff, guid 25177056)');
INSERT IGNORE INTO `waypoint_path_node` (`PathId`,`NodeId`,`PositionX`,`PositionY`,`PositionZ`,`Orientation`,`Delay`) VALUES
(200447330,0,2001.52,1698.535,78.63,NULL,0),
(200447330,1,1991.25,1699.395,79.275,NULL,0),
(200420760,0,1963.42,1600.13,83.595,NULL,0),
(200420760,1,1961.41,1602.325,83.6,NULL,7100),
(200383320,0,2077.77,1961.09,97.07,NULL,1600),
(200383320,1,2078.85,1957.425,97.41,NULL,0),
(200449760,0,1767.01,1400.91,95.29,NULL,2200),
(200449760,1,1766.67,1397.88,95.07,NULL,0),
(251770560,0,2210.56,617.785,24.75,NULL,0),
(251770560,1,2208.62,612.855,24.8,NULL,0);
INSERT IGNORE INTO `creature_addon` (`guid`,`PathId`,`mount`,`MountCreatureID`,`StandState`,`AnimTier`,`VisFlags`,`SheathState`,`PvPFlags`,`emote`,`aiAnimKit`,`movementAnimKit`,`meleeAnimKit`,`visibilityDistanceType`,`auras`) VALUES
(20044733,200447330,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
(20042076,200420760,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
(20038332,200383320,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
(20044976,200449760,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
(25177056,251770560,0,0,0,0,0,0,0,0,0,0,0,0,NULL);
UPDATE `creature` SET `MovementType` = 2, `wander_distance` = 0.0 WHERE `guid` = 20044733 AND (`MovementType` <> 2) AND (NOT (`MovementType` <=> 2) OR ABS(`wander_distance` - 0.0) > 0.001);
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 20042076 AND (`MovementType` <> 2) AND (NOT (`MovementType` <=> 2));
UPDATE `creature` SET `MovementType` = 2, `wander_distance` = 0.0 WHERE `guid` = 20038332 AND (`MovementType` <> 2) AND (NOT (`MovementType` <=> 2) OR ABS(`wander_distance` - 0.0) > 0.001);
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 20044976 AND (`MovementType` <> 2) AND (NOT (`MovementType` <=> 2));
UPDATE `creature` SET `MovementType` = 2, `wander_distance` = 0.0 WHERE `guid` = 25177056 AND (`MovementType` <> 2) AND (NOT (`MovementType` <=> 2) OR ABS(`wander_distance` - 0.0) > 0.001);
