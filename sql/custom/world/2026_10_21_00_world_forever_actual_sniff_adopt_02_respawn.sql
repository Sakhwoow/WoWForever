-- Classic 1.60 (WoW Forever): время респауна
-- ТОЛЬКО UPDATE различий у уже существующих (старых) сущностей по данным официального сервера (сборки снифов 70245-70425, для каждой сущности берётся самая свежая).
-- Каждый UPDATE меняет строку только если значение действительно отличается; повторный запуск безопасен.
-- 

UPDATE `creature` SET `spawntimesecs` = 75 WHERE `id` = 250926 AND `map` = 2991 AND (NOT (`spawntimesecs` <=> 75));
UPDATE `creature` SET `spawntimesecs` = 50 WHERE `id` = 250937 AND `map` = 2991 AND (NOT (`spawntimesecs` <=> 50));
UPDATE `creature` SET `spawntimesecs` = 65 WHERE `id` = 251143 AND `map` = 2991 AND (NOT (`spawntimesecs` <=> 65));
UPDATE `creature` SET `spawntimesecs` = 95 WHERE `id` = 251662 AND `map` = 2991 AND (NOT (`spawntimesecs` <=> 95));
UPDATE `creature` SET `spawntimesecs` = 40 WHERE `id` = 251676 AND `map` = 2991 AND (NOT (`spawntimesecs` <=> 40));
UPDATE `creature` SET `spawntimesecs` = 135 WHERE `id` = 252068 AND `map` = 2991 AND (NOT (`spawntimesecs` <=> 135));
UPDATE `creature` SET `spawntimesecs` = 4 WHERE `id` = 256935 AND `map` = 2991 AND (NOT (`spawntimesecs` <=> 4));
UPDATE `creature` SET `spawntimesecs` = 45 WHERE `id` = 270201 AND `map` = 2991 AND (NOT (`spawntimesecs` <=> 45));
