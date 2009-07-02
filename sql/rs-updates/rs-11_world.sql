-- NORMAL

-- missing stats for ghost of Dalronn the Controller in NORMAL (copy from Dalronn's stats)
update `creature_template` set `minlevel`=72, `maxlevel`=72, `minhealth`=96100, `maxhealth`=96100, `armor`=7305, faction_A=1885, faction_H=1885, mindmg=2283.52, maxdmg=3266.7, attackpower=296, equipment_id=93 where `entry`=27389;
-- missing stats for ghost of Scarvald the Constructor in NORMAL (copy from Skarvald's stats)
update `creature_template` set `armor`=7318, `mindmg`=2302.8, `maxdmg`=3285.98, `attackpower`=314, `baseattacktime`=2000 where `entry`=27390;
-- missing stats for Vrykul Skeleton in NORMAL
update `creature_template` set `armor`=2865, `mindmg`=324, `maxdmg`=507, `attackpower`=1246 where `entry`=23970;

-- mana for creatures in Utgarde Keep: Utgarde Keep in NORMAL (wowhead values)
update `creature_template` set `minmana`='49635', `maxmana`='49635' where `entry`='23953';
update `creature_template` set `minmana`='3155', `maxmana`='3155' where `entry`='23960';
update `creature_template` set `minmana`='3994', `maxmana`='3994' where `entry`='24082';
update `creature_template` set `minmana`='39708', `maxmana`='39708' where `entry`='24201';
update `creature_template` set `minmana`='39708', `maxmana`='39708' where `entry`='27389';
update `creature_template` set `minmana`='7196', `maxmana`='7196' where `entry`='28410';

-- HEROIC

-- missing stats for ghost of Dalronn the Controller in HEROIC (copy from Dalronn's stats)
update `creature_template` set `minlevel`=81, `maxlevel`=81, `minhealth`=208528, `maxhealth`=208528, `armor`=10007, faction_A=1885, faction_H=1885, mindmg=6850.56, maxdmg=9800.1, attackpower=670 where `entry`=31676;
-- little correction for Skarvald the Constructor health in HEROIC
update `creature_template` set `minhealth`=208528, `maxhealth`=208528 where `entry`=31679;
-- missing stats for ghost of Skarvald the Constructor in HEROIC (copy from Skarvald's stats)
update `creature_template` set `minlevel`=80, `maxlevel`=80, `minhealth`=208528, `maxhealth`=208528, `armor`=9729, mindmg=6908.4, maxdmg=9857.94, attackpower=642 where `entry`=31680;
-- missing stats for Vrykul Skeleton in HEROIC
update `creature_template` set `minlevel`=80, `maxlevel`=80, `minhealth`=7000, `maxhealth`=7000, `armor`=4190, mindmg=744, maxdmg=1167, attackpower=2866 where `entry`=31635;
-- missing stats for Frost Tomb in HEROIC
update `creature_template` set `minlevel`=80, `maxlevel`=80, minhealth=3382, maxhealth=3382 where `entry`=31672;

-- bosses in heroic must bind to instance
update `creature_template` set `flags_extra` = `flags_extra`|1 where `entry` in (30748, 31679, 31656, 31673);

-- mana for creatures in Utgarde Keep: Utgarde Keep in HEROIC (wowhead values)
update `creature_template` set `minmana`='81620', `maxmana`='81620' where `entry`='30748';
update `creature_template` set `minmana`='48972', `maxmana`='48972' where `entry`='31656';
update `creature_template` set `minmana`='48972', `maxmana`='48972' where `entry`='31657';
update `creature_template` set `minmana`='4081', `maxmana`='4081' where `entry`='31663';
update `creature_template` set `minmana`='8979', `maxmana`='8979' where `entry`='31665';
update `creature_template` set `minmana`='4081', `maxmana`='4081' where `entry`='31675';

-- equipment for creatures in Utgarde Keep: Utgarde Keep in HEROIC (taken from normal)
update `creature_template` set `equipment_id`='715' where `entry`='31673';
update `creature_template` set `equipment_id`='716' where `entry`='31666';
update `creature_template` set `equipment_id`='550' where `entry`='31663';
update `creature_template` set `equipment_id`='192' where `entry`='30747';
update `creature_template` set `equipment_id`='716' where `entry`='31635';
update `creature_template` set `equipment_id`='722' where `entry`='31658';
update `creature_template` set `equipment_id`='723' where `entry`='31660';
update `creature_template` set `equipment_id`='533' where `entry`='31661';
update `creature_template` set `equipment_id`='1599' where `entry`='31667';
update `creature_template` set `equipment_id`='724' where `entry`='31675';
update `creature_template` set `equipment_id`='725' where `entry`='31662';
update `creature_template` set `equipment_id`='541' where `entry`='31679';
update `creature_template` set `equipment_id`='93' where `entry`='31656';
update `creature_template` set `equipment_id`='738' where `entry`='31676';
update `creature_template` set `equipment_id`='93' where `entry`='31657';
update `creature_template` set `equipment_id`='541' where `entry`='31680';
update `creature_template` set `equipment_id`='822' where `entry`='31665';

-- Questrelated: 754, 758, 760 Fixes: suppose to spawn aura onto the well's. The refering spells:
--  spell-- event
--  4975    466 
--  4977    467 
--  4978    468 
--  Adding gameboject with negativ spawntimesecs
DELETE FROM `gameobject` WHERE `guid` IN (100010, 100011, 100012);
-- Blizz own spawns
INSERT INTO `gameobject` (guid, id, map, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs,animprogress,state) VALUES ('100010','2904','1','-2544.542725','-712.088196','-9.231999','0.767944','0.000000','1.000000','-1','0.000000','180','0','0'),
('100011','2904','1','-1823.851196','-237.555313','-9.424848','0.069812','0.000000','1.000000','-1','0.000000','180','0','0'),
('100012','2904','1','-753.255981','-149.158188','-29.056833','3.089183','0.000000','1.000000','-1','0.000000','180','0','0');
DELETE FROM `event_scripts` WHERE `id` IN (466, 467, 468);
INSERT INTO `event_scripts` VALUES
(466, 0, 9, 100010, 0, 0, 0, 0, 0, 0),
(467, 0, 9, 100011, 0, 0, 0, 0, 0, 0),
(468, 0, 9, 100012, 0, 0, 0, 0, 0, 0);

-- Fix crashing NPC's
update creature_addon set moveflags = moveflags &~ 2048 where guid in (select guid from creature where id in (23585, 10415, 28859, 27638, 23188, 27521));  

-- Temp fix for crashing GO's
UPDATE gameobject_template SET type=5 WHERE type=33 AND data18=0;
