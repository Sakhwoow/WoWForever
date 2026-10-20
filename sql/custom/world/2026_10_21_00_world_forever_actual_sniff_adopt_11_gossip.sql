-- Classic 1.60 (WoW Forever): gossip_menu_option: поля по снифу, ruRU, новые и устаревшие опции меню Forever
-- Источник: снифы официального сервера Classic (бета «актуал»), сборки 70245, 70291, 70338, 70425; сгенерировано ForeverSniffTools.
-- UPDATE с защитным условием, INSERT IGNORE/NOT EXISTS, DELETE устаревших опций меню Forever без условий.
-- Повторный запуск безопасен (проверено прогоном дважды на копии снимка БД).

DELETE FROM `gossip_menu_option` WHERE `MenuID` = 40936 AND `OptionID` = 4 AND `GossipOptionID` = 139958;
DELETE FROM `gossip_menu_option_locale` WHERE `MenuID` = 40936 AND `OptionID` = 4;
DELETE FROM `gossip_menu_option` WHERE `MenuID` = 40962 AND `OptionID` = 0 AND `GossipOptionID` = 136544;
DELETE FROM `gossip_menu_option_locale` WHERE `MenuID` = 40962 AND `OptionID` = 0;
INSERT INTO `gossip_menu_option` (`MenuID`,`GossipOptionID`,`OptionID`,`OptionNpc`,`OptionText`,`OptionBroadcastTextID`,`Language`,`Flags`,`ActionMenuID`,`ActionPoiID`,`GossipNpcOptionID`,`BoxCoded`,`BoxMoney`,`BoxText`,`BoxBroadcastTextID`,`SpellID`,`OverrideIconID`,`VerifiedBuild`)
SELECT `MenuID`,`GossipOptionID`,`OptionID`,`OptionNpc`,`OptionText`,`OptionBroadcastTextID`,`Language`,`Flags`,`ActionMenuID`,`ActionPoiID`,`GossipNpcOptionID`,`BoxCoded`,`BoxMoney`,`BoxText`,`BoxBroadcastTextID`,`SpellID`,`OverrideIconID`,`VerifiedBuild`
FROM (
SELECT 40936 AS `MenuID`, 139959 AS `GossipOptionID`, 7 AS `OptionID`, 0 AS `OptionNpc`, 'Транспорт Высшего ордена в Даларан' AS `OptionText`, 0 AS `OptionBroadcastTextID`, 0 AS `Language`, 0 AS `Flags`, 0 AS `ActionMenuID`, 0 AS `ActionPoiID`, 0 AS `GossipNpcOptionID`, 0 AS `BoxCoded`, 0 AS `BoxMoney`, NULL AS `BoxText`, 0 AS `BoxBroadcastTextID`, 0 AS `SpellID`, 0 AS `OverrideIconID`, 70425 AS `VerifiedBuild`
) AS `v`
WHERE NOT EXISTS (SELECT 1 FROM `gossip_menu_option` AS `x` WHERE `x`.`MenuID` = `v`.`MenuID` AND `x`.`GossipOptionID` = `v`.`GossipOptionID`);
INSERT IGNORE INTO `gossip_menu_option_locale` (`MenuID`,`OptionID`,`Locale`,`OptionText`,`BoxText`) VALUES
(345,3,'ruRU','Позвольте посмотреть ваши товары.',NULL),
(1951,2,'ruRU','Регистратор гильдий',NULL),
(1951,3,'ruRU','Трактир',NULL),
(2121,4,'ruRU','Регистратор гильдий',NULL),
(2121,5,'ruRU','Трактир',NULL),
(2849,1,'ruRU','Дрессировщик летучих мышей',NULL),
(2849,2,'ruRU','Регистратор гильдий',NULL),
(4508,1,'ruRU','Я хочу забыть классовые или старинные таланты.',NULL),
(4509,1,'ruRU','Я хочу забыть классовые или старинные таланты.',NULL),
(4510,1,'ruRU','Я хочу забыть классовые или старинные таланты.',NULL),
(4511,1,'ruRU','Я хочу забыть классовые или старинные таланты.',NULL),
(4546,1,'ruRU','Я хочу забыть классовые или старинные таланты.',NULL),
(4547,1,'ruRU','Я хочу забыть классовые или старинные таланты.',NULL),
(4548,1,'ruRU','Я хочу забыть классовые или старинные таланты.',NULL),
(39786,0,'ruRU','Что такое профессии?',NULL),
(39786,1,'ruRU','Какие бывают виды профессий?',NULL),
(39786,2,'ruRU','А где можно найти местного учителя профессий?',NULL),
(40520,0,'ruRU','Что это за механизмы?',NULL),
(40580,0,'ruRU','<Промолчать.>',NULL),
(40581,0,'ruRU','Откуда ты знаешь? Если мы никогда не обращались к Владыке Ветра напрямую, попробовать стоит.',NULL),
(40582,0,'ruRU','Что за "Владыка Ветра" такой? Ал\'акир существует на самом деле или его придумал культ?',NULL),
(40583,0,'ruRU','А что ал\'акеты? Они нам помогут?',NULL),
(40584,0,'ruRU','Как нам быть?',NULL),
(40585,0,'ruRU','Мы знаем, в чем?..',NULL),
(40586,0,'ruRU','Расскажешь, что происходит на острове Зефрис?',NULL),
(40595,0,'ruRU','Приветствую, коллега-ал\'акет! Миссионер Джасаан велел мне служить нашему господину словом и делом! С чего мне начать?',NULL),
(40600,0,'ruRU','Напомнишь, что происходит на острове Зефрис?',NULL),
(40605,0,'ruRU','Констебль, расскажи мне, что случилось на Шен\'дарском нагорье.',NULL),
(40720,0,'ruRU','<Промолчать.>',NULL),
(40721,0,'ruRU','Откуда ты знаешь? Если мы никогда не обращались к Владыке Ветра напрямую, попробовать стоит.',NULL),
(40722,0,'ruRU','What of this "Windlord"? Is Al\'Akir real, or a creation of the cult?',NULL),
(40723,0,'ruRU','А что ал\'акеты? Они нам помогут?',NULL),
(40724,0,'ruRU','Как нам быть?',NULL),
(40725,0,'ruRU','Мы знаем, в чем?..',NULL),
(40877,0,'ruRU','<Поднять его и понести.>',NULL),
(40936,1,'ruRU','Трактир',NULL),
(40936,7,'ruRU','Транспорт Высшего ордена в Даларан',NULL),
(41095,0,'ruRU','<Спрятаться за шкафом и постараться подслушать разговор сектантов.>',NULL),
(41103,0,'ruRU','Что ты там говорил про лес?',NULL),
(41312,0,'ruRU','<Кивнуть Валеннии.>',NULL),
(41313,0,'ruRU','Старейшина Песня Теней направил меня к тебе.',NULL),
(41313,1,'ruRU','Your armor looks much different than the other peacekeepers I\'ve seen on Zephras Isle...',NULL),
(41424,0,'ruRU','Расскажешь мне подробнее о положении острова Зефрис и Ваятелях Ветра?',NULL),
(41425,0,'ruRU','Расскажешь мне подробнее о положении острова Зефрис и Высшем ордене?',NULL),
(41614,0,'ruRU','Что ты можешь мне рассказать о положении Высшего ордена?',NULL),
(41725,2,'ruRU','Расскажешь о рецептах, которым ты меня учишь?',NULL),
(41842,0,'ruRU','Халаан, ниспошли мне свой дар.',NULL),
(41923,0,'ruRU','<Уйти и поухаживать за другими друидами.>',NULL),
(42169,0,'ruRU','Что ты скажешь об этом кристалле, верховный старейшина?',NULL),
(42472,0,'ruRU','Забрать реликвию.',NULL),
(43459,0,'ruRU','Ты знаешь, почему он ушел? Почему духи нас покинули?',NULL),
(43460,0,'ruRU','Я вижу, ты им восхищаешься. Вы знали друг друга лично?',NULL),
(43461,0,'ruRU','Говорят, Шал\'нан исчез вместе с духами ветра. Расскажешь мне о нем?',NULL),
(43462,0,'ruRU','Спасибо, Валенния. Я хочу спросить кое-что еще.',NULL),
(44220,11,'ruRU','Зачаровывание',NULL);
