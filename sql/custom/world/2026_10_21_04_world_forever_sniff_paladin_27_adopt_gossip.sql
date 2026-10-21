-- Classic 1.60 (WoW Forever): gossip_menu_option: поля по снифу, ruRU, новые и устаревшие опции меню Forever
-- Источник: снифы официального сервера Classic (бета «актуал»), сборки 70245, 70291, 70338, 70425, 70450; сгенерировано ForeverSniffTools.
-- UPDATE с защитным условием, INSERT IGNORE/NOT EXISTS, DELETE устаревших опций меню Forever без условий.
-- Повторный запуск безопасен (проверено прогоном дважды на копии снимка БД).

UPDATE `gossip_menu_option_locale` SET `OptionText` = 'Учитель профессии' WHERE `MenuID` = 3356 AND `OptionID` = 0 AND `Locale` = 'ruRU' AND (NOT (CAST(`OptionText` AS BINARY) <=> CAST('Учитель профессии' AS BINARY)));
UPDATE `gossip_menu_option_locale` SET `OptionText` = 'Одумайся...' WHERE `MenuID` = 39644 AND `OptionID` = 0 AND `Locale` = 'ruRU' AND (NOT (CAST(`OptionText` AS BINARY) <=> CAST('Одумайся...' AS BINARY)));
UPDATE `gossip_menu_option_locale` SET `OptionText` = 'Здравствуй, товарищ-паладин. Я понимаю твое потрясение, но тебя воскресили и дали еще один шанс послужить Свету. Пойдем со мной: я помогу тебе привыкнуть к новой жизни.' WHERE `MenuID` = 39645 AND `OptionID` = 0 AND `Locale` = 'ruRU' AND (NOT (CAST(`OptionText` AS BINARY) <=> CAST('Здравствуй, товарищ-паладин. Я понимаю твое потрясение, но тебя воскресили и дали еще один шанс послужить Свету. Пойдем со мной: я помогу тебе привыкнуть к новой жизни.' AS BINARY)));
UPDATE `gossip_menu_option_locale` SET `OptionText` = 'Учитель профессии' WHERE `MenuID` = 44990 AND `OptionID` = 5 AND `Locale` = 'ruRU' AND (NOT (CAST(`OptionText` AS BINARY) <=> CAST('Учитель профессии' AS BINARY)));
UPDATE `gossip_menu_option_locale` SET `OptionText` = 'Учитель профессии' WHERE `MenuID` = 44991 AND `OptionID` = 5 AND `Locale` = 'ruRU' AND (NOT (CAST(`OptionText` AS BINARY) <=> CAST('Учитель профессии' AS BINARY)));
UPDATE `gossip_menu_option_locale` SET `OptionText` = 'Палач Зуганд ждет доклад.' WHERE `MenuID` = 44991 AND `OptionID` = 6 AND `Locale` = 'ruRU' AND (NOT (CAST(`OptionText` AS BINARY) <=> CAST('Палач Зуганд ждет доклад.' AS BINARY)));
UPDATE `gossip_menu_option_locale` SET `OptionText` = 'Палач Зуганд ждет доклад.' WHERE `MenuID` = 44993 AND `OptionID` = 0 AND `Locale` = 'ruRU' AND (NOT (CAST(`OptionText` AS BINARY) <=> CAST('Палач Зуганд ждет доклад.' AS BINARY)));
INSERT IGNORE INTO `gossip_menu_option_locale` (`MenuID`,`OptionID`,`Locale`,`OptionText`,`BoxText`) VALUES
(83,0,'ruRU','Верни меня к жизни.',NULL),
(1296,0,'ruRU','Конфета или жизнь!',NULL),
(1296,1,'ruRU','Я хочу остановиться здесь.',NULL),
(1296,5,'ruRU','Позвольте посмотреть ваши товары.',NULL),
(1296,3,'ruRU','Чем я могу заняться в гостинице?',NULL),
(1781,0,'ruRU','Покажите мне, что у вас есть на продажу.',NULL),
(3356,4,'ruRU','Дрессировщик летучих мышей',NULL),
(4184,0,'ruRU','Обучи меня.',NULL),
(39335,0,'ruRU','Я хочу узнать больше об учении Света.',NULL),
(39647,0,'ruRU','Я хочу узнать больше об учении Света.',NULL),
(44733,0,'ruRU','Обучи меня.',NULL),
(44990,1,'ruRU','Дрессировщик летучих мышей',NULL),
(44991,1,'ruRU','Дрессировщик летучих мышей',NULL);
