-- Classic 1.60 (WoW Forever): расстановка существ по снифам: перенос/добавление стабильных спавнов, тип движения, стойка и эмоция
-- Источник: снифы официального сервера Classic (бета «актуал»), сборки 70245, 70291, 70338, 70425; сгенерировано ForeverSniffTools.
-- UPDATE с защитным условием; INSERT NOT EXISTS / IGNORE; новые guid с 22600000.
-- Повторный запуск безопасен (проверено прогоном дважды на копии снимка БД).

UPDATE `creature` SET `position_x` = 577.19098, `position_y` = 373.57465, `position_z` = 28.33965 WHERE `guid` = '20016627' AND (ABS(`position_x` - 577.19098) > 0.01 OR ABS(`position_y` - 373.57465) > 0.01 OR ABS(`position_z` - 28.33965) > 0.01);
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0.0 WHERE `guid` = '21101853' AND (`MovementType` = 1) AND (NOT (`MovementType` <=> 0) OR ABS(`wander_distance` - 0.0) > 0.01);
UPDATE `creature_addon` SET `StandState` = 1 WHERE `guid` = '21101704' AND (NOT (`StandState` <=> 1));
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0.0 WHERE `guid` = '21100405' AND (`MovementType` = 1) AND (NOT (`MovementType` <=> 0) OR ABS(`wander_distance` - 0.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21500170' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0.0 WHERE `guid` = '21100873' AND (`MovementType` = 1) AND (NOT (`MovementType` <=> 0) OR ABS(`wander_distance` - 0.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100599' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100597' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100595' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100575' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100587' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100559' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100576' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100579' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100570' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100621' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100564' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100614' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100558' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100623' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100571' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100613' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100566' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100560' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100603' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100561' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100585' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100620' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100574' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100600' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100582' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100616' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100581' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100586' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100598' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100604' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100565' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100601' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100584' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100588' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100608' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100609' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100594' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100572' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100633' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100636' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100635' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100622' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '21100555' AND (NOT (`SheathState` <=> 1));
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100592' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100605' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100606' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100607' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21500197' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100557' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100627' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100610' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100580' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100618' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100617' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100612' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100556' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100625' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13.0 WHERE `guid` = '21100589' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 13.0) > 0.01);
UPDATE `creature_addon` SET `emote` = 69 WHERE `guid` = '21101697' AND (NOT (`emote` <=> 69));
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '21100985' AND (NOT (`SheathState` <=> 1));
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '21101952' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '21200161' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '21200038' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20079848' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20079793' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '21200659' AND (NOT (`SheathState` <=> 1));
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100810' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100828' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100825' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100787' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100811' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100792' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100799' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100831' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100813' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100796' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100797' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100847' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100841' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100795' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100800' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100781' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100789' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100791' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100790' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100801' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100843' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100808' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100822' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100835' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21500227' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100830' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100829' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100782' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100783' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100804' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100806' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100815' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100807' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100780' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100793' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100840' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100838' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100833' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100842' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100823' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100837' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100834' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100814' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100818' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100788' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100803' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100809' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 19.0 WHERE `guid` = '21100794' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 19.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 1.0 WHERE `guid` = '20001750' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 1.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 1.0 WHERE `guid` = '20000106' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 1.0) > 0.01);
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '21400127' AND (NOT (`SheathState` <=> 1));
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '21400119' AND (NOT (`SheathState` <=> 1));
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21400084' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21400063' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21400078' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21400080' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21400082' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21400060' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21400076' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21400057' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '21400094' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 9.0 WHERE `guid` = '21400097' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 9.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '21400091' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '21400092' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '21400089' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '21400104' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '21400105' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '21400100' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '21400107' AND (NOT (`SheathState` <=> 1));
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '21400112' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 8.0 WHERE `guid` = '21400110' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 8.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '21400025' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20018682' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature_addon` SET `StandState` = 0 WHERE `guid` = '20018687' AND (NOT (`StandState` <=> 0));
UPDATE `creature_addon` SET `StandState` = 0 WHERE `guid` = '20026252' AND (NOT (`StandState` <=> 0));
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '20013910' AND (NOT (`SheathState` <=> 1));
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '20013914' AND (NOT (`SheathState` <=> 1));
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '20013913' AND (NOT (`SheathState` <=> 1));
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20013685' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '20003383' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '20010348' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '20010352' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '20011794' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature_addon` SET `emote` = 0 WHERE `guid` = '20004770' AND (NOT (`emote` <=> 0));
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0.0 WHERE `guid` = '21200628' AND (`MovementType` = 1) AND (NOT (`MovementType` <=> 0) OR ABS(`wander_distance` - 0.0) > 0.01);
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0.0 WHERE `guid` = '21200625' AND (`MovementType` = 1) AND (NOT (`MovementType` <=> 0) OR ABS(`wander_distance` - 0.0) > 0.01);
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '20006513' AND (NOT (`SheathState` <=> 1));
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '21200636' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0.0 WHERE `guid` = '21100065' AND (`MovementType` = 1) AND (NOT (`MovementType` <=> 0) OR ABS(`wander_distance` - 0.0) > 0.01);
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '21100126' AND (NOT (`SheathState` <=> 1));
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '21100216' AND (NOT (`SheathState` <=> 1));
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '21100170' AND (NOT (`SheathState` <=> 1));
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 20.0 WHERE `guid` = '21500378' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 20.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 20.0 WHERE `guid` = '21500194' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 20.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 20.0 WHERE `guid` = '21500148' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 20.0) > 0.01);
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '21100014' AND (NOT (`SheathState` <=> 1));
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '21101629' AND (NOT (`SheathState` <=> 1));
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 7.0 WHERE `guid` = '21101821' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 7.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 7.0 WHERE `guid` = '21101820' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 7.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 7.0 WHERE `guid` = '21101823' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 7.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 7.0 WHERE `guid` = '21101827' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 7.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 7.0 WHERE `guid` = '21101831' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 7.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 7.0 WHERE `guid` = '21101825' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 7.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 7.0 WHERE `guid` = '21101843' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 7.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 7.0 WHERE `guid` = '21101822' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 7.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 7.0 WHERE `guid` = '21101836' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 7.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 7.0 WHERE `guid` = '21500344' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 7.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 12.0 WHERE `guid` = '21101965' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 12.0) > 0.01);
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '21100661' AND (NOT (`SheathState` <=> 1));
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '21101665' AND (NOT (`SheathState` <=> 1));
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0.0 WHERE `guid` = '21101516' AND (`MovementType` = 1) AND (NOT (`MovementType` <=> 0) OR ABS(`wander_distance` - 0.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 20.0 WHERE `guid` = '21101214' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 20.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '21101021' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 18.0 WHERE `guid` = '21101317' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 18.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 18.0 WHERE `guid` = '21101322' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 18.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 6.0 WHERE `guid` = '21101313' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 6.0) > 0.01);
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '21101509' AND (NOT (`SheathState` <=> 1));
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0.0 WHERE `guid` = '21500263' AND (`MovementType` = 1) AND (NOT (`MovementType` <=> 0) OR ABS(`wander_distance` - 0.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 11.0 WHERE `guid` = '21500260' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 11.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '21500118' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0.0 WHERE `guid` = '21101559' AND (`MovementType` = 1) AND (NOT (`MovementType` <=> 0) OR ABS(`wander_distance` - 0.0) > 0.01);
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0.0 WHERE `guid` = '21101563' AND (`MovementType` = 1) AND (NOT (`MovementType` <=> 0) OR ABS(`wander_distance` - 0.0) > 0.01);
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0.0 WHERE `guid` = '21101557' AND (`MovementType` = 1) AND (NOT (`MovementType` <=> 0) OR ABS(`wander_distance` - 0.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 6.0 WHERE `guid` = '21101014' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 6.0) > 0.01);
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '20079960' AND (NOT (`SheathState` <=> 1));
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20080261' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20080133' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20080022' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20080018' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0.0 WHERE `guid` = '20080094' AND (`MovementType` = 1) AND (NOT (`MovementType` <=> 0) OR ABS(`wander_distance` - 0.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20080015' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '20080028' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '20080125' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 7.0 WHERE `guid` = '20080077' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 7.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '21101579' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '21101331' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '21101332' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21300087' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300088' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300090' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300091' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300092' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300096' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300098' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300099' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '21300100' AND (NOT (`SheathState` <=> 1));
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21300003' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21300001' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21300004' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21300005' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21300006' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21300014' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21300012' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '21300015' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300008' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300010' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21300009' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21300017' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21300019' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300284' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21300286' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21300285' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21300289' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300290' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300047' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300046' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 6.0 WHERE `guid` = '21300045' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 6.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300048' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300049' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300050' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '21300051' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300052' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300053' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300054' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '21300055' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300058' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21300130' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '21300131' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '21300134' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300133' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '21300135' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300136' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21300137' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300138' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300139' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21300106' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21300108' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21300111' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '21300074' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '21300079' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300075' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '21300035' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21300217' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21300218' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4.0 WHERE `guid` = '21300219' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 4.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3.0 WHERE `guid` = '21300042' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 3.0) > 0.01);
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '21300209' AND (NOT (`SheathState` <=> 1));
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0.0 WHERE `guid` = '21200354' AND (`MovementType` = 1) AND (NOT (`MovementType` <=> 0) OR ABS(`wander_distance` - 0.0) > 0.01);
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0.0 WHERE `guid` = '21200356' AND (`MovementType` = 1) AND (NOT (`MovementType` <=> 0) OR ABS(`wander_distance` - 0.0) > 0.01);
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '20041827' AND (NOT (`SheathState` <=> 1));
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '20041826' AND (NOT (`SheathState` <=> 1));
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '21200406' AND (NOT (`SheathState` <=> 1));
UPDATE `creature_addon` SET `SheathState` = 1 WHERE `guid` = '21200407' AND (NOT (`SheathState` <=> 1));
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '20041832' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '20041831' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '21200386' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '21200361' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '21200360' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '21200382' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5.0 WHERE `guid` = '21200388' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 5.0) > 0.01);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10.0 WHERE `guid` = '21200497' AND (`MovementType` = 0) AND (NOT (`MovementType` <=> 1) OR ABS(`wander_distance` - 10.0) > 0.01);
UPDATE `gameobject` SET `state` = 1 WHERE `guid` = '30042902' AND (NOT (`state` <=> 1));
UPDATE `gameobject` SET `state` = 1 WHERE `guid` = '30042904' AND (NOT (`state` <=> 1));
UPDATE `gameobject` SET `state` = 1 WHERE `guid` = '30042945' AND (NOT (`state` <=> 1));
UPDATE `gameobject` SET `rotation0` = 0.0, `rotation1` = -0.647408, `rotation2` = 0.0, `rotation3` = 0.762144 WHERE `guid` = '21201272' AND (ABS(`rotation0` - 0.0) > 0.0005 OR ABS(`rotation1` - -0.647408) > 0.0005 OR ABS(`rotation2` - 0.0) > 0.0005 OR ABS(`rotation3` - 0.762144) > 0.0005);
UPDATE `gameobject` SET `rotation2` = 0.970295, `rotation3` = 0.241925 WHERE `guid` = '21202668' AND (ABS(`rotation2` - 0.970295) > 0.0005 OR ABS(`rotation3` - 0.241925) > 0.0005);
UPDATE `gameobject` SET `rotation0` = -0.006159, `rotation1` = -0.185616, `rotation2` = 0.069876, `rotation3` = 0.980115 WHERE `guid` = '21202677' AND (ABS(`rotation0` - -0.006159) > 0.0005 OR ABS(`rotation1` - -0.185616) > 0.0005 OR ABS(`rotation2` - 0.069876) > 0.0005 OR ABS(`rotation3` - 0.980115) > 0.0005);
UPDATE `gameobject` SET `state` = 1 WHERE `guid` = '21100394' AND (NOT (`state` <=> 1));
UPDATE `gameobject` SET `rotation0` = -0.578155, `rotation1` = -0.472236, `rotation2` = -0.557617, `rotation3` = 0.363034 WHERE `guid` = '21100774' AND (ABS(`rotation0` - -0.578155) > 0.0005 OR ABS(`rotation1` - -0.472236) > 0.0005 OR ABS(`rotation2` - -0.557617) > 0.0005 OR ABS(`rotation3` - 0.363034) > 0.0005);
UPDATE `gameobject` SET `rotation0` = -0.186083, `rotation1` = 0.005981, `rotation2` = -0.734338, `rotation3` = 0.652752 WHERE `guid` = '21100775' AND (ABS(`rotation0` - -0.186083) > 0.0005 OR ABS(`rotation1` - 0.005981) > 0.0005 OR ABS(`rotation2` - -0.734338) > 0.0005 OR ABS(`rotation3` - 0.652752) > 0.0005);
UPDATE `gameobject` SET `rotation0` = 0.110558, `rotation1` = -0.246603, `rotation2` = -0.749615, `rotation3` = 0.604187 WHERE `guid` = '21100776' AND (ABS(`rotation0` - 0.110558) > 0.0005 OR ABS(`rotation1` - -0.246603) > 0.0005 OR ABS(`rotation2` - -0.749615) > 0.0005 OR ABS(`rotation3` - 0.604187) > 0.0005);
UPDATE `gameobject` SET `rotation0` = -0.131016, `rotation1` = 0.003297, `rotation2` = -0.428509, `rotation3` = 0.893982 WHERE `guid` = '21100778' AND (ABS(`rotation0` - -0.131016) > 0.0005 OR ABS(`rotation1` - 0.003297) > 0.0005 OR ABS(`rotation2` - -0.428509) > 0.0005 OR ABS(`rotation3` - 0.893982) > 0.0005);
UPDATE `gameobject` SET `rotation2` = -0.903929, `rotation3` = 0.427683 WHERE `guid` = '21100531' AND (ABS(`rotation2` - -0.903929) > 0.0005 OR ABS(`rotation3` - 0.427683) > 0.0005);
UPDATE `gameobject` SET `rotation2` = 0.785825, `rotation3` = 0.618449 WHERE `guid` = '21100533' AND (ABS(`rotation2` - 0.785825) > 0.0005 OR ABS(`rotation3` - 0.618449) > 0.0005);
UPDATE `gameobject` SET `rotation0` = -0.065995, `rotation1` = -0.071404, `rotation2` = -0.619256, `rotation3` = 0.779146 WHERE `guid` = '21100854' AND (ABS(`rotation0` - -0.065995) > 0.0005 OR ABS(`rotation1` - -0.071404) > 0.0005 OR ABS(`rotation2` - -0.619256) > 0.0005 OR ABS(`rotation3` - 0.779146) > 0.0005);
UPDATE `gameobject` SET `rotation0` = -0.025141, `rotation1` = -0.093925, `rotation2` = -0.185082, `rotation3` = 0.977901 WHERE `guid` = '21100850' AND (ABS(`rotation0` - -0.025141) > 0.0005 OR ABS(`rotation1` - -0.093925) > 0.0005 OR ABS(`rotation2` - -0.185082) > 0.0005 OR ABS(`rotation3` - 0.977901) > 0.0005);
UPDATE `gameobject` SET `rotation0` = -0.062363, `rotation1` = -0.074598, `rotation2` = -0.579748, `rotation3` = 0.808973 WHERE `guid` = '21100862' AND (ABS(`rotation0` - -0.062363) > 0.0005 OR ABS(`rotation1` - -0.074598) > 0.0005 OR ABS(`rotation2` - -0.579748) > 0.0005 OR ABS(`rotation3` - 0.808973) > 0.0005);
UPDATE `gameobject` SET `rotation0` = -0.031598, `rotation1` = -0.091954, `rotation2` = -0.252488, `rotation3` = 0.962702 WHERE `guid` = '21100861' AND (ABS(`rotation0` - -0.031598) > 0.0005 OR ABS(`rotation1` - -0.091954) > 0.0005 OR ABS(`rotation2` - -0.252488) > 0.0005 OR ABS(`rotation3` - 0.962702) > 0.0005);
UPDATE `gameobject` SET `rotation0` = 0.07123, `rotation1` = -0.066183, `rotation2` = 0.777508, `rotation3` = 0.621311 WHERE `guid` = '21100864' AND (ABS(`rotation0` - 0.07123) > 0.0005 OR ABS(`rotation1` - -0.066183) > 0.0005 OR ABS(`rotation2` - 0.777508) > 0.0005 OR ABS(`rotation3` - 0.621311) > 0.0005);
UPDATE `gameobject` SET `state` = 1 WHERE `guid` = '21100881' AND (NOT (`state` <=> 1));
UPDATE `gameobject` SET `state` = 1 WHERE `guid` = '21100872' AND (NOT (`state` <=> 1));
UPDATE `gameobject` SET `state` = 1 WHERE `guid` = '21100879' AND (NOT (`state` <=> 1));
UPDATE `gameobject` SET `state` = 1 WHERE `guid` = '21100867' AND (NOT (`state` <=> 1));
UPDATE `gameobject` SET `state` = 1 WHERE `guid` = '21100880' AND (NOT (`state` <=> 1));
UPDATE `gameobject` SET `state` = 1 WHERE `guid` = '21100873' AND (NOT (`state` <=> 1));
UPDATE `gameobject` SET `state` = 1 WHERE `guid` = '21100869' AND (NOT (`state` <=> 1));
UPDATE `gameobject` SET `state` = 1 WHERE `guid` = '21100874' AND (NOT (`state` <=> 1));
UPDATE `gameobject` SET `state` = 1 WHERE `guid` = '21100871' AND (NOT (`state` <=> 1));
UPDATE `gameobject` SET `state` = 1 WHERE `guid` = '21100876' AND (NOT (`state` <=> 1));
UPDATE `gameobject` SET `state` = 1 WHERE `guid` = '21100878' AND (NOT (`state` <=> 1));
UPDATE `gameobject` SET `rotation0` = 0.032747, `rotation1` = 0.032156, `rotation2` = 0.740268, `rotation3` = 0.670744 WHERE `guid` = '21100825' AND (ABS(`rotation0` - 0.032747) > 0.0005 OR ABS(`rotation1` - 0.032156) > 0.0005 OR ABS(`rotation2` - 0.740268) > 0.0005 OR ABS(`rotation3` - 0.670744) > 0.0005);
UPDATE `gameobject` SET `rotation0` = -0.01682, `rotation1` = 0.01206, `rotation2` = 0.889815, `rotation3` = 0.455851 WHERE `guid` = '21100835' AND (ABS(`rotation0` - -0.01682) > 0.0005 OR ABS(`rotation1` - 0.01206) > 0.0005 OR ABS(`rotation2` - 0.889815) > 0.0005 OR ABS(`rotation3` - 0.455851) > 0.0005);
UPDATE `gameobject` SET `rotation0` = -0.004495, `rotation1` = 0.040753, `rotation2` = 0.615963, `rotation3` = 0.786707 WHERE `guid` = '21100842' AND (ABS(`rotation0` - -0.004495) > 0.0005 OR ABS(`rotation1` - 0.040753) > 0.0005 OR ABS(`rotation2` - 0.615963) > 0.0005 OR ABS(`rotation3` - 0.786707) > 0.0005);
UPDATE `gameobject` SET `rotation0` = -0.034983, `rotation1` = 0.017037, `rotation2` = 0.563573, `rotation3` = 0.825149 WHERE `guid` = '21100848' AND (ABS(`rotation0` - -0.034983) > 0.0005 OR ABS(`rotation1` - 0.017037) > 0.0005 OR ABS(`rotation2` - 0.563573) > 0.0005 OR ABS(`rotation3` - 0.825149) > 0.0005);
UPDATE `gameobject` SET `rotation3` = 0.979925 WHERE `guid` = '30045065' AND (ABS(`rotation3` - 0.979925) > 0.0005);
INSERT INTO `creature` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnDifficulties`,`phaseUseFlags`,`PhaseId`,`PhaseGroup`,`terrainSwapMap`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`wander_distance`,`currentwaypoint`,`curHealthPct`,`MovementType`,`npcflag`,`unit_flags`,`unit_flags2`,`unit_flags3`,`ScriptName`,`StringId`,`VerifiedBuild`)
SELECT `guid`,`id`,`map`,`zoneId`,`areaId`,`spawnDifficulties`,`phaseUseFlags`,`PhaseId`,`PhaseGroup`,`terrainSwapMap`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`wander_distance`,`currentwaypoint`,`curHealthPct`,`MovementType`,`npcflag`,`unit_flags`,`unit_flags2`,`unit_flags3`,`ScriptName`,`StringId`,`VerifiedBuild`
FROM (
SELECT 22600000 AS `guid`, 2334 AS `id`, 0 AS `map`, 0 AS `zoneId`, 0 AS `areaId`, '0' AS `spawnDifficulties`, 0 AS `phaseUseFlags`, 0 AS `PhaseId`, 0 AS `PhaseGroup`, -1 AS `terrainSwapMap`, 0 AS `modelid`, 0 AS `equipment_id`, -8950.46191 AS `position_x`, 881.59552 AS `position_y`, 59.54026 AS `position_z`, 1.32645 AS `orientation`, 300 AS `spawntimesecs`, 0.0 AS `wander_distance`, 0 AS `currentwaypoint`, NULL AS `curHealthPct`, 0 AS `MovementType`, NULL AS `npcflag`, NULL AS `unit_flags`, NULL AS `unit_flags2`, NULL AS `unit_flags3`, '' AS `ScriptName`, NULL AS `StringId`, 70425 AS `VerifiedBuild`
UNION ALL SELECT 22600001, 2334, 0, 0, 0, '0', 0, 0, 0, -1, 0, 0, -8409.47266, 626.14758, 59.73692, 5.794493, 300, 0.0, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, 70425
UNION ALL SELECT 22600002, 2543, 0, 0, 0, '0', 0, 0, 0, -1, 0, 1, 385.06772, 386.80035, 110.89934, 4.185212, 180, 0.0, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, 70425
UNION ALL SELECT 22600003, 5736, 0, 0, 0, '0', 0, 0, 0, -1, 0, 0, 1400.85217, 363.24234, -84.86803, 1.117011, 300, 0.0, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, 70338
UNION ALL SELECT 22600004, 3296, 1, 0, 0, '0', 0, 0, 0, -1, 0, 1, 1603.47876, -4449.94824, 8.1165, 2.391101, 300, 0.0, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, 70338
UNION ALL SELECT 22600005, 15384, 1, 0, 0, '0', 0, 0, 0, -1, 0, 0, 1321.38025, -4651.84033, 53.95083, 3.13496, 3660, 0.0, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, 70338
UNION ALL SELECT 22600006, 254100, 2991, 0, 0, '0', 0, 0, 0, -1, 0, 0, 3292.80029, 1716.65845, 827.31201, 4.463936, 120, 0.0, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, 70338
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature` AS `x` WHERE `x`.`guid` = `v`.`guid`);
INSERT IGNORE INTO `creature_addon` (`guid`,`PathId`,`mount`,`MountCreatureID`,`StandState`,`AnimTier`,`VisFlags`,`SheathState`,`PvPFlags`,`emote`,`aiAnimKit`,`movementAnimKit`,`meleeAnimKit`,`visibilityDistanceType`,`auras`) VALUES
('21100984',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21100983',0,0,0,0,0,0,0,0,0,0,0,0,0,'1310595 1326064'),
('21500239',0,0,0,0,0,0,0,0,0,0,0,0,0,'1310595 1326064'),
('21101341',0,0,0,0,0,0,1,0,1096,0,0,0,0,'1283391'),
('21101342',0,0,0,0,0,0,1,0,1096,0,0,0,0,'1283391'),
('21100962',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21100925',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21100977',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21100964',0,0,0,0,0,0,0,0,0,0,0,0,0,'5232'),
('21101696',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21100971',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21100968',0,0,0,0,0,0,1,0,69,0,0,0,0,NULL),
('21100963',0,0,0,0,0,0,0,0,0,0,0,0,0,'1460'),
('21200314',0,0,0,0,0,0,0,0,0,0,0,0,0,'1326368'),
('21200326',0,0,0,0,0,0,0,0,0,0,0,0,0,'1326368'),
('21200315',0,0,0,0,0,0,0,0,0,0,0,0,0,'1326368'),
('21200316',0,0,0,0,0,0,0,0,1096,0,0,0,0,'1326368'),
('21200320',0,0,0,0,0,0,0,0,0,0,0,0,0,'1326368'),
('21200322',0,0,0,0,0,0,0,0,0,0,0,0,0,'1326368'),
('21200317',0,0,0,0,0,0,0,0,0,0,0,0,0,'1326368'),
('21200318',0,0,0,0,0,0,0,0,0,0,0,0,0,'1326368'),
('21200319',0,0,0,0,0,0,0,0,0,0,0,0,0,'1326368'),
('21200321',0,0,0,0,0,0,0,0,0,0,0,0,0,'1326368'),
('21200358',0,0,0,3,0,0,1,0,0,0,0,0,0,NULL),
('21200042',0,0,0,0,0,0,0,1,69,0,0,0,0,NULL),
('21200458',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21200460',0,0,0,0,0,0,2,0,0,0,0,0,0,NULL),
('21200459',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('20089294',0,0,0,1,0,0,1,0,0,0,0,0,0,NULL),
('20086597',0,0,0,1,0,0,1,0,0,0,0,0,0,NULL),
('21200658',0,0,0,3,0,0,1,0,0,0,0,0,0,NULL),
('21100975',0,0,0,3,0,0,1,0,0,0,0,0,0,NULL),
('21101592',0,0,0,0,0,0,1,0,69,0,0,0,0,NULL),
('21101955',0,0,0,1,0,0,1,0,0,0,0,0,0,NULL),
('21500052',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('20087044',0,0,0,0,0,1,1,0,0,0,0,0,0,'10848 9036'),
('21200610',0,0,0,0,0,0,1,0,1096,0,0,0,0,NULL),
('21200651',0,0,0,1,0,0,1,0,0,0,0,0,0,NULL),
('21200657',0,0,0,3,0,0,1,0,0,0,0,0,0,NULL),
('21200544',0,0,0,8,0,0,1,0,0,0,0,0,0,NULL),
('21200528',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21200534',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21200526',0,0,0,0,0,0,2,0,0,0,0,0,0,NULL),
('21200529',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21200523',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21200531',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21200530',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21200524',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21200527',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21200652',0,0,0,0,0,0,2,0,0,0,0,0,0,NULL),
('21200653',0,0,0,0,0,0,2,0,0,0,0,0,0,NULL),
('20300378',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21200643',0,0,0,3,0,0,1,0,0,0,0,0,0,NULL),
('21100447',0,0,0,0,0,0,0,0,0,0,0,0,0,'1254892'),
('21100443',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21100451',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21100450',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21100442',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21100923',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21100453',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21101632',0,0,0,0,0,0,1,0,376,0,0,0,0,NULL),
('21101718',0,0,0,0,0,0,1,0,1134,0,0,0,0,NULL),
('21100454',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21101633',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21101512',0,0,0,0,0,0,1,0,376,0,0,0,0,NULL),
('21101514',0,0,0,0,0,0,1,0,376,0,0,0,0,NULL),
('21100960',0,0,0,0,0,0,1,0,376,0,0,0,0,NULL),
('21100548',0,0,0,0,0,0,1,0,333,0,0,0,0,'1270462'),
('21100549',0,0,0,0,0,0,1,0,333,0,0,0,0,'1270462'),
('21100551',0,0,0,0,0,0,1,0,333,0,0,0,0,'1270462'),
('21100550',0,0,0,0,0,0,1,0,333,0,0,0,0,'1270462'),
('21101334',0,0,0,0,0,0,0,0,0,0,0,0,0,'1229736 1230164'),
('21101583',0,0,0,1,0,0,0,0,0,0,0,0,0,'1283391'),
('21101338',0,0,0,0,0,0,0,0,0,0,0,0,0,'1283391'),
('21101333',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21101336',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21100553',0,0,0,0,0,0,0,0,0,0,0,0,0,'1283391'),
('21100000',0,0,0,0,0,1,1,0,0,0,0,0,0,'10848 9036'),
('21100001',0,0,0,0,0,1,1,0,0,0,0,0,0,'10848 9036'),
('21100002',0,0,0,0,0,1,1,0,0,0,0,0,0,'10848 9036'),
('21100003',0,0,0,0,0,1,1,0,0,0,0,0,0,'10848 9036'),
('21100758',0,0,0,0,0,0,1,0,1038,0,0,0,0,NULL),
('21100974',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21101516',0,0,0,0,0,0,1,0,69,0,0,0,0,NULL),
('21100969',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21101730',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21101687',0,0,0,1,0,0,1,0,0,0,0,0,0,NULL),
('21101685',0,0,0,3,0,0,1,0,0,0,0,0,0,NULL),
('21100965',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21100972',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21101576',0,0,0,3,0,0,1,0,0,0,0,0,0,NULL),
('21100970',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21100978',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21101689',0,0,0,1,0,0,1,0,0,0,0,0,0,NULL),
('21500392',0,0,0,0,0,0,0,0,0,0,0,0,0,'1269135'),
('21101200',0,0,0,3,0,0,1,0,0,0,0,0,0,NULL),
('21101154',0,0,0,0,0,2,1,0,0,0,0,0,0,'22766 7939'),
('21101162',0,0,0,0,0,2,1,0,0,0,0,0,0,'22766 7939'),
('21101153',0,0,0,0,0,2,1,0,0,0,0,0,0,'22766 7939'),
('21101155',0,0,0,0,0,2,1,0,0,0,0,0,0,'22766 7939'),
('21101152',0,0,0,0,0,2,1,0,0,0,0,0,0,'22766 7939'),
('21101148',0,0,0,0,0,2,1,0,0,0,0,0,0,'22766 7939'),
('21101250',0,0,0,1,0,0,1,0,0,0,0,0,0,NULL),
('21100966',0,0,0,8,0,0,1,0,0,0,0,0,0,NULL),
('21101847',0,0,0,0,0,0,1,0,376,0,0,0,0,NULL),
('21101491',0,0,0,8,0,0,1,0,0,0,0,0,0,NULL),
('21101785',0,0,0,8,0,0,1,0,0,0,0,0,0,NULL),
('21101017',0,0,0,0,0,0,1,0,375,0,0,0,0,NULL),
('21101641',0,0,0,0,0,4,1,0,0,0,0,0,0,NULL),
('21101653',0,0,0,0,0,4,1,0,0,0,0,0,0,NULL),
('21101362',0,0,0,0,0,0,1,0,333,0,0,0,0,NULL),
('21101637',0,0,0,0,0,4,1,0,0,0,0,0,0,NULL),
('21101636',0,0,0,0,0,4,1,0,0,0,0,0,0,NULL),
('21101643',0,0,0,0,0,0,1,0,64,0,0,0,0,'1276061'),
('21101642',0,0,0,3,0,0,1,0,0,0,0,0,0,NULL),
('21101638',0,0,0,3,0,0,1,0,0,0,0,0,0,NULL),
('21101309',0,0,0,0,0,0,1,0,1047,0,0,0,0,NULL),
('21101650',0,0,0,3,0,0,1,0,0,0,0,0,0,NULL),
('21101648',0,0,0,0,0,4,1,0,0,0,0,0,0,NULL),
('21101649',0,0,0,0,0,0,1,0,64,0,0,0,0,'1276061'),
('21101690',0,0,0,0,0,4,1,0,0,0,0,0,0,NULL),
('21101364',0,0,0,0,0,0,0,0,375,0,0,0,0,NULL),
('21101363',0,0,0,0,0,0,0,0,375,0,0,0,0,NULL),
('21101365',0,0,0,0,0,0,0,0,375,0,0,0,0,NULL),
('21101366',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21101372',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21101371',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21101373',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21101368',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21101367',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21101370',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21101369',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21101307',0,0,0,8,0,0,1,0,0,0,0,0,0,NULL),
('21101330',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21101308',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21101717',0,0,0,3,0,0,1,0,0,0,0,0,0,NULL),
('21300253',0,0,0,0,0,4,1,0,0,0,0,0,0,NULL),
('21300254',0,0,0,0,0,4,1,0,0,0,0,0,0,NULL),
('21300255',0,0,0,0,0,4,1,0,0,0,0,0,0,NULL),
('21300259',0,0,0,0,0,4,1,0,0,0,0,0,0,NULL),
('21300257',0,0,0,0,0,4,1,0,0,0,0,0,0,NULL),
('21300256',0,0,0,0,0,4,1,0,0,0,0,0,0,NULL),
('21300258',0,0,0,0,0,4,1,0,0,0,0,0,0,NULL),
('21300238',0,0,0,0,0,0,1,0,1038,0,0,0,0,'13377'),
('21200183',0,0,0,1,0,0,1,0,0,0,0,0,0,NULL),
('21500072',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21200447',0,0,0,1,0,0,1,0,0,0,0,0,0,NULL),
('21200446',0,0,0,1,0,0,1,0,0,0,0,0,0,NULL),
('21200445',0,0,0,1,0,0,1,0,0,0,0,0,0,NULL),
('21200444',0,0,0,0,0,0,1,0,69,0,0,0,0,NULL),
('21200497',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21200501',0,0,0,0,0,0,0,0,0,0,0,0,0,'12544'),
('21200441',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),
('21200440',0,0,0,0,0,0,0,0,0,0,0,0,0,NULL);
