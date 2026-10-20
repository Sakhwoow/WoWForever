-- Classic 1.60 (WoW Forever): creature_template_addon.aiAnimKit по SMSG_SET_AI_ANIM_KIT при появлении существа
-- Источник: снифы официального сервера Classic (бета «актуал»), сборки 70245, 70291, 70338, 70425; сгенерировано ForeverSniffTools.
-- UPDATE с защитным условием, INSERT IGNORE новых строк шаблона.
-- Повторный запуск безопасен (проверено прогоном дважды на копии снимка БД).

INSERT IGNORE INTO `creature_template_addon` (`entry`,`PathId`,`mount`,`MountCreatureID`,`StandState`,`AnimTier`,`VisFlags`,`SheathState`,`PvPFlags`,`emote`,`aiAnimKit`,`movementAnimKit`,`meleeAnimKit`,`visibilityDistanceType`,`auras`) VALUES
(253002,0,0,0,0,0,0,1,0,0,34910,0,0,0,NULL),
(256076,0,0,0,0,0,0,1,0,0,34793,0,0,0,NULL),
(258260,0,0,0,0,0,0,1,0,0,35850,0,0,0,NULL),
(274962,0,0,0,0,0,0,1,0,0,38312,0,0,0,NULL);
