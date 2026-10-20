-- Classic 1.60 (WoW Forever): старые существа: creature_template_model по снифу
-- Источник: снифы официального сервера Classic (бета «актуал»), сборки 70245, 70291, 70338, 70425; сгенерировано ForeverSniffTools.
-- UPDATE различающихся строк, INSERT IGNORE недостающих, DELETE лишних по Idx; вес единственной модели остаётся 1 (ядру нужен ненулевой вес).
-- Повторный запуск безопасен (проверено прогоном дважды на копии снимка БД).

UPDATE `creature_template_model` SET `Probability` = 0.0 WHERE `CreatureID` = 11802 AND `Idx` = 0 AND (ABS(`Probability` - 0.0) > 0.001);
INSERT IGNORE INTO `creature_template_model` (`CreatureID`,`Idx`,`CreatureDisplayID`,`DisplayScale`,`Probability`,`VerifiedBuild`) VALUES
(11802,1,11769,1.0,0.0,70425);
