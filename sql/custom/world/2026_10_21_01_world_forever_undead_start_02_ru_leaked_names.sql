-- Forever (Classic 1.60): стартовая зона нежити (Могильник), правка имён игроков, вписанных в русские тексты заданий
-- Можно запускать повторно.


-- В русских текстах вместо макроса имени игрока ($n) стояло имя персонажа, с которого снимали текст.
-- Игрок видел «Спасибо, Сиамнео». Возвращаем макрос; повторный запуск ничего не меняет.

UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Сиамнео', '$n') WHERE `locale` = 'ruRU' AND `ID` = 376;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Седативщик', '$n') WHERE `locale` = 'ruRU' AND `ID` = 380;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Сиамнео', '$n') WHERE `locale` = 'ruRU' AND `ID` = 381;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Гульгор', '$n') WHERE `locale` = 'ruRU' AND `ID` = 383;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Кзар', '$n') WHERE `locale` = 'ruRU' AND `ID` = 1470;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Litvin', '$N') WHERE `locale` = 'ruRU' AND `ID` = 3098;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Сиамнео', '$N') WHERE `locale` = 'ruRU' AND `ID` = 3901;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Сиамнео', '$N') WHERE `locale` = 'ruRU' AND `ID` = 3902;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Пейн', '$N') WHERE `locale` = 'ruRU' AND `ID` = 5847;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Сиамнео', '$N') WHERE `locale` = 'ruRU' AND `ID` = 6395;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, 'Талаш', '$n') WHERE `locale` = 'ruRU' AND `ID` = 91208;
UPDATE `quest_request_items_locale` SET `CompletionText` = REPLACE(`CompletionText`, 'Малагрис', '$n') WHERE `locale` = 'ruRU' AND `ID` = 364;
UPDATE `quest_request_items_locale` SET `CompletionText` = REPLACE(`CompletionText`, 'Сиамнео', '$n') WHERE `locale` = 'ruRU' AND `ID` = 382;
UPDATE `quest_request_items_locale` SET `CompletionText` = REPLACE(`CompletionText`, 'Litvin', '$N') WHERE `locale` = 'ruRU' AND `ID` = 3098;

-- То же с классом: |3-6(Разбойник) -> |3-6($c)
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, '|3-6(Разбойник)', '|3-6($c)') WHERE `locale` = 'ruRU' AND `ID` = 3901;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, '|3-6(Паладин)', '|3-6($c)') WHERE `locale` = 'ruRU' AND `ID` = 91209;
UPDATE `quest_offer_reward_locale` SET `RewardText` = REPLACE(`RewardText`, '|3-6(Паладин)', '|3-6($c)') WHERE `locale` = 'ruRU' AND `ID` = 98601;
UPDATE `quest_request_items_locale` SET `CompletionText` = REGEXP_REPLACE(`CompletionText`, '[|]3-6[(][А-Яа-я]+[)]', '|3-6(\\$c)') WHERE `locale` = 'ruRU' AND `ID` = 3097;
