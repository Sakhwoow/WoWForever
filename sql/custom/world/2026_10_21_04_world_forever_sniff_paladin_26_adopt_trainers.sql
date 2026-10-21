-- Classic 1.60 (WoW Forever): тренеры: trainer_spell (цена, уровень, навык), trainer (тип, приветствие) и ruRU-приветствие по снифу
-- Источник: снифы официального сервера Classic (бета «актуал»), сборки 70245, 70291, 70338, 70425, 70450; сгенерировано ForeverSniffTools.
-- UPDATE с защитным условием; INSERT IGNORE для trainer_locale.
-- Повторный запуск безопасен (проверено прогоном дважды на копии снимка БД).

UPDATE `trainer_spell` SET `ReqLevel` = 8 WHERE `TrainerId` = 29 AND `SpellId` = 1152 AND (NOT (`ReqLevel` <=> 8));
UPDATE `trainer_spell` SET `ReqLevel` = 6 WHERE `TrainerId` = 29 AND `SpellId` = 639 AND (NOT (`ReqLevel` <=> 6));
UPDATE `trainer_spell` SET `ReqLevel` = 6 WHERE `TrainerId` = 29 AND `SpellId` = 21082 AND (NOT (`ReqLevel` <=> 6));
UPDATE `trainer_spell` SET `ReqLevel` = 6 WHERE `TrainerId` = 29 AND `SpellId` = 498 AND (NOT (`ReqLevel` <=> 6));
UPDATE `trainer_spell` SET `ReqLevel` = 8 WHERE `TrainerId` = 29 AND `SpellId` = 853 AND (NOT (`ReqLevel` <=> 8));
UPDATE `trainer_spell` SET `ReqLevel` = 6 WHERE `TrainerId` = 29 AND `SpellId` = 679 AND (NOT (`ReqLevel` <=> 6));
UPDATE `trainer_spell` SET `ReqLevel` = 26 WHERE `TrainerId` = 29 AND `SpellId` = 20163 AND (NOT (`ReqLevel` <=> 26));
