-- Classic 1.60 (WoW Forever): лут: поправки по наблюдениям (биномиальный тест p < 0.001), отдельные таблицы шкуры, лут объектов
-- Источник: снифы официального сервера Classic (бета «актуал»), сборки 70245, 70291, 70338, 70425; сгенерировано ForeverSniffTools.
-- UPDATE с защитным условием; DELETE строки лута по ключу (Entry, ItemType, Item); INSERT NOT EXISTS.
-- Повторный запуск безопасен (проверено прогоном дважды на копии снимка БД).

DELETE FROM `creature_loot_template` WHERE `Entry` = 251291 AND `ItemType` = 0 AND `Item` = 2934 AND `GroupId` = 0 AND ABS(`Chance` - 40.74) < 0.005;
DELETE FROM `creature_loot_template` WHERE `Entry` = 251661 AND `ItemType` = 0 AND `Item` = 2934 AND `GroupId` = 0 AND ABS(`Chance` - 24.32) < 0.005;
DELETE FROM `skinning_loot_template` WHERE `Entry` = 118 AND `ItemType` = 0 AND `Item` = 2318 AND ABS(`Chance` - 39.9457) < 0.005;
UPDATE `skinning_loot_template` SET `Chance` = 100.0 WHERE `Entry` = 118 AND `ItemType` = 0 AND `Item` = 2934 AND (ABS(`Chance` - 100.0) > 0.005);
INSERT INTO `skinning_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 910251245 AS `Entry`, 0 AS `ItemType`, 2318 AS `Item`, 50.0 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 1 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 2 of 4 skinnings' AS `Comment`
UNION ALL SELECT 910251245, 0, 2934, 50.0, 0, 1, 1, 1, 1, 'sniff: 2 of 4 skinnings'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `skinning_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
UPDATE `creature_template_difficulty` SET `SkinLootID` = 910251245 WHERE `Entry` = 251245 AND `DifficultyID` = 0 AND `SkinLootID` = 118;
INSERT INTO `gameobject_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 139192 AS `Entry`, 0 AS `ItemType`, 2653 AS `Item`, 20.0 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 1 opens' AS `Comment`
UNION ALL SELECT 139192, 0, 252022, 20.0, 0, 1, 0, 1, 1, 'sniff: 1 of 1 opens'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `gameobject_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `gameobject_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 139194 AS `Entry`, 0 AS `ItemType`, 2773 AS `Item`, 20.0 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 3 opens' AS `Comment`
UNION ALL SELECT 139194, 0, 6507, 20.0, 0, 1, 0, 1, 1, 'sniff: 1 of 3 opens'
UNION ALL SELECT 139194, 0, 211780, 20.0, 0, 1, 0, 1, 1, 'sniff: 1 of 3 opens'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `gameobject_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
