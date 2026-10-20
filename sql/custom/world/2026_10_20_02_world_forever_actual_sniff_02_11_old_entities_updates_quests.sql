-- Classic 1.60 (WoW Forever): старые задания: quest_template, уровни и русские тексты
-- ТОЛЬКО UPDATE различий у уже существующих (старых) сущностей по данным официального сервера (сборки снифов 70245-70425, для каждой сущности берётся самая свежая).
-- Каждый UPDATE меняет строку только если значение действительно отличается; повторный запуск безопасен.
-- Сгенерировано ForeverSniffTools (tools/gen_updates.py)

UPDATE `quest_template` SET `RewardChoiceItemID3` = 276695, `RewardChoiceItemQuantity3` = 1 WHERE `ID` = 9 AND (NOT (`RewardChoiceItemID3` <=> 276695) OR NOT (`RewardChoiceItemQuantity3` <=> 1));
UPDATE `quest_template` SET `RewardChoiceItemID3` = 270020, `RewardChoiceItemQuantity3` = 1, `RewardChoiceItemID4` = 276722, `RewardChoiceItemQuantity4` = 1 WHERE `ID` = 442 AND (NOT (`RewardChoiceItemID3` <=> 270020) OR NOT (`RewardChoiceItemQuantity3` <=> 1) OR NOT (`RewardChoiceItemID4` <=> 276722) OR NOT (`RewardChoiceItemQuantity4` <=> 1));
UPDATE `quest_template` SET `RewardChoiceItemID3` = 276723, `RewardChoiceItemQuantity3` = 1 WHERE `ID` = 451 AND (NOT (`RewardChoiceItemID3` <=> 276723) OR NOT (`RewardChoiceItemQuantity3` <=> 1));
UPDATE `quest_template` SET `RewardItem1` = 276720, `RewardAmount1` = 1 WHERE `ID` = 549 AND (NOT (`RewardItem1` <=> 276720) OR NOT (`RewardAmount1` <=> 1));
UPDATE `quest_template` SET `RewardItem1` = 918, `RewardAmount1` = 1, `RewardItem2` = 6480, `RewardAmount2` = 1, `RewardChoiceItemID1` = 0, `RewardChoiceItemQuantity1` = 0, `RewardChoiceItemID2` = 0, `RewardChoiceItemQuantity2` = 0 WHERE `ID` = 1486 AND (NOT (`RewardItem1` <=> 918) OR NOT (`RewardAmount1` <=> 1) OR NOT (`RewardItem2` <=> 6480) OR NOT (`RewardAmount2` <=> 1) OR NOT (`RewardChoiceItemID1` <=> 0) OR NOT (`RewardChoiceItemQuantity1` <=> 0) OR NOT (`RewardChoiceItemID2` <=> 0) OR NOT (`RewardChoiceItemQuantity2` <=> 0));
