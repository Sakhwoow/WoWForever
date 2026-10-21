-- Classic 1.60 (WoW Forever): старые игровые объекты: gameobject_template
-- ТОЛЬКО UPDATE различий у уже существующих (старых) сущностей по данным официального сервера (сборки снифов 70245-70425, для каждой сущности берётся самая свежая).
-- Каждый UPDATE меняет строку только если значение действительно отличается; повторный запуск безопасен.
-- Сгенерировано ForeverSniffTools (tools/gen_updates.py)

UPDATE `gameobject_template` SET `ContentTuningId` = 5841, `RequiredLevel` = 1, `Data2` = 1, `Data20` = 4096 WHERE `entry` = 290 AND (NOT (`ContentTuningId` <=> 5841) OR NOT (`RequiredLevel` <=> 1) OR NOT (`Data2` <=> 1) OR NOT (`Data20` <=> 4096));
UPDATE `gameobject_template` SET `Data20` = 4097 WHERE `entry` = 2724 AND (NOT (`Data20` <=> 4097));
UPDATE `gameobject_template` SET `Data20` = 135179 WHERE `entry` = 106319 AND (NOT (`Data20` <=> 135179));
UPDATE `gameobject_template` SET `Data20` = 4097 WHERE `entry` = 164662 AND (NOT (`Data20` <=> 4097));
UPDATE `gameobject_template` SET `Data2` = 196608 WHERE `entry` = 176594 AND (NOT (`Data2` <=> 196608));
UPDATE `gameobject_template` SET `Data1` = 0, `Data26` = 1 WHERE `entry` = 178090 AND (NOT (`Data1` <=> 0) OR NOT (`Data26` <=> 1));
UPDATE `gameobject_template` SET `Data20` = 4096 WHERE `entry` = 180523 AND (NOT (`Data20` <=> 4096));
