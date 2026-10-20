-- Classic 1.60 (WoW Forever): добыча с существ: недостающие предметы, новые наборы, золото
-- Источник: снифы официального сервера Classic (бета «актуал»), сборки 70245, 70291, 70338, 70425; сгенерировано ForeverSniffTools.
-- Только добавление: строки лута вставляются, только если пары (Entry, ItemType, Item) ещё нет; золото и LootID обновляются только там, где сейчас 0. Ничего не удаляется.
-- Повторный запуск безопасен (проверено прогоном дважды на копии снимка БД).

INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 6 AS `Entry`, 0 AS `ItemType`, 2589 AS `Item`, 36.36 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 4 of 11 kills' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 69 AS `Entry`, 0 AS `ItemType`, 2672 AS `Item`, 20.0 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 1 kills (few samples: item exists in loot, chance is a lower bound c/5)' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 257 AS `Entry`, 0 AS `ItemType`, 2589 AS `Item`, 16.67 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 6 kills' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 299 AS `Entry`, 0 AS `ItemType`, 2672 AS `Item`, 12.5 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 8 kills' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 250868 AS `Entry`, 0 AS `ItemType`, 2672 AS `Item`, 20.0 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 3 kills (few samples: item exists in loot, chance is a lower bound c/5)' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 250873 AS `Entry`, 0 AS `ItemType`, 1370 AS `Item`, 12.5 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 8 kills' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 250926 AS `Entry`, 0 AS `ItemType`, 1369 AS `Item`, 5.88 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 17 kills' AS `Comment`
UNION ALL SELECT 250926, 0, 1372, 5.88, 0, 1, 0, 1, 1, 'sniff: 1 of 17 kills'
UNION ALL SELECT 250926, 0, 1380, 5.88, 0, 1, 0, 1, 1, 'sniff: 1 of 17 kills'
UNION ALL SELECT 250926, 0, 2650, 5.88, 0, 1, 0, 1, 1, 'sniff: 1 of 17 kills'
UNION ALL SELECT 250926, 0, 2654, 5.88, 0, 1, 0, 1, 1, 'sniff: 1 of 17 kills'
UNION ALL SELECT 250926, 0, 2656, 5.88, 0, 1, 0, 1, 1, 'sniff: 1 of 17 kills'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 250937 AS `Entry`, 0 AS `ItemType`, 1372 AS `Item`, 4.55 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 22 kills' AS `Comment`
UNION ALL SELECT 250937, 0, 1378, 4.55, 0, 1, 0, 1, 1, 'sniff: 1 of 22 kills'
UNION ALL SELECT 250937, 0, 3365, 4.55, 0, 1, 0, 1, 1, 'sniff: 1 of 22 kills'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 251143 AS `Entry`, 0 AS `ItemType`, 2654 AS `Item`, 15.38 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 2 of 13 kills' AS `Comment`
UNION ALL SELECT 251143, 0, 1367, 7.69, 0, 1, 0, 1, 1, 'sniff: 1 of 13 kills'
UNION ALL SELECT 251143, 0, 1374, 7.69, 0, 1, 0, 1, 1, 'sniff: 1 of 13 kills'
UNION ALL SELECT 251143, 0, 1377, 7.69, 0, 1, 0, 1, 1, 'sniff: 1 of 13 kills'
UNION ALL SELECT 251143, 0, 1378, 7.69, 0, 1, 0, 1, 1, 'sniff: 1 of 13 kills'
UNION ALL SELECT 251143, 0, 5571, 7.69, 0, 1, 0, 1, 1, 'sniff: 1 of 13 kills'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 251145 AS `Entry`, 0 AS `ItemType`, 1372 AS `Item`, 16.67 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 2 of 12 kills' AS `Comment`
UNION ALL SELECT 251145, 0, 1368, 8.33, 0, 1, 0, 1, 1, 'sniff: 1 of 12 kills'
UNION ALL SELECT 251145, 0, 1377, 8.33, 0, 1, 0, 1, 1, 'sniff: 1 of 12 kills'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 251160 AS `Entry`, 0 AS `ItemType`, 159 AS `Item`, 14.29 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 2 of 14 kills' AS `Comment`
UNION ALL SELECT 251160, 0, 1380, 7.14, 0, 1, 0, 1, 1, 'sniff: 1 of 14 kills'
UNION ALL SELECT 251160, 0, 2652, 7.14, 0, 1, 0, 1, 1, 'sniff: 1 of 14 kills'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 251169 AS `Entry`, 0 AS `ItemType`, 1377 AS `Item`, 25.0 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 2 of 8 kills' AS `Comment`
UNION ALL SELECT 251169, 0, 2654, 12.5, 0, 1, 0, 1, 1, 'sniff: 1 of 8 kills'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 251245 AS `Entry`, 0 AS `ItemType`, 774 AS `Item`, 4.17 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 24 kills' AS `Comment`
UNION ALL SELECT 251245, 0, 1369, 4.17, 0, 1, 0, 1, 1, 'sniff: 1 of 24 kills'
UNION ALL SELECT 251245, 0, 1420, 4.17, 0, 1, 0, 1, 1, 'sniff: 1 of 24 kills'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 251261 AS `Entry`, 0 AS `ItemType`, 4775 AS `Item`, 60.0 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 3 of 3 kills (few samples: item exists in loot, chance is a lower bound c/5)' AS `Comment`
UNION ALL SELECT 251261, 0, 2773, 20.0, 0, 1, 0, 1, 1, 'sniff: 1 of 3 kills (few samples: item exists in loot, chance is a lower bound c/5)'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 251284 AS `Entry`, 0 AS `ItemType`, 774 AS `Item`, 6.25 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 16 kills' AS `Comment`
UNION ALL SELECT 251284, 0, 818, 6.25, 0, 1, 0, 1, 1, 'sniff: 1 of 16 kills'
UNION ALL SELECT 251284, 0, 2213, 6.25, 0, 1, 0, 1, 1, 'sniff: 1 of 16 kills'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 251291 AS `Entry`, 0 AS `ItemType`, 3373 AS `Item`, 5.88 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 17 kills' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 251622 AS `Entry`, 0 AS `ItemType`, 7100 AS `Item`, 20.0 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 2 kills (few samples: item exists in loot, chance is a lower bound c/5)' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 251661 AS `Entry`, 0 AS `ItemType`, 1364 AS `Item`, 3.92 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 2 of 51 kills' AS `Comment`
UNION ALL SELECT 251661, 0, 1413, 3.92, 0, 1, 0, 1, 1, 'sniff: 2 of 51 kills'
UNION ALL SELECT 251661, 0, 1368, 1.96, 0, 1, 0, 1, 1, 'sniff: 1 of 51 kills'
UNION ALL SELECT 251661, 0, 1369, 1.96, 0, 1, 0, 1, 1, 'sniff: 1 of 51 kills'
UNION ALL SELECT 251661, 0, 1372, 1.96, 0, 1, 0, 1, 1, 'sniff: 1 of 51 kills'
UNION ALL SELECT 251661, 0, 1378, 1.96, 0, 1, 0, 1, 1, 'sniff: 1 of 51 kills'
UNION ALL SELECT 251661, 0, 1421, 1.96, 0, 1, 0, 1, 1, 'sniff: 1 of 51 kills'
UNION ALL SELECT 251661, 0, 2213, 1.96, 0, 1, 0, 1, 1, 'sniff: 1 of 51 kills'
UNION ALL SELECT 251661, 0, 2648, 1.96, 0, 1, 0, 1, 1, 'sniff: 1 of 51 kills'
UNION ALL SELECT 251661, 0, 2650, 1.96, 0, 1, 0, 1, 1, 'sniff: 1 of 51 kills'
UNION ALL SELECT 251661, 0, 2774, 1.96, 0, 1, 0, 1, 1, 'sniff: 1 of 51 kills'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 251662 AS `Entry`, 0 AS `ItemType`, 2648 AS `Item`, 14.29 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 7 kills' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 251676 AS `Entry`, 0 AS `ItemType`, 4686 AS `Item`, 10.0 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 10 kills' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 251707 AS `Entry`, 0 AS `ItemType`, 15007 AS `Item`, 8.33 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 12 kills' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 251918 AS `Entry`, 0 AS `ItemType`, 252030 AS `Item`, 14.29 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 2 of 14 kills' AS `Comment`
UNION ALL SELECT 251918, 0, 1413, 7.14, 0, 1, 0, 1, 1, 'sniff: 1 of 14 kills'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 252068 AS `Entry`, 0 AS `ItemType`, 2138 AS `Item`, 9.09 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 11 kills' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 252664 AS `Entry`, 0 AS `ItemType`, 8178 AS `Item`, 20.0 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 5 kills' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 252665 AS `Entry`, 0 AS `ItemType`, 211780 AS `Item`, 10.0 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 10 kills' AS `Comment`
UNION ALL SELECT 252665, 0, 252022, 10.0, 0, 1, 0, 1, 1, 'sniff: 1 of 10 kills'
UNION ALL SELECT 252665, 0, 273815, 10.0, 0, 1, 0, 1, 1, 'sniff: 1 of 10 kills'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 252763 AS `Entry`, 0 AS `ItemType`, 267474 AS `Item`, 14.29 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 2 AS `MinCount`, 2 AS `MaxCount`, 'sniff: 1 of 7 kills' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 252802 AS `Entry`, 0 AS `ItemType`, 15299 AS `Item`, 16.67 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 6 kills' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 252820 AS `Entry`, 0 AS `ItemType`, 818 AS `Item`, 7.14 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 14 kills' AS `Comment`
UNION ALL SELECT 252820, 0, 1415, 7.14, 0, 1, 0, 1, 1, 'sniff: 1 of 14 kills'
UNION ALL SELECT 252820, 0, 1416, 7.14, 0, 1, 0, 1, 1, 'sniff: 1 of 14 kills'
UNION ALL SELECT 252820, 0, 2642, 7.14, 0, 1, 0, 1, 1, 'sniff: 1 of 14 kills'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 253195 AS `Entry`, 0 AS `ItemType`, 258771 AS `Item`, 33.33 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 2 of 6 kills' AS `Comment`
UNION ALL SELECT 253195, 0, 252028, 16.67, 0, 1, 0, 1, 1, 'sniff: 1 of 6 kills'
UNION ALL SELECT 253195, 0, 267474, 16.67, 0, 1, 0, 1, 1, 'sniff: 1 of 6 kills'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 253282 AS `Entry`, 0 AS `ItemType`, 1417 AS `Item`, 20.0 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 2 kills (few samples: item exists in loot, chance is a lower bound c/5)' AS `Comment`
UNION ALL SELECT 253282, 0, 3300, 20.0, 0, 1, 0, 1, 1, 'sniff: 1 of 2 kills (few samples: item exists in loot, chance is a lower bound c/5)'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 253511 AS `Entry`, 0 AS `ItemType`, 258771 AS `Item`, 40.0 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 2 of 5 kills' AS `Comment`
UNION ALL SELECT 253511, 0, 252031, 20.0, 0, 1, 0, 2, 2, 'sniff: 1 of 5 kills'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 253622 AS `Entry`, 0 AS `ItemType`, 255663 AS `Item`, 20.0 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 2 kills (few samples: item exists in loot, chance is a lower bound c/5)' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 254588 AS `Entry`, 0 AS `ItemType`, 828 AS `Item`, 12.5 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 8 kills' AS `Comment`
UNION ALL SELECT 254588, 0, 1420, 12.5, 0, 1, 0, 1, 1, 'sniff: 1 of 8 kills'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 254589 AS `Entry`, 0 AS `ItemType`, 7073 AS `Item`, 20.0 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 1 kills (few samples: item exists in loot, chance is a lower bound c/5)' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 254596 AS `Entry`, 0 AS `ItemType`, 1414 AS `Item`, 16.67 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 6 kills' AS `Comment`
UNION ALL SELECT 254596, 0, 252028, 16.67, 0, 1, 0, 2, 2, 'sniff: 1 of 6 kills'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 254626 AS `Entry`, 0 AS `ItemType`, 252030 AS `Item`, 18.18 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 2 AS `MaxCount`, 'sniff: 2 of 11 kills' AS `Comment`
UNION ALL SELECT 254626, 0, 1423, 9.09, 0, 1, 0, 1, 1, 'sniff: 1 of 11 kills'
UNION ALL SELECT 254626, 0, 1429, 9.09, 0, 1, 0, 1, 1, 'sniff: 1 of 11 kills'
UNION ALL SELECT 254626, 0, 3013, 9.09, 0, 1, 0, 1, 1, 'sniff: 1 of 11 kills'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 255534 AS `Entry`, 0 AS `ItemType`, 8177 AS `Item`, 20.0 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 1 kills (few samples: item exists in loot, chance is a lower bound c/5)' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 256092 AS `Entry`, 0 AS `ItemType`, 1506 AS `Item`, 4.76 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 21 kills' AS `Comment`
UNION ALL SELECT 256092, 0, 2646, 4.76, 0, 1, 0, 1, 1, 'sniff: 1 of 21 kills'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 257532 AS `Entry`, 0 AS `ItemType`, 118 AS `Item`, 28.57 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 2 of 7 kills' AS `Comment`
UNION ALL SELECT 257532, 0, 1417, 14.29, 0, 1, 0, 1, 1, 'sniff: 1 of 7 kills'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 263396 AS `Entry`, 0 AS `ItemType`, 1789 AS `Item`, 4.76 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 21 kills' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 270201 AS `Entry`, 0 AS `ItemType`, 258771 AS `Item`, 40.0 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 12 of 30 kills' AS `Comment`
UNION ALL SELECT 270201, 0, 8181, 3.33, 0, 1, 0, 1, 1, 'sniff: 1 of 30 kills'
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 276415 AS `Entry`, 0 AS `ItemType`, 15004 AS `Item`, 20.0 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 1 kills (few samples: item exists in loot, chance is a lower bound c/5)' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`
FROM (
SELECT 276416 AS `Entry`, 0 AS `ItemType`, 1425 AS `Item`, 20.0 AS `Chance`, 0 AS `QuestRequired`, 1 AS `LootMode`, 0 AS `GroupId`, 1 AS `MinCount`, 1 AS `MaxCount`, 'sniff: 1 of 1 kills (few samples: item exists in loot, chance is a lower bound c/5)' AS `Comment`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `creature_loot_template` AS `x` WHERE `x`.`Entry` = `v`.`Entry` AND `x`.`ItemType` = `v`.`ItemType` AND `x`.`Item` = `v`.`Item`);
UPDATE `creature_template_difficulty` SET `GoldMin` = 20, `GoldMax` = 30 WHERE `Entry` = 263390 AND `DifficultyID` = 0 AND `GoldMin` = 0 AND `GoldMax` = 0;
