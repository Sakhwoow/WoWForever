-- Classic 1.60 (WoW Forever): реплики старых существ: недостающие строки creature_text + русские тексты
-- Источник: снифы официального сервера Classic (бета «актуал»), сборки 70245, 70291, 70338, 70425; сгенерировано ForeverSniffTools.
-- Только INSERT IGNORE (ключ CreatureID, GroupID, ID): существующие реплики не трогаются. Реплики с BroadcastText: английский текст из hotfix-БД, русский в creature_text_locale. Без совпадения: русский текст как есть (comment: ruRU only).
-- Повторный запуск безопасен (проверено прогоном дважды на копии снимка БД).

INSERT IGNORE INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`SoundPlayType`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(1413,2,0,'Why can\'t we just shift the array to compensate for the variance in the flux?',12,7,100,0,0,0,0,208,0,'Джейни Аншип: sniff ruRU matched BroadcastText 208');
INSERT IGNORE INTO `creature_text_locale` (`CreatureID`,`GroupID`,`ID`,`Locale`,`Text`) VALUES
(1413,2,0,'ruRU','Почему же нельзя сдвинуть решетку и уравнять изменение потока?');
INSERT IGNORE INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`SoundPlayType`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(1498,8,0,'%s напевно читает заклятие…',16,0,100,0,0,0,0,0,0,'Бетор Ледострел: ruRU only (no BroadcastText match)');
INSERT IGNORE INTO `creature_text_locale` (`CreatureID`,`GroupID`,`ID`,`Locale`,`Text`) VALUES
(1498,8,0,'ruRU','%s напевно читает заклятие…');
