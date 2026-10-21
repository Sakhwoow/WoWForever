-- Classic 1.60 (WoW Forever): мир: world_state (значения по умолчанию, недостающие переменные) и points_of_interest
-- Источник: снифы официального сервера Classic (бета «актуал»), сборки 70245, 70291, 70338, 70425, 70450; сгенерировано ForeverSniffTools.
-- UPDATE с защитным условием; INSERT NOT EXISTS / IGNORE.
-- Повторный запуск безопасен (проверено прогоном дважды на копии снимка БД).

INSERT INTO `world_state` (`ID`,`DefaultValue`,`MapIDs`,`AreaIDs`,`ScriptName`,`Comment`)
SELECT `ID`,`DefaultValue`,`MapIDs`,`AreaIDs`,`ScriptName`,`Comment`
FROM (
SELECT 29370 AS `ID`, 0 AS `DefaultValue`, '0' AS `MapIDs`, '40' AS `AreaIDs`, '' AS `ScriptName`, 'sniff: 17 наблюдений, значений 1' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `world_state` AS `x` WHERE `x`.`ID` = `v`.`ID`);
