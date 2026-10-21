-- Classic 1.60 (WoW Forever): старые существа: creature_template_model по снифу
-- Источник: снифы официального сервера Classic (бета «актуал»), сборки 70245, 70291, 70338, 70425, 70450; сгенерировано ForeverSniffTools.
-- UPDATE различающихся строк, INSERT IGNORE недостающих, DELETE лишних по Idx; вес единственной модели остаётся 1 (ядру нужен ненулевой вес).
-- Повторный запуск безопасен (проверено прогоном дважды на копии снимка БД).

UPDATE `creature_template_model` SET `DisplayScale` = 1.0 WHERE `CreatureID` = 1508 AND `Idx` = 0 AND (ABS(`DisplayScale` - 1.0) > 0.001);
UPDATE `creature_template_model` SET `DisplayScale` = 1.0 WHERE `CreatureID` = 1509 AND `Idx` = 0 AND (ABS(`DisplayScale` - 1.0) > 0.001);
UPDATE `creature_template_model` SET `DisplayScale` = 1.0 WHERE `CreatureID` = 1512 AND `Idx` = 0 AND (ABS(`DisplayScale` - 1.0) > 0.001);
UPDATE `creature_template_model` SET `DisplayScale` = 1.0 WHERE `CreatureID` = 1513 AND `Idx` = 0 AND (ABS(`DisplayScale` - 1.0) > 0.001);
