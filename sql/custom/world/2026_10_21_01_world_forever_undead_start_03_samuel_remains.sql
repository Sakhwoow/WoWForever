-- Forever (Classic 1.60): стартовая зона нежити (Могильник), «Останки Самуэля» (задание 6395) у Самуэля Фиппса
-- Можно запускать повторно.


-- Предмет нужен для задания «Последнее желание Марлы», выпадает у единственного существа, поэтому всегда.
UPDATE `creature_loot_template` SET `Chance` = 100,
    `Comment` = 'quest item of Marla''s Last Wish, 100% from the only creature that drops it'
WHERE `Entry` = 1919 AND `Item` = 16333 AND `QuestRequired` = 1;
