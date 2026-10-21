-- Classic 1.60 (WoW Forever): лут: поправки по наблюдениям (биномиальный тест p < 0.001), отдельные таблицы шкуры, лут объектов
-- Источник: снифы официального сервера Classic (бета «актуал»), сборки 70245, 70291, 70338, 70425, 70450; сгенерировано ForeverSniffTools.
-- UPDATE с защитным условием; DELETE строки лута по ключу (Entry, ItemType, Item); INSERT NOT EXISTS.
-- Повторный запуск безопасен (проверено прогоном дважды на копии снимка БД).

DELETE FROM `creature_loot_template` WHERE `Entry` = 515 AND `ItemType` = 0 AND `Item` = 1468 AND `GroupId` = 0 AND ABS(`Chance` - 42.161) < 0.005;
INSERT INTO `gameobject_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 134420 AS `Entry`, 0 AS `ItemType`, 2770 AS `Item`, 80.0 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 4 of 4 opens' AS `Comment`
UNION ALL SELECT 134420, 0, 2835, 80.0, 0, 1, 0, 1, 1, 'sniff: 4 of 4 opens'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `gameobject_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
