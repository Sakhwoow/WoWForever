-- Forever (Classic 1.60): русские тексты, радиотексты (hotfixes)
-- В текстах вместо макросов имени игрока ($n/$N), класса ($c) и расы ($r) были вписаны конкретные слова
-- (имя персонажа, с которого снимали текст; «Воин», «человек» и т. п. внутри |3-N(...)). Макросы возвращены.
-- Можно запускать повторно.

UPDATE `broadcast_text_locale` SET `Text_lang` = REGEXP_REPLACE(`Text_lang`, '(?<![\\p{L}\\p{N}$|''_-])Псс(?![\\p{L}\\p{N}''_-])', '\\$n')
WHERE locale = 'ruRU' AND `Text_lang` NOT REGEXP '[$][nN]' AND `ID` IN (274864);
UPDATE `broadcast_text_locale` SET `Text1_lang` = REGEXP_REPLACE(`Text1_lang`, '(?<![\\p{L}\\p{N}$|''_-])Орака''зул(?![\\p{L}\\p{N}''_-])', '\\$n')
WHERE locale = 'ruRU' AND `Text1_lang` NOT REGEXP '[$][nN]' AND `ID` IN (297599);
