-- Forever (Classic 1.60): шанс выпадения предметов заданий по официальным снифам.
-- Строки с заглушкой 40%% получают измеренный шанс (выпало / вскрыто трупов), если он выше заглушки. Можно запускать повторно.

UPDATE `creature_loot_template` SET `Chance` = 87.5, `Comment` = 'sniff: 7 of 8 looted (quest item, was placeholder 40.0)'
WHERE `Entry` = 299 AND `ItemType` = 0 AND `Item` = 750 AND `QuestRequired` = 1 AND `Comment` LIKE 'quest item of the creature query%';
UPDATE `creature_loot_template` SET `Chance` = 73.33, `Comment` = 'sniff: 11 of 15 looted (quest item, was placeholder 40.0)'
WHERE `Entry` = 1506 AND `ItemType` = 0 AND `Item` = 3266 AND `QuestRequired` = 1 AND `Comment` LIKE 'quest item of the creature query%';
UPDATE `creature_loot_template` SET `Chance` = 85.71, `Comment` = 'sniff: 6 of 7 looted (quest item, was placeholder 40.0)'
WHERE `Entry` = 1508 AND `ItemType` = 0 AND `Item` = 3265 AND `QuestRequired` = 1 AND `Comment` LIKE 'quest item of the creature query%';
UPDATE `creature_loot_template` SET `Chance` = 66.67, `Comment` = 'sniff: 6 of 9 looted (quest item, was placeholder 40.0)'
WHERE `Entry` = 1512 AND `ItemType` = 0 AND `Item` = 3264 AND `QuestRequired` = 1 AND `Comment` LIKE 'quest item of the creature query%';
UPDATE `creature_loot_template` SET `Chance` = 62.5, `Comment` = 'sniff: 5 of 8 looted (quest item, was placeholder 40.0)'
WHERE `Entry` = 1526 AND `ItemType` = 0 AND `Item` = 2855 AND `QuestRequired` = 1 AND `Comment` LIKE 'quest item of the creature query%';
UPDATE `creature_loot_template` SET `Chance` = 100.0, `Comment` = 'sniff: 3 of 3 looted (quest item, was placeholder 40.0)'
WHERE `Entry` = 1547 AND `ItemType` = 0 AND `Item` = 2858 AND `QuestRequired` = 1 AND `Comment` LIKE 'quest item of the creature query%';
UPDATE `creature_loot_template` SET `Chance` = 66.67, `Comment` = 'sniff: 2 of 3 looted (quest item, was placeholder 40.0)'
WHERE `Entry` = 1547 AND `ItemType` = 0 AND `Item` = 278243 AND `QuestRequired` = 1 AND `Comment` LIKE 'quest item of the creature query%';
UPDATE `creature_loot_template` SET `Chance` = 50.0, `Comment` = 'sniff: 3 of 6 looted (quest item, was placeholder 40.0)'
WHERE `Entry` = 1553 AND `ItemType` = 0 AND `Item` = 278242 AND `QuestRequired` = 1 AND `Comment` LIKE 'quest item of the creature query%';
