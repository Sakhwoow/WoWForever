-- Classic 1.60 (WoW Forever): creature_text.Emote / Sound по эмоциям и звукам, сопровождавшим реплики в снифах
-- Источник: снифы официального сервера Classic (бета «актуал»), сборки 70245, 70291, 70338, 70425; сгенерировано ForeverSniffTools.
-- UPDATE с защитным условием (поле сейчас 0).
-- Повторный запуск безопасен (проверено прогоном дважды на копии снимка БД).

UPDATE `creature_text` SET `Emote` = 1 WHERE `CreatureID` = 5497 AND `GroupID` = 1 AND `ID` = 0 AND (NOT (`Emote` <=> 1));
