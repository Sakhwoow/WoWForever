-- Forever (Classic 1.60): русские тексты, последняя мелкая партия (только классический мир). Можно запускать повторно.

-- 1. Задание 8182: имя вождя Молтора было ошибочно заменено подстановкой имени игрока, возвращаем
UPDATE `quest_template_locale` SET `QuestDescription` = REPLACE(`QuestDescription`, 'вождем, $N. будем', 'вождем, Молтором. будем')
WHERE `locale` = 'ruRU' AND `ID` = 8182;

-- 2. Оставшиеся вписанные имена игроков -> макрос имени

UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 32;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Томпсон(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 32;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 94;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Эфром(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 94;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 113;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Томпсон(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 113;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 153;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Хрофтгор(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 153;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 155;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Бронгард(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 155;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 157;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Бронгард(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 157;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 162;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Ишт(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 162;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 197;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Эфром(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 197;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 214;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Бронгард(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 214;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 257;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Wrestlecake(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 257;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 451;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Вота(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 451;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 472;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Бронгард(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 472;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 648;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Эфром(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 648;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 651;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Эфром(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 651;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 818;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Ахахаха(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 818;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 1248;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Эфром(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 1248;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 1446;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Хантор(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 1446;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 1472;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Вий(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 1472;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 2258;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Томпсон(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 2258;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 2881;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Медведик(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 2881;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 2965;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Шушпанк(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 2965;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 3463;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Томпсон(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 3463;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 3761;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Томпсон(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 3761;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 4105;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Димиллион(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 4105;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 4110;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Ксаер(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 4110;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 5402;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Эст(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 5402;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 5403;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Хлуси(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 5403;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 5404;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Вилдан(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 5404;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 5406;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Херин(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 5406;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 5407;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Херин(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 5407;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 5408;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Херин(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 5408;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 5509;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Вродехант(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 5509;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 5642;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Юбари(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 5642;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 5643;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Юбари(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 5643;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 5884;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Кирпичег(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 5884;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 6285;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Маркроу(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 6285;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 6622;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Стиммакс(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 6622;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 6624;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Маркуру(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 6624;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 6845;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Томпсон(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 6845;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 8060;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Эст(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 8060;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 8656;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Киберка(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 8656;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 8687;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Колг(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 8687;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 8741;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Киберушко(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 8741;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 8779;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Лорегон(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 8779;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 8782;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Фео(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 8782;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 8783;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Драккард(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 8783;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 8801;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REGEXP_REPLACE(`RewardText`, '(?<![\\p{L}\\p{N}$|''_-])Киберушко(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 8801;
UPDATE `quest_request_items_locale` SET `CompletionText` = REPLACE(`CompletionText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 23;
UPDATE `quest_request_items_locale` SET `CompletionText` = REGEXP_REPLACE(`CompletionText`, '(?<![\\p{L}\\p{N}$|''_-])Шпилэ(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 23;
UPDATE `quest_request_items_locale` SET `CompletionText` = REPLACE(`CompletionText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 113;
UPDATE `quest_request_items_locale` SET `CompletionText` = REGEXP_REPLACE(`CompletionText`, '(?<![\\p{L}\\p{N}$|''_-])Томпсон(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 113;
UPDATE `quest_request_items_locale` SET `CompletionText` = REPLACE(`CompletionText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 257;
UPDATE `quest_request_items_locale` SET `CompletionText` = REGEXP_REPLACE(`CompletionText`, '(?<![\\p{L}\\p{N}$|''_-])Яробород(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 257;
UPDATE `quest_request_items_locale` SET `CompletionText` = REPLACE(`CompletionText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 546;
UPDATE `quest_request_items_locale` SET `CompletionText` = REGEXP_REPLACE(`CompletionText`, '(?<![\\p{L}\\p{N}$|''_-])Томпсон(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 546;
UPDATE `quest_request_items_locale` SET `CompletionText` = REPLACE(`CompletionText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 885;
UPDATE `quest_request_items_locale` SET `CompletionText` = REGEXP_REPLACE(`CompletionText`, '(?<![\\p{L}\\p{N}$|''_-])Карандаш(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 885;
UPDATE `quest_request_items_locale` SET `CompletionText` = REPLACE(`CompletionText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 992;
UPDATE `quest_request_items_locale` SET `CompletionText` = REGEXP_REPLACE(`CompletionText`, '(?<![\\p{L}\\p{N}$|''_-])Эфром(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 992;
UPDATE `quest_request_items_locale` SET `CompletionText` = REPLACE(`CompletionText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 1146;
UPDATE `quest_request_items_locale` SET `CompletionText` = REGEXP_REPLACE(`CompletionText`, '(?<![\\p{L}\\p{N}$|''_-])Томпсон(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 1146;
UPDATE `quest_request_items_locale` SET `CompletionText` = REPLACE(`CompletionText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 3786;
UPDATE `quest_request_items_locale` SET `CompletionText` = REGEXP_REPLACE(`CompletionText`, '(?<![\\p{L}\\p{N}$|''_-])Тузвколоде(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 3786;
UPDATE `quest_request_items_locale` SET `CompletionText` = REPLACE(`CompletionText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 4101;
UPDATE `quest_request_items_locale` SET `CompletionText` = REGEXP_REPLACE(`CompletionText`, '(?<![\\p{L}\\p{N}$|''_-])Кавару(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 4101;
UPDATE `quest_request_items_locale` SET `CompletionText` = REPLACE(`CompletionText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 4102;
UPDATE `quest_request_items_locale` SET `CompletionText` = REGEXP_REPLACE(`CompletionText`, '(?<![\\p{L}\\p{N}$|''_-])Мулганус(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 4102;
UPDATE `quest_request_items_locale` SET `CompletionText` = REPLACE(`CompletionText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 4733;
UPDATE `quest_request_items_locale` SET `CompletionText` = REGEXP_REPLACE(`CompletionText`, '(?<![\\p{L}\\p{N}$|''_-])Wrestlecake(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 4733;
UPDATE `quest_request_items_locale` SET `CompletionText` = REPLACE(`CompletionText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 5535;
UPDATE `quest_request_items_locale` SET `CompletionText` = REGEXP_REPLACE(`CompletionText`, '(?<![\\p{L}\\p{N}$|''_-])Криворучка(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 5535;
UPDATE `quest_request_items_locale` SET `CompletionText` = REPLACE(`CompletionText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 5804;
UPDATE `quest_request_items_locale` SET `CompletionText` = REGEXP_REPLACE(`CompletionText`, '(?<![\\p{L}\\p{N}$|''_-])Надей(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 5804;
UPDATE `quest_request_items_locale` SET `CompletionText` = REPLACE(`CompletionText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 6602;
UPDATE `quest_request_items_locale` SET `CompletionText` = REGEXP_REPLACE(`CompletionText`, '(?<![\\p{L}\\p{N}$|''_-])Стиммакс(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 6602;
UPDATE `quest_request_items_locale` SET `CompletionText` = REPLACE(`CompletionText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 6610;
UPDATE `quest_request_items_locale` SET `CompletionText` = REGEXP_REPLACE(`CompletionText`, '(?<![\\p{L}\\p{N}$|''_-])Эфром(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 6610;
UPDATE `quest_request_items_locale` SET `CompletionText` = REPLACE(`CompletionText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 7642;
UPDATE `quest_request_items_locale` SET `CompletionText` = REGEXP_REPLACE(`CompletionText`, '(?<![\\p{L}\\p{N}$|''_-])Палдосий(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 7642;
UPDATE `quest_request_items_locale` SET `CompletionText` = REPLACE(`CompletionText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 8231;
UPDATE `quest_request_items_locale` SET `CompletionText` = REGEXP_REPLACE(`CompletionText`, '(?<![\\p{L}\\p{N}$|''_-])Юмикор(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 8231;
UPDATE `quest_request_items_locale` SET `CompletionText` = REPLACE(`CompletionText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 8498;
UPDATE `quest_request_items_locale` SET `CompletionText` = REGEXP_REPLACE(`CompletionText`, '(?<![\\p{L}\\p{N}$|''_-])Горрат(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 8498;
UPDATE `quest_request_items_locale` SET `CompletionText` = REPLACE(`CompletionText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 8801;
UPDATE `quest_request_items_locale` SET `CompletionText` = REGEXP_REPLACE(`CompletionText`, '(?<![\\p{L}\\p{N}$|''_-])Киберушко(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 8801;
UPDATE `quest_request_items_locale` SET `CompletionText` = REPLACE(`CompletionText`, 'Госпожа Киберушко', '$GГосподин:Госпожа; $N') WHERE `locale` = 'ruRU' AND `ID` = 8802;
UPDATE `quest_request_items_locale` SET `CompletionText` = REGEXP_REPLACE(`CompletionText`, '(?<![\\p{L}\\p{N}$|''_-])Киберушко(?![\\p{L}\\p{N}''_-])', '\\$N') WHERE `locale` = 'ruRU' AND `ID` = 8802;

-- 3. Готовый перевод того же английского текста из самой базы Forever

INSERT INTO `quest_offer_reward_locale` (`ID`, `locale`, `RewardText`, `VerifiedBuild`) VALUES
(6221, 'ruRU', 'Чую, что ты вернулся с победой. Победа... какое пустое слово, если подумать о том, что еще надо сделать. Как бы то ни было, ты доказал, что достоин нашего доверия.$B$BНе сразу фурболги Крепости Древобрюхов начнут относиться к тебе без враждебности в этой берлоге. Но твое упорство пробьет стену любой подозрительности, которую мои братья могут питать к тебе. Пока ты не предашь нас и не поднимешь на нас оружия, мы будем находить общий язык.', 0),
(8370, 'ruRU', 'Контроль над ресурсами Низины Арати - важнейшее дело! Ты молодец, $N.', 0),
(8372, 'ruRU', 'Молодец, $N! Ты славно послужил Альянсу!', 0),
(8390, 'ruRU', 'Контроль над ресурсами Низины Арати - важнейшее дело! Ты молодец, $N.', 0),
(8399, 'ruRU', 'Отличная работа, $N. Благодаря тебе, граничный лес Ясеневого леса простоял еще день.', 0),
(8401, 'ruRU', 'Отличная работа, $N. Благодаря тебе, граничный лес Ясеневого леса простоял еще день.', 0),
(8402, 'ruRU', 'Молодец, $N! Ты славно послужил Альянсу!', 0),
(8437, 'ruRU', 'Контроль над ресурсами Низины Арати - важнейшее дело! Ты молодец, $N.', 0),
(8438, 'ruRU', 'Контроль над ресурсами Низины Арати - важнейшее дело! Ты молодец, $N.', 0),
(8442, 'ruRU', 'Контроль над ресурсами Низины Арати - важнейшее дело! Ты молодец, $N.', 0)
ON DUPLICATE KEY UPDATE `RewardText` = IF(`RewardText` IS NULL OR `RewardText` = '', VALUES(`RewardText`), `RewardText`);

INSERT INTO `quest_request_items_locale` (`ID`, `locale`, `CompletionText`, `VerifiedBuild`) VALUES
(4963, 'ruRU', 'Да, $N? Ты сделала выбор? Инфернал или гончая скверны?$B$BЧасто чернокнижники предпочитают усиливать сильные стороны, а не развивать слабые. Порой лучше научиться чему-то одному, чем стать разносторонним заклинателем.', 0),
(6131, 'ruRU', 'Запомни, $N. Если хочешь заслужить наше доверие, прояви себя.', 0),
(6221, 'ruRU', 'Когда ты заслужишь доверие Древобрюхов, уверен, мы сможем что-нибудь для тебя сделать. Древобрюхи не забывают союзников, особенно в такие темные времена.', 0),
(6241, 'ruRU', 'Мы очень ценим то, что ты $Gсделал:сделала; для Древобрюхов, $N. Твои дальнейшие усилия непременно принесут тебе доверие и уважение моего племени.', 0),
(8372, 'ruRU', 'Несешь ли ты вести с фронта, $N?', 0),
(8399, 'ruRU', 'Несешь ли ты вести с фронта, $N?', 0),
(8401, 'ruRU', 'Несешь ли ты вести с фронта, $N?', 0),
(8402, 'ruRU', 'Несешь ли ты вести с фронта, $N?', 0)
ON DUPLICATE KEY UPDATE `CompletionText` = IF(`CompletionText` IS NULL OR `CompletionText` = '', VALUES(`CompletionText`), `CompletionText`);

INSERT INTO `quest_greeting_locale` (`ID`, `type`, `locale`, `Greeting`, `VerifiedBuild`) VALUES
(1092, 0, 'ruRU', 'Приветствую, $n.', 0),
(3143, 0, 'ruRU', 'Пройдя Долину Испытаний, любой слабак превращается в воина, достойного служить Орде... или навсегда остается лежать под палящим солнцем пустыни.', 0),
(5637, 0, 'ruRU', 'Приветствую, $n.', 0),
(9562, 0, 'ruRU', 'Приветствую, |3-6($r).', 0)
ON DUPLICATE KEY UPDATE `Greeting` = IF(`Greeting` IS NULL OR `Greeting` = '', VALUES(`Greeting`), `Greeting`);

-- 4. Ручной перевод: поля заданий и пункт диалога

INSERT INTO `quest_template_locale` (`ID`, `locale`, `LogTitle`, `VerifiedBuild`) VALUES
(6221, 'ruRU', 'Северное племя Мертвого Леса', 0),
(6241, 'ruRU', 'Происки племени Зимней Спячки', 0),
(95204, 'ruRU', 'Герб Лордерона', 0),
(97288, 'ruRU', 'Нескончаемая мука', 0)
ON DUPLICATE KEY UPDATE `LogTitle` = IF(`LogTitle` IS NULL OR `LogTitle` = '', VALUES(`LogTitle`), `LogTitle`);

INSERT INTO `quest_template_locale` (`ID`, `locale`, `LogDescription`, `VerifiedBuild`) VALUES
(6221, 'ruRU', 'Нафиен просит вас убить 5 дозорных, 5 мстителей и 5 шаманов из племени Мертвого Леса.', 0),
(6241, 'ruRU', 'Сальфа просит вас убить 6 тотемистов, 6 дозорных и 6 землепроходцев из племени Зимней Спячки.', 0),
(95204, 'ruRU', 'Отнесите герб Лордерона Орану Змеиные Кольца в Подгород.', 0),
(97288, 'ruRU', 'Доставьте голову поганища мастеру-аптекарю Фаранеллу в Подгород.', 0)
ON DUPLICATE KEY UPDATE `LogDescription` = IF(`LogDescription` IS NULL OR `LogDescription` = '', VALUES(`LogDescription`), `LogDescription`);

INSERT INTO `quest_template_locale` (`ID`, `locale`, `QuestDescription`, `VerifiedBuild`) VALUES
(6221, 'ruRU', 'Прямо к юго-западу от нас стоит лагерь фурболгов из племени Мертвого Леса. Порча пропитала весь лагерь, и я хочу покончить с ней, пока они не стали опасны.$B$BПлемя Мертвого Леса порочно, но виной тому скверна, отравившая их разум. Их враждебность не врожденная, и все же помочь им уже нельзя. Поэтому мне очень горько сражаться с собственными собратьями.$B$BПрошу, $N, сделай то, что должно быть сделано, и не рассказывай мне подробностей: они слишком меня расстраивают.', 0),
(6241, 'ruRU', 'Древобрюхи держатся особняком, $N. Мы пропускаем тех, кто доказал, что им можно доверять, но по возможности избегаем других племен фурболгов.$B$BВ последнее время я замечаю, что племя Зимней Спячки становится все враждебнее к нам. Они будто охвачены яростью, целиком поглощены страхом и ненавистью ко всему, чего не понимают.$B$BЕсли ты сократишь их число, это очень нам поможет, $N.', 0),
(95204, 'ruRU', '<Потрепанный герб с символом Лордерона. После падения королевства реликвий осталось так мало, что в Подгороде кто-нибудь наверняка захочет его заполучить.>', 0),
(97288, 'ruRU', '<Когда существо падает, его голова отваливается. Похоже, ее пришивали уже не раз, и с каждым разом она держится все слабее.\r\n\r\nВ Подгороде наверняка кто-нибудь знает больше об этом необычном поганище.>', 0)
ON DUPLICATE KEY UPDATE `QuestDescription` = IF(`QuestDescription` IS NULL OR `QuestDescription` = '', VALUES(`QuestDescription`), `QuestDescription`);

INSERT INTO `quest_template_locale` (`ID`, `locale`, `QuestCompletionLog`, `VerifiedBuild`) VALUES
(3366, 'ruRU', 'Поговорите с кем-нибудь об осколке Кошмара', 0),
(6981, 'ruRU', 'Поговорите с кем-нибудь в Кабестане о светящемся осколке', 0)
ON DUPLICATE KEY UPDATE `QuestCompletionLog` = IF(`QuestCompletionLog` IS NULL OR `QuestCompletionLog` = '', VALUES(`QuestCompletionLog`), `QuestCompletionLog`);

INSERT INTO `quest_template_locale` (`ID`, `locale`, `AreaDescription`, `VerifiedBuild`) VALUES
(94013, 'ruRU', 'Приручите вожака лисвенов', 0),
(94978, 'ruRU', 'Приручите ветроозерного краба', 0),
(94979, 'ruRU', 'Приручите задиристого буренога', 0),
(97288, 'ruRU', 'Доставьте голову поганища кому-нибудь в Подгороде.', 0)
ON DUPLICATE KEY UPDATE `AreaDescription` = IF(`AreaDescription` IS NULL OR `AreaDescription` = '', VALUES(`AreaDescription`), `AreaDescription`);

INSERT INTO `gossip_menu_option_locale` (`MenuID`, `OptionID`, `Locale`, `OptionText`, `BoxText`) VALUES
(41612, 0, 'ruRU', 'Что ты можешь рассказать о положении Ваятелей ветра?', NULL)
ON DUPLICATE KEY UPDATE `OptionText` = IF(`OptionText` IS NULL OR `OptionText` = '', VALUES(`OptionText`), `OptionText`);
