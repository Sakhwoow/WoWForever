-- Classic 1.60 (WoW Forever): тренеры
-- Источник: снифы официального сервера Classic (бета «актуал»), сборки 70245, 70291, 70338, 70425, 70450; сгенерировано ForeverSniffTools.
-- Правила: данные новых сущностей Forever (entry >= 250000) заменяются, для старых только добавляется недостающее.
-- Повторный запуск безопасен. 

INSERT IGNORE INTO `trainer_spell` (`TrainerId`,`SpellId`,`MoneyCost`,`ReqSkillLine`,`ReqSkillRank`,`ReqAbility1`,`ReqAbility2`,`ReqAbility3`,`ReqLevel`,`VerifiedBuild`) VALUES
(29,1912,6000,0,0,0,0,0,26,70450);
