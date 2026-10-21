-- Forever (Classic 1.60): русские радиотексты, макросы пола (см. 08_ru_fix_gender_macros.sql).
-- «Не думал$g::а;» заменяется на «Не $gдумал:думала;» (целое слово в макросе, как в официальном русском клиенте).
-- Можно запускать повторно.

UPDATE `broadcast_text_locale`
SET `Text_lang` = REPLACE(`Text_lang`, 'Не думал$g::а;', 'Не $gдумал:думала;'),
    `Text1_lang` = REPLACE(`Text1_lang`, 'Не думал$g::а;', 'Не $gдумал:думала;')
WHERE `locale` = 'ruRU' AND `ID` = 292949;
