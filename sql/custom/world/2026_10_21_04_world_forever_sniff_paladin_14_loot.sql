-- Classic 1.60 (WoW Forever): добыча с существ: недостающие предметы, новые наборы, золото
-- Источник: снифы официального сервера Classic (бета «актуал»), сборки 70245, 70291, 70338, 70425, 70450; сгенерировано ForeverSniffTools.
-- Только добавление: строки лута вставляются, только если пары (Entry, ItemType, Item) ещё нет; золото и LootID обновляются только там, где сейчас 0. Ничего не удаляется.
-- Повторный запуск безопасен (проверено прогоном дважды на копии снимка БД).

INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 515 AS `Entry`, 0 AS `ItemType`, 254548 AS `Item`, 13.33 AS `Chance`, 1 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 2 of 15 kills' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 1506 AS `Entry`, 0 AS `ItemType`, 2589 AS `Item`, 40.0 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 6 of 15 kills' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 1890 AS `Entry`, 0 AS `ItemType`, 2589 AS `Item`, 41.67 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 5 of 12 kills' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
