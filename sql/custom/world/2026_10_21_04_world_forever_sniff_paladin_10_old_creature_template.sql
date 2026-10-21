-- Classic 1.60 (WoW Forever): старые существа: creature_template и уровни
-- ТОЛЬКО UPDATE различий у уже существующих (старых) сущностей по данным официального сервера (сборки снифов 70245-70425, для каждой сущности берётся самая свежая).
-- Каждый UPDATE меняет строку только если значение действительно отличается; повторный запуск безопасен.
-- Сгенерировано ForeverSniffTools (tools/gen_updates.py)

UPDATE `creature_template` SET `KillCredit1` = 1746 WHERE `entry` = 1495 AND (NOT (`KillCredit1` <=> 1746));
UPDATE `creature_template` SET `KillCredit1` = 1746 WHERE `entry` = 1496 AND (NOT (`KillCredit1` <=> 1746));
UPDATE `creature_template` SET `KillCredit1` = 0, `unit_flags3` = 16 WHERE `entry` = 1502 AND (NOT (`KillCredit1` <=> 0) OR NOT (`unit_flags3` <=> 16));
UPDATE `creature_template` SET `unit_flags3` = 16 WHERE `entry` = 1505 AND (NOT (`unit_flags3` <=> 16));
UPDATE `creature_template` SET `speed_run` = 1.285714 WHERE `entry` = 1515 AND (ABS(`speed_run` - 1.285714) > 0.01);
UPDATE `creature_template` SET `KillCredit1` = 1746 WHERE `entry` = 1519 AND (NOT (`KillCredit1` <=> 1746));
UPDATE `creature_template` SET `KillCredit1` = 1746 WHERE `entry` = 1652 AND (NOT (`KillCredit1` <=> 1746));
UPDATE `creature_template` SET `KillCredit1` = 1746 WHERE `entry` = 1735 AND (NOT (`KillCredit1` <=> 1746));
UPDATE `creature_template` SET `KillCredit1` = 1746 WHERE `entry` = 1736 AND (NOT (`KillCredit1` <=> 1746));
UPDATE `creature_template` SET `KillCredit1` = 1746, `speed_run` = 1.142857 WHERE `entry` = 1737 AND (NOT (`KillCredit1` <=> 1746) OR ABS(`speed_run` - 1.142857) > 0.01);
UPDATE `creature_template` SET `KillCredit1` = 1746 WHERE `entry` = 1738 AND (NOT (`KillCredit1` <=> 1746));
UPDATE `creature_template` SET `KillCredit1` = 1746, `speed_run` = 1.142857 WHERE `entry` = 1739 AND (NOT (`KillCredit1` <=> 1746) OR ABS(`speed_run` - 1.142857) > 0.01);
UPDATE `creature_template` SET `KillCredit1` = 1746 WHERE `entry` = 1740 AND (NOT (`KillCredit1` <=> 1746));
UPDATE `creature_template` SET `KillCredit1` = 1746, `speed_run` = 1.142857 WHERE `entry` = 1741 AND (NOT (`KillCredit1` <=> 1746) OR ABS(`speed_run` - 1.142857) > 0.01);
UPDATE `creature_template` SET `KillCredit1` = 1746, `npcflag` = 3 WHERE `entry` = 1742 AND (NOT (`KillCredit1` <=> 1746) OR NOT (`npcflag` <=> 3));
UPDATE `creature_template` SET `KillCredit1` = 1746 WHERE `entry` = 1743 AND (NOT (`KillCredit1` <=> 1746));
UPDATE `creature_template` SET `KillCredit1` = 1746 WHERE `entry` = 1744 AND (NOT (`KillCredit1` <=> 1746));
UPDATE `creature_template` SET `KillCredit1` = 1746 WHERE `entry` = 1745 AND (NOT (`KillCredit1` <=> 1746));
UPDATE `creature_template` SET `speed_walk` = 0.77776 WHERE `entry` = 1918 AND (ABS(`speed_walk` - 0.77776) > 0.01);
UPDATE `creature_template` SET `KillCredit1` = 0 WHERE `entry` = 1935 AND (NOT (`KillCredit1` <=> 0));
UPDATE `creature_template` SET `KillCredit1` = 0 WHERE `entry` = 1936 AND (NOT (`KillCredit1` <=> 0));
UPDATE `creature_template` SET `KillCredit1` = 1746 WHERE `entry` = 2209 AND (NOT (`KillCredit1` <=> 1746));
UPDATE `creature_template` SET `KillCredit1` = 1746 WHERE `entry` = 2210 AND (NOT (`KillCredit1` <=> 1746));
UPDATE `creature_template` SET `npcflag` = 1 WHERE `entry` = 2310 AND (NOT (`npcflag` <=> 1));
UPDATE `creature_template` SET `npcflag` = 83 WHERE `entry` = 3549 AND (NOT (`npcflag` <=> 83));
UPDATE `creature_template` SET `npcflag` = 81 WHERE `entry` = 4773 AND (NOT (`npcflag` <=> 81));
UPDATE `creature_template` SET `unit_flags` = 768 WHERE `entry` = 5667 AND (NOT (`unit_flags` <=> 768));
UPDATE `creature_template` SET `KillCredit1` = 1746, `speed_run` = 1.285714 WHERE `entry` = 5725 AND (NOT (`KillCredit1` <=> 1746) OR ABS(`speed_run` - 1.285714) > 0.01);
UPDATE `creature_template` SET `family` = 24 WHERE `entry` = 10716 AND (NOT (`family` <=> 24));
