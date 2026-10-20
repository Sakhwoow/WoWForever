-- Classic 1.60 (WoW Forever): quest_poi / quest_poi_points старых заданий: замена записей задания, отличающихся от сниффа
-- Источник: снифы официального сервера Classic (бета «актуал»), сборки 70245, 70291, 70338, 70425; сгенерировано ForeverSniffTools.
-- DELETE по ключу QuestID, затем INSERT; повторный запуск пересоздаёт те же строки.
-- Повторный запуск безопасен (проверено прогоном дважды на копии снимка БД).

DELETE FROM `quest_poi` WHERE `QuestID` = 7;
DELETE FROM `quest_poi_points` WHERE `QuestID` = 7;
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`) VALUES
(7,0,0,-1,0,0,0,1429,0,0,0,0,0,13833,0,70338),
(7,0,1,0,380079,6,0,1429,0,1,0,0,0,0,0,70338),
(7,0,2,32,0,0,0,1429,0,0,0,0,0,13833,0,70338);
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`) VALUES
(7,0,0,-8903,-163,82,70338),
(7,1,0,-8797,-259,83,70338),
(7,1,1,-8766,-253,81,70338),
(7,1,2,-8754,-193,86,70338),
(7,1,3,-8751,-160,84,70338),
(7,1,4,-8750,-115,86,70338),
(7,1,5,-8766,-93,90,70338),
(7,1,6,-8795,-117,83,70338),
(7,1,7,-8811,-217,84,70338),
(7,1,8,-8809,-234,82,70338),
(7,1,9,-8806,-244,82,70338),
(7,2,0,-8903,-163,82,70338);
DELETE FROM `quest_poi` WHERE `QuestID` = 15;
DELETE FROM `quest_poi_points` WHERE `QuestID` = 15;
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`) VALUES
(15,0,0,-1,0,0,0,1429,0,0,0,0,0,13833,0,70338),
(15,0,1,0,380062,257,0,1429,0,1,0,0,0,0,0,70338),
(15,0,2,32,0,0,0,1429,0,0,0,0,0,13833,0,70338);
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`) VALUES
(15,0,0,-8903,-163,82,70338),
(15,1,0,-8782,-274,79,70338),
(15,1,1,-8767,-270,78,70338),
(15,1,2,-8706,-202,91,70338),
(15,1,3,-8667,-117,93,70338),
(15,1,4,-8684,-72,91,70338),
(15,1,5,-8696,-69,90,70338),
(15,1,6,-8791,-105,83,70338),
(15,1,7,-8824,-238,82,70338),
(15,1,8,-8818,-255,83,70338),
(15,2,0,-8903,-163,82,70338);
DELETE FROM `quest_poi` WHERE `QuestID` = 18;
DELETE FROM `quest_poi_points` WHERE `QuestID` = 18;
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`) VALUES
(18,0,0,-1,0,0,0,1429,0,0,0,0,0,19529,0,70338),
(18,0,1,0,381191,752,0,1429,0,1,0,0,0,0,0,70338),
(18,0,2,32,0,0,0,1429,0,0,0,0,0,19529,0,70338);
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`) VALUES
(18,0,0,-8934,-137,83,70338),
(18,1,0,-9052,-458,73,70338),
(18,1,1,-8888,-447,66,70338),
(18,1,2,-8878,-412,66,70338),
(18,1,3,-8869,-374,71,70338),
(18,1,4,-9082,-234,73,70338),
(18,1,5,-9115,-247,75,70338),
(18,1,6,-9131,-264,72,70338),
(18,1,7,-9142,-291,72,70338),
(18,1,8,-9148,-340,73,70338),
(18,1,9,-9143,-368,72,70338),
(18,1,10,-9093,-421,74,70338),
(18,2,0,-8934,-137,83,70338);
DELETE FROM `quest_poi` WHERE `QuestID` = 33;
DELETE FROM `quest_poi_points` WHERE `QuestID` = 33;
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`) VALUES
(33,0,0,-1,0,0,0,1429,0,0,0,0,0,11862,0,70338),
(33,0,1,0,380016,750,0,1429,0,1,0,0,0,0,0,70338),
(33,1,2,0,380016,750,0,1429,0,1,0,0,0,0,0,70338),
(33,2,3,0,380016,750,0,1426,0,1,0,0,0,0,0,70338),
(33,3,4,0,380016,750,0,1429,0,3,0,0,0,0,0,70338),
(33,0,5,32,0,0,0,1429,0,0,0,0,0,11862,0,70338);
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`) VALUES
(33,0,0,-8869,-163,81,70338),
(33,1,0,-9217,-51,74,70338),
(33,1,1,-9216,51,76,70338),
(33,1,2,-9218,53,76,70338),
(33,1,3,-9287,98,68,70338),
(33,1,4,-9379,56,60,70338),
(33,1,5,-9380,54,60,70338),
(33,1,6,-9280,-15,71,70338),
(33,2,0,-8837,-305,77,70338),
(33,2,1,-8755,-288,79,70338),
(33,2,2,-8716,-149,86,70338),
(33,2,3,-8751,-34,92,70338),
(33,2,4,-8921,-41,91,70338),
(33,2,5,-8953,-44,92,70338),
(33,2,6,-8981,-53,92,70338),
(33,2,7,-9084,-181,74,70338),
(33,2,8,-8985,-248,73,70338),
(33,2,9,-8915,-285,78,70338),
(33,3,0,-6204,215,398,70338),
(33,3,1,-6150,284,395,70338),
(33,3,2,-6161,524,387,70338),
(33,3,3,-6445,692,387,70338),
(33,3,4,-6509,621,394,70338),
(33,3,5,-6448,417,395,70338),
(33,3,6,-6426,357,392,70338),
(33,3,7,-6412,334,390,70338),
(33,3,8,-6375,294,385,70338),
(33,4,0,-8837,-305,0,70338),
(33,4,1,-8755,-288,0,70338),
(33,4,2,-8716,-149,0,70338),
(33,4,3,-8751,-34,0,70338),
(33,4,4,-8921,-41,0,70338),
(33,4,5,-8953,-44,0,70338),
(33,4,6,-8981,-53,0,70338),
(33,4,7,-8941,-115,0,70338),
(33,4,8,-8893,-197,0,70338),
(33,4,9,-8842,-248,0,70338),
(33,5,0,-8869,-163,81,70338);
DELETE FROM `quest_poi` WHERE `QuestID` = 865;
DELETE FROM `quest_poi_points` WHERE `QuestID` = 865;
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`) VALUES
(865,0,0,-1,0,0,1,1413,0,0,0,0,0,55621,0,70338),
(865,0,1,0,380724,5055,1,1413,0,1,0,0,0,0,0,70338),
(865,1,2,0,380724,5055,1,1413,0,1,0,0,0,0,0,70338),
(865,2,3,0,380724,5055,1,1413,0,1,0,0,0,0,0,70338),
(865,3,4,0,380724,5055,1,1413,0,1,0,0,0,0,0,70338),
(865,4,5,0,380724,5055,1,1413,0,1,0,0,0,0,0,70338),
(865,0,6,32,0,0,1,1413,0,0,0,0,0,55621,0,70338);
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`) VALUES
(865,0,0,-929,-3697,8,70338),
(865,1,0,705,-3581,93,70338),
(865,1,1,951,-3548,94,70338),
(865,1,2,1116,-3448,90,70338),
(865,1,3,1183,-3384,92,70338),
(865,1,4,1316,-3118,92,70338),
(865,1,5,1283,-3083,92,70338),
(865,1,6,1216,-3015,93,70338),
(865,1,7,718,-3552,93,70338),
(865,2,0,717,-2250,92,70338),
(865,2,1,849,-2250,93,70338),
(865,2,2,582,-1650,92,70338),
(865,2,3,522,-1648,92,70338),
(865,2,4,451,-1849,92,70338),
(865,2,5,450,-1982,92,70338),
(865,3,0,-1716,-3617,92,70338),
(865,3,1,-1649,-3617,92,70338),
(865,3,2,-1632,-3579,95,70338),
(865,3,3,-1316,-2208,92,70338),
(865,3,4,-1316,-2023,92,70338),
(865,3,5,-1317,-1818,92,70338),
(865,3,6,-1350,-1849,92,70338),
(865,3,7,-1781,-2282,89,70338),
(865,3,8,-1884,-2517,92,70338),
(865,3,9,-2068,-3151,118,70338),
(865,3,10,-2035,-3255,92,70338),
(865,3,11,-1982,-3417,55,70338),
(865,4,0,-650,-3751,92,70338),
(865,4,1,-449,-3549,92,70338),
(865,4,2,-435,-3428,92,70338),
(865,4,3,-615,-3385,92,70338),
(865,4,4,-800,-3515,92,70338),
(865,4,5,-782,-3548,93,70338),
(865,4,6,-683,-3715,92,70338),
(865,5,0,-57,-1423,92,70338),
(865,5,1,-82,-1317,90,70338),
(865,5,2,-150,-1117,53,70338),
(865,5,3,-183,-1083,45,70338),
(865,5,4,-327,-1041,41,70338),
(865,5,5,-441,-1345,97,70338),
(865,6,0,-929,-3697,8,70338);
DELETE FROM `quest_poi` WHERE `QuestID` = 868;
DELETE FROM `quest_poi_points` WHERE `QuestID` = 868;
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`) VALUES
(868,0,0,-1,0,0,1,1413,0,0,0,0,0,55880,0,70338),
(868,0,1,0,380744,5058,1,1413,0,1,0,0,0,0,0,70338),
(868,0,2,32,0,0,1,1413,0,0,0,0,0,55880,0,70338);
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`) VALUES
(868,0,0,-389,-2552,99,70338),
(868,1,0,-3107,-2301,94,70338),
(868,1,1,-3077,-1931,96,70338),
(868,1,2,-3080,-1689,93,70338),
(868,1,3,-3095,-1685,95,70338),
(868,1,4,-3202,-1704,96,70338),
(868,1,5,-3235,-1743,96,70338),
(868,1,6,-3293,-1855,94,70338),
(868,1,7,-3296,-1875,94,70338),
(868,1,8,-3280,-1976,94,70338),
(868,1,9,-3194,-2225,95,70338),
(868,1,10,-3184,-2250,95,70338),
(868,1,11,-3124,-2296,94,70338),
(868,2,0,-389,-2552,99,70338);
DELETE FROM `quest_poi` WHERE `QuestID` = 869;
DELETE FROM `quest_poi_points` WHERE `QuestID` = 869;
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`) VALUES
(869,0,0,-1,0,0,1,1413,0,0,0,0,0,56778,0,70338),
(869,0,1,0,381221,5062,1,1413,0,1,0,0,0,0,0,70338),
(869,0,2,32,0,0,1,1413,0,0,0,0,0,56778,0,70338);
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`) VALUES
(869,0,0,-436,-2639,96,70338),
(869,1,0,-650,-3751,92,70338),
(869,1,1,705,-3581,93,70338),
(869,1,2,1183,-3384,92,70338),
(869,1,3,1316,-3118,92,70338),
(869,1,4,582,-1650,92,70338),
(869,1,5,-183,-1083,45,70338),
(869,1,6,-327,-1041,41,70338),
(869,1,7,-1317,-1818,92,70338),
(869,1,8,-1781,-2282,89,70338),
(869,1,9,-1884,-2517,92,70338),
(869,1,10,-2068,-3151,118,70338),
(869,1,11,-1716,-3617,92,70338),
(869,2,0,-436,-2639,96,70338);
DELETE FROM `quest_poi` WHERE `QuestID` = 896;
DELETE FROM `quest_poi_points` WHERE `QuestID` = 896;
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`) VALUES
(896,0,0,-1,0,0,1,1413,0,0,0,0,0,56300,0,70338),
(896,0,1,0,380720,5097,1,1413,0,1,0,0,0,0,0,70338),
(896,0,2,32,0,0,1,1413,0,0,0,0,0,56300,0,70338);
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`) VALUES
(896,0,0,-986,-3797,5,70338),
(896,1,0,1401,-3687,98,70338),
(896,1,1,1426,-3420,93,70338),
(896,1,2,1414,-3413,93,70338),
(896,1,3,1407,-3411,93,70338),
(896,1,4,1357,-3421,92,70338),
(896,1,5,1347,-3435,93,70338),
(896,1,6,1235,-3601,94,70338),
(896,1,7,1234,-3685,93,70338),
(896,2,0,-986,-3797,5,70338);
DELETE FROM `quest_poi` WHERE `QuestID` = 899;
DELETE FROM `quest_poi_points` WHERE `QuestID` = 899;
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`) VALUES
(899,0,0,-1,0,0,1,1413,0,0,0,0,0,57073,0,70338),
(899,0,1,0,380760,5085,1,1413,0,1,0,0,0,0,0,70338),
(899,1,2,0,380760,5085,1,1413,0,1,0,0,0,0,0,70338),
(899,0,3,32,0,0,1,1413,0,0,0,0,0,57073,0,70338);
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`) VALUES
(899,0,0,-521,-2641,96,70338),
(899,1,0,-1951,-2215,96,70338),
(899,1,1,-1384,-1581,92,70338),
(899,1,2,-1416,-1521,106,70338),
(899,1,3,-1455,-1468,103,70338),
(899,1,4,-2150,-1718,92,70338),
(899,1,5,-2149,-1750,92,70338),
(899,1,6,-2115,-1949,94,70338),
(899,1,7,-2052,-2117,93,70338),
(899,1,8,-2019,-2166,101,70338),
(899,2,0,-2034,-2821,93,70338),
(899,2,1,-2002,-2813,93,70338),
(899,2,2,-1882,-2748,94,70338),
(899,2,3,-1912,-2711,92,70338),
(899,2,4,-2051,-2548,92,70338),
(899,2,5,-2082,-2516,94,70338),
(899,2,6,-2251,-2484,93,70338),
(899,2,7,-2286,-2484,99,70338),
(899,2,8,-2301,-2596,93,70338),
(899,2,9,-2284,-2646,98,70338),
(899,2,10,-2054,-2813,92,70338),
(899,3,0,-521,-2641,96,70338);
DELETE FROM `quest_poi` WHERE `QuestID` = 959;
DELETE FROM `quest_poi_points` WHERE `QuestID` = 959;
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`) VALUES
(959,0,0,-1,0,0,1,1413,0,0,0,0,0,58088,0,70338),
(959,0,1,0,380999,5334,1,1413,0,1,0,0,0,0,0,70338),
(959,0,2,32,0,0,1,1413,0,0,0,0,0,58088,0,70338);
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`) VALUES
(959,0,0,-928,-3770,6,70338),
(959,1,0,-728,-2124,68,70338),
(959,1,1,-659,-2008,62,70338),
(959,1,2,-785,-2087,75,70338),
(959,2,0,-928,-3770,6,70338);
DELETE FROM `quest_poi` WHERE `QuestID` = 1062;
DELETE FROM `quest_poi_points` WHERE `QuestID` = 1062;
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`) VALUES
(1062,0,0,-1,0,0,1,1413,0,0,0,0,0,61088,0,70338),
(1062,0,1,0,381167,3989,1,1442,0,1,0,0,0,0,0,70338),
(1062,0,2,32,0,0,1,1413,0,0,0,0,0,61088,0,70338);
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`) VALUES
(1062,0,0,-271,-950,14,70338),
(1062,1,0,989,-420,7,70338),
(1062,1,1,1118,-416,10,70338),
(1062,1,2,1515,-253,32,70338),
(1062,1,3,1447,113,17,70338),
(1062,1,4,1414,147,20,70338),
(1062,1,5,1215,346,33,70338),
(1062,1,6,1118,284,20,70338),
(1062,1,7,1049,116,16,70338),
(1062,1,8,1016,18,15,70338),
(1062,1,9,974,-386,8,70338),
(1062,2,0,-271,-950,14,70338);
DELETE FROM `quest_poi` WHERE `QuestID` = 1069;
DELETE FROM `quest_poi_points` WHERE `QuestID` = 1069;
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`) VALUES
(1069,0,0,-1,0,0,1,1413,0,0,0,0,0,55621,0,70338),
(1069,0,1,0,381044,5570,1,1442,0,1,0,0,0,0,0,70338),
(1069,1,2,0,381044,5570,1,1442,0,1,0,0,0,0,0,70338),
(1069,2,3,0,381044,5570,1,1442,0,1,0,0,0,0,0,70338),
(1069,3,4,0,381044,5570,1,1442,0,1,0,0,0,0,0,70338),
(1069,4,5,0,381044,5570,1,1442,0,1,0,0,0,0,0,70338),
(1069,0,6,32,0,0,1,1413,0,0,0,0,0,55621,0,70338);
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`) VALUES
(1069,0,0,-929,-3697,8,70338),
(1069,1,0,1401,-209,10,70338),
(1069,1,1,1426,-197,20,70338),
(1069,1,2,1461,-137,27,70338),
(1069,1,3,1437,-79,22,70338),
(1069,2,0,587,559,86,70338),
(1069,2,1,603,661,80,70338),
(1069,2,2,502,686,79,70338),
(1069,2,3,457,677,78,70338),
(1069,2,4,451,626,74,70338),
(1069,2,5,525,580,91,70338),
(1069,3,0,963,86,21,70338),
(1069,3,1,1069,248,20,70338),
(1069,3,2,896,337,23,70338),
(1069,3,3,828,267,24,70338),
(1069,3,4,809,234,24,70338),
(1069,4,0,1258,-615,25,70338),
(1069,4,1,1499,-566,61,70338),
(1069,4,2,1525,-389,32,70338),
(1069,4,3,1163,-415,17,70338),
(1069,4,4,1139,-546,7,70338),
(1069,5,0,1331,250,13,70338),
(1069,5,1,1401,278,16,70338),
(1069,5,2,1298,314,25,70338),
(1069,6,0,-929,-3697,8,70338);
DELETE FROM `quest_poi` WHERE `QuestID` = 1483;
DELETE FROM `quest_poi_points` WHERE `QuestID` = 1483;
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`) VALUES
(1483,0,0,-1,0,0,1,1442,0,0,0,0,0,63046,0,70338),
(1483,0,1,32,0,0,1,1413,0,0,0,0,0,55412,0,70338);
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`) VALUES
(1483,0,0,878,365,23,70338),
(1483,1,0,-902,-3759,12,70338);
DELETE FROM `quest_poi` WHERE `QuestID` = 1486;
DELETE FROM `quest_poi_points` WHERE `QuestID` = 1486;
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`) VALUES
(1486,0,0,-1,0,0,1,1413,0,0,0,0,0,72944,0,70338),
(1486,0,1,0,381767,6443,1,1413,0,1,0,0,0,0,0,70338),
(1486,0,2,32,0,0,1,1413,0,0,0,0,0,72944,0,70338);
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`) VALUES
(1486,0,0,-797,-2037,97,70338),
(1486,1,0,-624,-2383,28,70338),
(1486,1,1,-549,-2325,33,70338),
(1486,1,2,-555,-2228,47,70338),
(1486,1,3,-576,-2069,55,70338),
(1486,1,4,-585,-2043,58,70338),
(1486,1,5,-664,-1996,63,70338),
(1486,1,6,-774,-2023,77,70338),
(1486,1,7,-793,-2029,80,70338),
(1486,1,8,-732,-2251,20,70338),
(1486,1,9,-682,-2338,18,70338),
(1486,2,0,-797,-2037,97,70338);
DELETE FROM `quest_poi` WHERE `QuestID` = 1818;
DELETE FROM `quest_poi_points` WHERE `QuestID` = 1818;
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`) VALUES
(1818,0,0,-1,0,0,0,1420,0,0,0,0,0,31505,0,70338),
(1818,0,1,32,0,0,0,1420,0,0,0,0,0,38975,0,70338),
(1818,1,2,32,0,0,0,1458,0,0,0,0,0,65421,0,70338);
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`) VALUES
(1818,0,0,2288,403,34,70338),
(1818,1,0,2255,238,34,70338),
(1818,2,0,1767,418,-57,70338);
DELETE FROM `quest_poi` WHERE `QuestID` = 3101;
DELETE FROM `quest_poi_points` WHERE `QuestID` = 3101;
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`) VALUES
(3101,0,0,-1,0,0,0,1429,0,0,0,0,0,22067,0,70338),
(3101,0,1,32,0,0,0,1429,0,0,0,0,0,13833,0,70338);
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`) VALUES
(3101,0,0,-8915,-215,82,70338),
(3101,1,0,-8903,-163,82,70338);
DELETE FROM `quest_poi` WHERE `QuestID` = 5727;
DELETE FROM `quest_poi_points` WHERE `QuestID` = 5727;
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`) VALUES
(5727,0,0,-1,0,0,1,1454,0,0,0,0,0,68234,0,70338),
(5727,0,1,0,480284,3216,1,1454,0,0,0,0,0,52207,0,70338),
(5727,0,2,32,0,0,1,1454,0,0,0,0,0,68234,0,70338);
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`) VALUES
(5727,0,0,1920,-4126,43,70338),
(5727,1,0,1801,-4375,-17,70338),
(5727,2,0,1920,-4126,43,70338);
DELETE FROM `quest_poi` WHERE `QuestID` = 6461;
DELETE FROM `quest_poi_points` WHERE `QuestID` = 6461;
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`) VALUES
(6461,0,0,-1,0,0,1,1442,0,0,0,0,0,106915,0,70338),
(6461,0,1,0,382470,4005,1,1442,0,1,0,0,0,0,0,70338),
(6461,0,2,1,382471,4007,1,1442,0,1,0,0,0,0,0,70338),
(6461,1,3,1,382471,4007,1,1442,0,1,0,0,0,0,0,70338),
(6461,2,4,1,382471,4007,1,1442,0,1,0,0,0,0,0,70338),
(6461,3,5,1,382471,4007,1,1442,0,1,0,0,0,0,0,70338),
(6461,0,6,32,0,0,1,1442,0,0,0,0,0,106915,0,70338);
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`) VALUES
(6461,0,0,-178,-233,9,70338),
(6461,1,0,583,281,53,70338),
(6461,1,1,483,575,90,70338),
(6461,1,2,448,638,76,70338),
(6461,1,3,435,628,78,70338),
(6461,1,4,382,351,45,70338),
(6461,1,5,433,300,48,70338),
(6461,2,0,518,573,92,70338),
(6461,2,1,547,573,85,70338),
(6461,2,2,560,664,77,70338),
(6461,2,3,510,683,79,70338),
(6461,2,4,460,696,82,70338),
(6461,2,5,454,668,76,70338),
(6461,3,0,951,83,21,70338),
(6461,3,1,1050,252,20,70338),
(6461,3,2,948,352,23,70338),
(6461,3,3,750,280,26,70338),
(6461,3,4,751,216,34,70338),
(6461,4,0,1451,649,146,70338),
(6461,4,1,1516,650,139,70338),
(6461,4,2,1615,750,134,70338),
(6461,4,3,1416,951,148,70338),
(6461,4,4,1349,883,159,70338),
(6461,4,5,1383,718,154,70338),
(6461,5,0,917,614,98,70338),
(6461,5,1,1112,646,140,70338),
(6461,5,2,1151,692,146,70338),
(6461,5,3,1075,716,134,70338),
(6461,5,4,882,683,97,70338),
(6461,6,0,-178,-233,9,70338);
DELETE FROM `quest_poi` WHERE `QuestID` = 6503;
DELETE FROM `quest_poi_points` WHERE `QuestID` = 6503;
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`) VALUES
(6503,0,0,-1,0,0,1,1440,0,0,0,0,0,106999,0,70338),
(6503,0,1,0,383934,12856,1,1440,0,1,0,0,0,0,0,70338),
(6503,0,2,32,0,0,1,1440,0,0,0,0,0,106999,0,70338);
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`) VALUES
(6503,0,0,2055,-2400,88,70338),
(6503,1,0,2016,-2767,131,70338),
(6503,1,1,2078,-2690,104,70338),
(6503,1,2,1973,-2243,101,70338),
(6503,1,3,1861,-2240,118,70338),
(6503,1,4,1742,-2329,114,70338),
(6503,1,5,1741,-2468,96,70338),
(6503,1,6,1785,-2563,84,70338),
(6503,1,7,1861,-2691,93,70338),
(6503,2,0,2055,-2400,88,70338);
DELETE FROM `quest_poi` WHERE `QuestID` = 6543;
DELETE FROM `quest_poi_points` WHERE `QuestID` = 6543;
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`) VALUES
(6543,0,0,-1,0,0,1,1413,0,0,0,0,0,87490,0,70338),
(6543,0,1,0,383641,16764,1,1440,0,3,0,0,0,0,0,70338),
(6543,0,2,1,383642,16763,1,1440,0,3,0,0,0,0,0,70338),
(6543,0,3,2,383643,16765,1,1440,0,3,0,0,0,0,0,70338),
(6543,0,4,32,0,0,1,1413,0,0,0,0,0,87490,0,70338);
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`) VALUES
(6543,0,0,1246,-2253,108,70338),
(6543,1,0,2080,-2399,0,70338),
(6543,2,0,3389,1016,0,70338),
(6543,3,0,2914,-3685,0,70338),
(6543,3,1,2939,-3641,0,70338),
(6543,3,2,2932,-3569,0,70338),
(6543,3,3,2729,-3107,0,70338),
(6543,3,4,2707,-3064,0,70338),
(6543,3,5,2558,-2806,0,70338),
(6543,3,6,2489,-2777,0,70338),
(6543,3,7,2489,-2817,0,70338),
(6543,3,8,2489,-2871,0,70338),
(6543,3,9,2518,-2937,0,70338),
(6543,3,10,2729,-3376,0,70338),
(6543,3,11,2859,-3634,0,70338),
(6543,4,0,1246,-2253,108,70338);
