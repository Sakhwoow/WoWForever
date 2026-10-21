-- Classic 1.60 (WoW Forever): ОПЦИОНАЛЬНО, меняет поведение: quest_objectives.Flags2 = 1 (предмет задания привязан к цели)
-- Источник: снифы официального сервера Classic (бета «актуал»), сборки 70245, 70291, 70338, 70425, 70450; сгенерировано ForeverSniffTools.
-- С этим флагом предмет задания НЕ создаётся в сумке игрока: ядро только увеличивает счётчик цели (Player::StoreNewItem / ItemAddedQuestCheck). Так работает официальный сервер Classic 1.60 (85% целей-предметов в снифах имеют Flags2=1) и так уже записаны все НОВЫЕ задания Forever (03_quests.sql). Старые задания в БД имеют 0. Применять осознанно: после применения предметы старых заданий перестанут появляться в сумках.
-- Повторный запуск безопасен (проверено прогоном дважды на копии снимка БД).

UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90000084 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90000644 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90001764 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90003544 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90003545 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90003546 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90003584 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90003614 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90003624 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90003654 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90003674 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90003684 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90003694 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90003744 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90003754 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90003764 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90003765 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90003814 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90003824 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90003834 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90003984 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90003994 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90004044 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90004264 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90004265 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90009524 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90039024 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90054814 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90054824 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90062814 AND (NOT (`Flags2` <=> 1));
UPDATE `quest_objectives` SET `Flags2` = 1 WHERE `ID` = 90066614 AND (NOT (`Flags2` <=> 1));
