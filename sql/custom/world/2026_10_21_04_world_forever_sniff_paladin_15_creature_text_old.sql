-- Classic 1.60 (WoW Forever): реплики старых существ: недостающие строки creature_text + русские тексты
-- Источник: снифы официального сервера Classic (бета «актуал»), сборки 70245, 70291, 70338, 70425, 70450; сгенерировано ForeverSniffTools.
-- Только INSERT IGNORE (ключ CreatureID, GroupID, ID): существующие реплики не трогаются. Реплики с BroadcastText: английский текст из hotfix-БД, русский в creature_text_locale. Без совпадения: русский текст как есть (comment: ruRU only).
-- Повторный запуск безопасен (проверено прогоном дважды на копии снимка БД).

INSERT IGNORE INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`SoundPlayType`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(95,1,0,'%s attempts to run away in fear!',16,0,100,0,0,0,0,1150,0,': sniff ruRU matched BroadcastText 1150');
INSERT IGNORE INTO `creature_text_locale` (`CreatureID`,`GroupID`,`ID`,`Locale`,`Text`) VALUES
(95,1,0,'ruRU','%s в панике пытается бежать!');
INSERT IGNORE INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`SoundPlayType`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(126,0,0,'%s attempts to run away in fear!',16,0,100,0,0,0,0,1150,0,': sniff ruRU matched BroadcastText 1150');
INSERT IGNORE INTO `creature_text_locale` (`CreatureID`,`GroupID`,`ID`,`Locale`,`Text`) VALUES
(126,0,0,'ruRU','%s в панике пытается бежать!');
INSERT IGNORE INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`SoundPlayType`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(515,0,0,'%s attempts to run away in fear!',16,0,100,0,0,0,0,1150,0,': sniff ruRU matched BroadcastText 1150');
INSERT IGNORE INTO `creature_text_locale` (`CreatureID`,`GroupID`,`ID`,`Locale`,`Text`) VALUES
(515,0,0,'ruRU','%s в панике пытается бежать!');
INSERT IGNORE INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`SoundPlayType`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(519,0,0,'%s attempts to run away in fear!',16,0,100,0,0,0,0,1150,0,'Сларк: sniff ruRU matched BroadcastText 1150');
INSERT IGNORE INTO `creature_text_locale` (`CreatureID`,`GroupID`,`ID`,`Locale`,`Text`) VALUES
(519,0,0,'ruRU','%s в панике пытается бежать!');
INSERT IGNORE INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`SoundPlayType`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(1535,2,0,'%s attempts to run away in fear!',16,0,100,0,0,0,0,1150,0,'Воин из Алого ордена: sniff ruRU matched BroadcastText 1150');
INSERT IGNORE INTO `creature_text_locale` (`CreatureID`,`GroupID`,`ID`,`Locale`,`Text`) VALUES
(1535,2,0,'ruRU','%s в панике пытается бежать!');
INSERT IGNORE INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`SoundPlayType`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(1934,0,0,'%s attempts to run away in fear!',16,0,100,0,0,0,0,1150,0,'Тирисфальский фермер: sniff ruRU matched BroadcastText 1150');
INSERT IGNORE INTO `creature_text_locale` (`CreatureID`,`GroupID`,`ID`,`Locale`,`Text`) VALUES
(1934,0,0,'ruRU','%s в панике пытается бежать!');
INSERT IGNORE INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`SoundPlayType`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(1935,0,0,'%s attempts to run away in fear!',16,0,100,0,0,0,0,1150,0,'Тирисфальский батрак: sniff ruRU matched BroadcastText 1150');
INSERT IGNORE INTO `creature_text_locale` (`CreatureID`,`GroupID`,`ID`,`Locale`,`Text`) VALUES
(1935,0,0,'ruRU','%s в панике пытается бежать!');
