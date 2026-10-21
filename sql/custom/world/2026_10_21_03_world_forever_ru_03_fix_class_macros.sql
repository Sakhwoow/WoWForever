-- Forever (Classic 1.60): русские тексты, макрос класса. Перенос готового перевода занёс в четыре текста слово класса вместо $c/$C
-- внутри |3-N(...). Возвращаем макрос; повторный запуск ничего не меняет.

UPDATE `quest_offer_reward_locale`
SET `RewardText` = REGEXP_REPLACE(`RewardText`, '[|]3-([0-9]+)[(](Воин|Охотник|Друид|Маг|Паладин|Чернокнижник|Разбойник|Жрец|Шаман)[)]', '|3-$1(\\$c)')
WHERE `locale` = 'ruRU' AND `ID` = 8397;

UPDATE `quest_request_items_locale`
SET `CompletionText` = REGEXP_REPLACE(`CompletionText`, '[|]3-([0-9]+)[(](Воин|Охотник|Друид|Маг|Паладин|Чернокнижник|Разбойник|Жрец|Шаман)[)]', '|3-$1(\\$c)')
WHERE `locale` = 'ruRU' AND `ID` = 8370;

UPDATE `quest_request_items_locale`
SET `CompletionText` = REGEXP_REPLACE(`CompletionText`, '[|]3-([0-9]+)[(](Воин|Охотник|Друид|Маг|Паладин|Чернокнижник|Разбойник|Жрец|Шаман)[)]', '|3-$1(\\$C)')
WHERE `locale` = 'ruRU' AND `ID` IN (8437, 8438);
