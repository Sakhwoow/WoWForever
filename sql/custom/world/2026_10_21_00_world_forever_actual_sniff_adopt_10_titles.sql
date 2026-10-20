-- Classic 1.60 (WoW Forever): creature_template_locale.Title: если у официального сервера подписи нет, очищается
-- Источник: снифы официального сервера Classic (бета «актуал»), сборки 70245, 70291, 70338, 70425; сгенерировано ForeverSniffTools.
-- UPDATE с защитным условием.
-- Повторный запуск безопасен (проверено прогоном дважды на копии снимка БД).

UPDATE `creature_template_locale` SET `Title` = NULL WHERE `entry` = 3628 AND `locale` = 'ruRU' AND (NOT (CAST(`Title` AS BINARY) <=> CAST(NULL AS BINARY)));
UPDATE `creature_template_locale` SET `Title` = NULL WHERE `entry` = 3678 AND `locale` = 'ruRU' AND (NOT (CAST(`Title` AS BINARY) <=> CAST(NULL AS BINARY)));
UPDATE `creature_template_locale` SET `Title` = NULL WHERE `entry` = 6466 AND `locale` = 'ruRU' AND (NOT (CAST(`Title` AS BINARY) <=> CAST(NULL AS BINARY)));
UPDATE `creature_template_locale` SET `Title` = NULL WHERE `entry` = 6566 AND `locale` = 'ruRU' AND (NOT (CAST(`Title` AS BINARY) <=> CAST(NULL AS BINARY)));
UPDATE `creature_template_locale` SET `Title` = NULL WHERE `entry` = 11145 AND `locale` = 'ruRU' AND (NOT (CAST(`Title` AS BINARY) <=> CAST(NULL AS BINARY)));
UPDATE `creature_template_locale` SET `Title` = NULL WHERE `entry` = 12778 AND `locale` = 'ruRU' AND (NOT (CAST(`Title` AS BINARY) <=> CAST(NULL AS BINARY)));
UPDATE `creature_template_locale` SET `Title` = NULL WHERE `entry` = 12788 AND `locale` = 'ruRU' AND (NOT (CAST(`Title` AS BINARY) <=> CAST(NULL AS BINARY)));
UPDATE `creature_template_locale` SET `Title` = NULL WHERE `entry` = 12799 AND `locale` = 'ruRU' AND (NOT (CAST(`Title` AS BINARY) <=> CAST(NULL AS BINARY)));
UPDATE `creature_template_locale` SET `Title` = NULL WHERE `entry` = 12805 AND `locale` = 'ruRU' AND (NOT (CAST(`Title` AS BINARY) <=> CAST(NULL AS BINARY)));
UPDATE `creature_template_locale` SET `Title` = NULL WHERE `entry` = 29512 AND `locale` = 'ruRU' AND (NOT (CAST(`Title` AS BINARY) <=> CAST(NULL AS BINARY)));
UPDATE `creature_template_locale` SET `Title` = NULL WHERE `entry` = 29538 AND `locale` = 'ruRU' AND (NOT (CAST(`Title` AS BINARY) <=> CAST(NULL AS BINARY)));
