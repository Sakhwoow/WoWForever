-- Classic 1.60 (WoW Forever): постоянные ауры существ (creature_template_addon.auras)
-- Источник: снифы официального сервера Classic (бета «актуал»), сборки 70245, 70291, 70338, 70425, 70450; сгенерировано ForeverSniffTools.
-- Правила: данные новых сущностей Forever (entry >= 250000) заменяются, для старых только добавляется недостающее.
-- Повторный запуск безопасен. 

INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (416,'18728 18737 18740 412729 416189 427743') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '18728 18737 18740 412729 416189 427743', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (519,'3417') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '3417', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (1424,'7165 21156') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '7165 21156', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (1860,'18727 18735 18742 412729 416189 427743') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '18727 18735 18742 412729 416189 427743', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (1863,'18729 18736 18741 412729 416189 427743') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '18729 18736 18741 412729 416189 427743', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (3579,'5728 1303067') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '5728 1303067', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (5873,'8072 1303067') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '8072 1303067', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (5921,'8162 1303067') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '8162 1303067', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (7467,'10596 1303052') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '10596 1303052', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (8393,'12881') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '12881', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (14438,'18950 1310595') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '18950 1310595', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (16096,'18950 1310595 1326064') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '18950 1310595 1326064', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (185317,'18729 18736 18741 412729 416189 427743') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '18729 18736 18741 412729 416189 427743', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (253474,'1310595 1326064') ON DUPLICATE KEY UPDATE `auras` = '1310595 1326064';
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (275954,'1310193') ON DUPLICATE KEY UPDATE `auras` = '1310193';
