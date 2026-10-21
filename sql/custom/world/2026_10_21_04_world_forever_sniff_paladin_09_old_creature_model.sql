-- Classic 1.60 (WoW Forever): старые существа: модели (creature_template_model)
-- ТОЛЬКО UPDATE различий у уже существующих (старых) сущностей по данным официального сервера (сборки снифов 70245-70425, для каждой сущности берётся самая свежая).
-- Каждый UPDATE меняет строку только если значение действительно отличается; повторный запуск безопасен.
-- Сгенерировано ForeverSniffTools (tools/gen_updates.py)

UPDATE `creature_template_model` SET `DisplayScale` = 1.0 WHERE `CreatureID` = 1508 AND `Idx` = 0 AND (ABS(`DisplayScale` - 1.0) > 0.001);
UPDATE `creature_template_model` SET `DisplayScale` = 1.0 WHERE `CreatureID` = 1509 AND `Idx` = 0 AND (ABS(`DisplayScale` - 1.0) > 0.001);
UPDATE `creature_template_model` SET `DisplayScale` = 1.0 WHERE `CreatureID` = 1512 AND `Idx` = 0 AND (ABS(`DisplayScale` - 1.0) > 0.001);
UPDATE `creature_template_model` SET `DisplayScale` = 1.0 WHERE `CreatureID` = 1513 AND `Idx` = 0 AND (ABS(`DisplayScale` - 1.0) > 0.001);
