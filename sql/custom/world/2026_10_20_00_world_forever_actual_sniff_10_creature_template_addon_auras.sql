-- Classic 1.60 (WoW Forever): постоянные ауры существ (creature_template_addon.auras)
-- Источник: снифы официального сервера Classic (бета «актуал»), сборки 70245, 70291, 70338, 70425; сгенерировано ForeverSniffTools.
-- Правила: данные новых сущностей Forever (entry >= 250000) заменяются, для старых только добавляется недостающее.
-- Повторный запуск безопасен. 

INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (416,'6307 18728 18737 18740 412729 416189 427743') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '6307 18728 18737 18740 412729 416189 427743', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (1860,'18727 18735 18742 412729 416189 427743') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '18727 18735 18742 412729 416189 427743', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (1863,'18729 18736 18741 412729 416189 427743') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '18729 18736 18741 412729 416189 427743', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (3416,'429593') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '429593', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (3573,'5677 1303066') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '5677 1303066', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (3579,'5728 1303067') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '5728 1303067', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (3636,'3417') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '3417', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (3640,'7940 7944') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '7940 7944', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (3680,'6243') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '6243', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (3840,'13236') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '13236', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (5873,'8072 1303067') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '8072 1303067', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (5920,'8157 1303067') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '8157 1303067', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (5921,'8162 1303067') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '8162 1303067', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (5925,'8178 8179 1303052') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '8178 8179 1303052', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (5950,'8230 1303069') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '8230 1303069', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (6491,'9036 10848 418548') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '9036 10848 418548', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (7467,'10596 1303052') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '10596 1303052', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (8393,'12881') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '12881', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (8856,'11048') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '11048', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (10942,'3417') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '3417', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (12778,'5301') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '5301', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (12786,'5301') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '5301', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (12787,'5301') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '5301', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (13016,'21051') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '21051', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (14121,'22431') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '22431', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (14363,'18950 1310595') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '18950 1310595', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (14365,'18950 1310595') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '18950 1310595', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (14367,'18950 1310595') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '18950 1310595', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (14423,'18950 1310595') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '18950 1310595', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (14438,'18950 1310595') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '18950 1310595', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (185317,'18729 18736 18741 412729 416189 427743') ON DUPLICATE KEY UPDATE `auras` = IF(`auras` IS NULL OR `auras` = '', '18729 18736 18741 412729 416189 427743', `auras`);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (252477,'1310595 1326064') ON DUPLICATE KEY UPDATE `auras` = '1310595 1326064';
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (253474,'1310595') ON DUPLICATE KEY UPDATE `auras` = '1310595';
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (253782,'1288546') ON DUPLICATE KEY UPDATE `auras` = '1288546';
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (263397,'1264628 1289655') ON DUPLICATE KEY UPDATE `auras` = '1264628 1289655';
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (264850,'415431 1293586') ON DUPLICATE KEY UPDATE `auras` = '415431 1293586';
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (265675,'1326368') ON DUPLICATE KEY UPDATE `auras` = '1326368';
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (267599,'1299003 1299005') ON DUPLICATE KEY UPDATE `auras` = '1299003 1299005';
