-- Classic 1.60 (WoW Forever): тренеры: trainer_spell (цена, уровень, навык), trainer (тип, приветствие) и ruRU-приветствие по снифу
-- Источник: снифы официального сервера Classic (бета «актуал»), сборки 70245, 70291, 70338, 70425; сгенерировано ForeverSniffTools.
-- UPDATE с защитным условием; INSERT IGNORE для trainer_locale.
-- Повторный запуск безопасен (проверено прогоном дважды на копии снимка БД).

UPDATE `trainer_spell` SET `ReqLevel` = 4 WHERE `TrainerId` = 28 AND `SpellId` = 10321 AND (NOT (`ReqLevel` <=> 4));
UPDATE `trainer_spell` SET `ReqLevel` = 1 WHERE `TrainerId` = 28 AND `SpellId` = 465 AND (NOT (`ReqLevel` <=> 1));
UPDATE `trainer_spell` SET `ReqLevel` = 4 WHERE `TrainerId` = 28 AND `SpellId` = 19740 AND (NOT (`ReqLevel` <=> 4));
UPDATE `trainer_spell` SET `ReqLevel` = 0 WHERE `TrainerId` = 23 AND `SpellId` = 6673 AND (NOT (`ReqLevel` <=> 0));
UPDATE `trainer_spell` SET `ReqLevel` = 0 WHERE `TrainerId` = 23 AND `SpellId` = 694 AND (NOT (`ReqLevel` <=> 0));
UPDATE `trainer_spell` SET `ReqLevel` = 0 WHERE `TrainerId` = 23 AND `SpellId` = 5242 AND (NOT (`ReqLevel` <=> 0));
UPDATE `trainer_spell` SET `ReqLevel` = 0 WHERE `TrainerId` = 23 AND `SpellId` = 676 AND (NOT (`ReqLevel` <=> 0));
UPDATE `trainer_spell` SET `ReqLevel` = 0 WHERE `TrainerId` = 23 AND `SpellId` = 72 AND (NOT (`ReqLevel` <=> 0));
UPDATE `trainer_spell` SET `ReqLevel` = 0 WHERE `TrainerId` = 23 AND `SpellId` = 8198 AND (NOT (`ReqLevel` <=> 0));
UPDATE `trainer_spell` SET `ReqLevel` = 0 WHERE `TrainerId` = 23 AND `SpellId` = 284 AND (NOT (`ReqLevel` <=> 0));
UPDATE `trainer_spell` SET `ReqLevel` = 0 WHERE `TrainerId` = 23 AND `SpellId` = 285 AND (NOT (`ReqLevel` <=> 0));
UPDATE `trainer_spell` SET `ReqLevel` = 0 WHERE `TrainerId` = 23 AND `SpellId` = 772 AND (NOT (`ReqLevel` <=> 0));
UPDATE `trainer_spell` SET `ReqLevel` = 0 WHERE `TrainerId` = 23 AND `SpellId` = 7384 AND (NOT (`ReqLevel` <=> 0));
UPDATE `trainer_spell` SET `ReqLevel` = 0 WHERE `TrainerId` = 23 AND `SpellId` = 2687 AND (NOT (`ReqLevel` <=> 0));
UPDATE `trainer_spell` SET `ReqLevel` = 0 WHERE `TrainerId` = 23 AND `SpellId` = 6572 AND (NOT (`ReqLevel` <=> 0));
UPDATE `trainer_spell` SET `ReqLevel` = 0 WHERE `TrainerId` = 23 AND `SpellId` = 2565 AND (NOT (`ReqLevel` <=> 0));
UPDATE `trainer_spell` SET `ReqLevel` = 0 WHERE `TrainerId` = 23 AND `SpellId` = 1715 AND (NOT (`ReqLevel` <=> 0));
UPDATE `trainer_spell` SET `ReqLevel` = 0 WHERE `TrainerId` = 23 AND `SpellId` = 100 AND (NOT (`ReqLevel` <=> 0));
UPDATE `trainer_spell` SET `ReqLevel` = 0 WHERE `TrainerId` = 23 AND `SpellId` = 1160 AND (NOT (`ReqLevel` <=> 0));
UPDATE `trainer_spell` SET `ReqLevel` = 0 WHERE `TrainerId` = 23 AND `SpellId` = 6546 AND (NOT (`ReqLevel` <=> 0));
UPDATE `trainer_spell` SET `ReqLevel` = 0 WHERE `TrainerId` = 23 AND `SpellId` = 6343 AND (NOT (`ReqLevel` <=> 0));
UPDATE `trainer_spell` SET `ReqLevel` = 0 WHERE `TrainerId` = 23 AND `SpellId` = 1310185 AND (NOT (`ReqLevel` <=> 0));
UPDATE `trainer_spell` SET `ReqLevel` = 14 WHERE `TrainerId` = 17 AND `SpellId` = 5178 AND (NOT (`ReqLevel` <=> 14));
UPDATE `trainer_spell` SET `ReqLevel` = 14 WHERE `TrainerId` = 17 AND `SpellId` = 5187 AND (NOT (`ReqLevel` <=> 14));
UPDATE `trainer_spell` SET `ReqLevel` = 14 WHERE `TrainerId` = 17 AND `SpellId` = 5211 AND (NOT (`ReqLevel` <=> 14));
UPDATE `trainer_spell` SET `MoneyCost` = 2400, `ReqLevel` = 20 WHERE `TrainerId` = 17 AND `SpellId` = 5221 AND (NOT (`MoneyCost` <=> 2400) OR NOT (`ReqLevel` <=> 20));
UPDATE `trainer_spell` SET `ReqLevel` = 14 WHERE `TrainerId` = 17 AND `SpellId` = 782 AND (NOT (`ReqLevel` <=> 14));
UPDATE `trainer_spell` SET `ReqLevel` = 1 WHERE `TrainerId` = 1233 AND `SpellId` = 1126 AND (NOT (`ReqLevel` <=> 1));
UPDATE `trainer_spell` SET `ReqLevel` = 0 WHERE `TrainerId` = 20 AND `SpellId` = 13163 AND (NOT (`ReqLevel` <=> 0));
UPDATE `trainer_spell` SET `ReqLevel` = 0 WHERE `TrainerId` = 20 AND `SpellId` = 1978 AND (NOT (`ReqLevel` <=> 0));
INSERT IGNORE INTO `trainer_locale` (`Id`,`locale`,`Greeting_lang`,`VerifiedBuild`) VALUES
(28,'ruRU','Привет тебе, паладин! Ты $gпришел:пришла; за знаниями?',70338),
(361,'ruRU','В инженерном деле главное – понять основы. Остальное само придет.',70338),
(100,'ruRU','Я могу научить тебя ловить рыбу.',70338),
(23,'ruRU','Привет тебе, воин! Ты хочешь учиться?',70338),
(37,'ruRU','Кто никогда не рылся в земле, тот, считай, и не жил!',70338),
(36,'ruRU','Хочешь, научу, как устроить из добычи настоящее пиршество?',70338),
(293,'ruRU','Хочешь, я научу тебя, как из найденной руды делать оружие и доспехи?',70338),
(35,'ruRU','Чтобы разбираться в травах, нужны и знания, и чутье.',70338),
(113,'ruRU','Чтобы снять шкуру с убитого животного, нужна твердая рука.',70338),
(353,'ruRU','Освоив алхимию, ты сможешь варить зелья из найденных растений.',70338),
(357,'ruRU','Наложение чар – это искусство улучшения материальных объектов с помощью магии.',70338),
(17,'ruRU','Приветствую тебя, друид! Тебе нужны новые знания?',70425),
(1233,'ruRU','Здравствуй, дитя. Ты желаешь постичь тайны друидов?',70338),
(1234,'ruRU','Hello, young hunter. Are you ready for some training?',70245),
(388,'ruRU','Здравствуй! Хочешь, я научу тебя шить доспехи из ткани?',70338),
(365,'ruRU','Здравствуй! Хочешь научиться делать доспехи из шкур животных?',70245),
(20,'ruRU','Привет, $gохотник:охотница;! Ну что, будешь учиться?',70245),
(1259,'ruRU','Hello! Can I teach you something?',70338);
