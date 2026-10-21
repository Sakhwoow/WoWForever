-- Forever (Classic 1.60): русские реплики (hotfixes), последняя мелкая партия. Можно запускать повторно.

DELETE FROM `broadcast_text_locale` WHERE `locale` = 'ruRU' AND `ID` IN (304794,304796);
INSERT INTO `broadcast_text_locale` (`ID`, `locale`, `Text_lang`, `Text1_lang`, `VerifiedBuild`) VALUES
(304794, 'ruRU', 'Нет, нет! Лортуна, ты не понимаешь. Этот ваятель ветра просто проходил мимо и пришел сюда не со мной!', '', 0),
(304796, 'ruRU', 'Лортуна, будь благоразумна. Элаадрин послал меня обсудить путь к миру и…', '', 0);
