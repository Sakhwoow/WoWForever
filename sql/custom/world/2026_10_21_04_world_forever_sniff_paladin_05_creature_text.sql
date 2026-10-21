-- Forever (Classic 1.60): реплики существ по официальным снифам (безопасная версия).
-- Существа, у которых реплики уже есть в базе, не заменяются: на их группы ссылаются скрипты. Можно запускать повторно.

DELETE FROM `creature_text` WHERE `CreatureID` IN (126,515,519,1934,1935);
DELETE FROM `creature_text_locale` WHERE `Locale` = 'ruRU' AND `CreatureID` IN (126,515,519,1934,1935);
INSERT INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`SoundPlayType`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(126,0,0,'%s в панике пытается бежать!',16,0,100,0,0,0,0,0,0,' (sniff)'),
(515,0,0,'%s в панике пытается бежать!',16,0,100,0,0,0,0,0,0,' (sniff)'),
(519,0,0,'%s в панике пытается бежать!',16,0,100,0,0,0,0,0,0,'Сларк (sniff)'),
(1934,0,0,'%s в панике пытается бежать!',16,0,100,0,0,0,0,0,0,'Тирисфальский фермер (sniff)'),
(1935,0,0,'%s в панике пытается бежать!',16,0,100,0,0,0,0,0,0,'Тирисфальский батрак (sniff)');
INSERT IGNORE INTO `creature_text_locale` (`CreatureID`,`GroupID`,`ID`,`Locale`,`Text`) VALUES
(126,0,0,'ruRU','%s в панике пытается бежать!'),
(515,0,0,'ruRU','%s в панике пытается бежать!'),
(519,0,0,'ruRU','%s в панике пытается бежать!'),
(1934,0,0,'ruRU','%s в панике пытается бежать!'),
(1935,0,0,'ruRU','%s в панике пытается бежать!');

-- Могильник: официальный русский текст в существующие группы (на них ссылаются скрипты)
DELETE FROM `creature_text` WHERE `CreatureID` = 259377 AND `GroupID` = 0 AND `ID` IN (2, 3);
INSERT INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`SoundPlayType`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(259377,0,2,'Паладин... здесь? Откуда?',12,0,100,0,0,0,0,0,0,'Injured Deathguard - healed (sniff)'),
(259377,0,3,'Первый раз паладин мне помогает, а не хочет прикончить.',12,0,100,0,0,0,0,0,0,'Injured Deathguard - healed (sniff)');
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 259377 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`,`GroupID`,`ID`,`Locale`,`Text`) VALUES
(259377,0,0,'ruRU','Обойдусь без помощи Света. Убирайся, паладин.'),
(259377,0,1,'ruRU','Мне уже намного лучше, спасибо.'),
(259377,0,2,'ruRU','Паладин... здесь? Откуда?'),
(259377,0,3,'ruRU','Первый раз паладин мне помогает, а не хочет прикончить.');
DELETE FROM `creature_text` WHERE `CreatureID` = 271968 AND `GroupID` = 0 AND `ID` IN (4, 5, 6, 7);
INSERT INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`SoundPlayType`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(271968,0,4,'Я подвел Темную Госпожу. Но это в последний раз.',12,0,100,0,0,0,0,0,0,'Forsaken Adventurer (sniff)'),
(271968,0,5,'Мне еще не конец!',12,0,100,0,0,0,0,0,0,'Forsaken Adventurer (sniff)'),
(271968,0,6,'Палач Аррен пусть дальше сам!',12,0,100,0,0,0,0,0,0,'Forsaken Adventurer (sniff)'),
(271968,0,7,'Мне надо больше тренироваться.',12,0,100,0,0,0,0,0,0,'Forsaken Adventurer (sniff)');
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 271968 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`,`GroupID`,`ID`,`Locale`,`Text`) VALUES
(271968,0,0,'ruRU','Меня запутали по самую макушку!'),
(271968,0,1,'ruRU','Ну почему пауки...'),
(271968,0,2,'ruRU','Кто-нибудь видел мое оружие?'),
(271968,0,3,'ruRU','Спасибо. Я вернусь в Похоронный Звон.'),
(271968,0,4,'ruRU','Я подвел Темную Госпожу. Но это в последний раз.'),
(271968,0,5,'ruRU','Мне еще не конец!'),
(271968,0,6,'ruRU','Палач Аррен пусть дальше сам!'),
(271968,0,7,'ruRU','Мне надо больше тренироваться.');
INSERT INTO `creature_text_locale` (`CreatureID`,`GroupID`,`ID`,`Locale`,`Text`) VALUES
(275954,0,0,'ruRU','Эти еретики хотели судить меня... Видимо, за то, что я вообще существую.'),
(275954,1,0,'ruRU','Пожалуй, мне не стоит здесь оставаться. Давай уйдем.'),
(275954,2,0,'ruRU','Если хочешь, иди дальше по тропе, и выйдешь на крепость Бандариона. Там будут такие же воины, как я.'),
(275954,3,0,'ruRU','Брилл в той стороне. Идем.')
ON DUPLICATE KEY UPDATE `Text` = VALUES(`Text`);
