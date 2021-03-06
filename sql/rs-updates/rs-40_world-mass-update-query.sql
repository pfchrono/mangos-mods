-- ALTER TABLE db_version CHANGE COLUMN required_8158_01_mangos_playercreateinfo_action required_8190_01_mangos_creature_template bit;

ALTER TABLE `creature_template`
    CHANGE COLUMN `unk1` `KillCredit1` int(11) unsigned NOT NULL default '0',
    CHANGE COLUMN `unk2` `KillCredit2` int(11) unsigned NOT NULL default '0';
DELETE FROM `spell_elixir` WHERE `entry` IN
(54452, 60340, 60345, 60341, 60344, 60346, 54494, 53748, 53749, 53746, 60343, 53751, 53764, 60347, 53763, 53747, 53760, 54212, 53758, 53755, 53752, 62380);
INSERT INTO `spell_elixir` (`entry`, `mask`) VALUES
(54452, 0x1),
(60340, 0x1),
(60345, 0x1),
(60341, 0x1),
(60344, 0x1),
(60346, 0x1),
(54494, 0x1),
(53748, 0x1),
(53749, 0x1),
(53746, 0x1),
(60343, 0x2),
(53751, 0x2),
(53764, 0x2),
(60347, 0x2),
(53763, 0x2),
(53747, 0x2),
(53760, 0x3),
(54212, 0x3),
(53758, 0x3),
(53755, 0x3),
(53752, 0x3),
(62380, 0x3);
DELETE FROM `spell_script_target` WHERE `entry` IN (58836);
INSERT INTO `spell_script_target` VALUES (58836, 1, 31216);
UPDATE `creature_template` SET `ScriptName`='npc_mirror_image' WHERE `entry`=31216;
UPDATE `creature_template` SET `spell1`=59638, `spell2` = 59637 WHERE `entry`=31216;
DELETE FROM `spell_proc_event` WHERE `entry` IN (53234, 53237, 53238);
INSERT INTO `spell_proc_event` VALUES 
(53234, 0x00, 9, 0x00020000, 0x00000001, 0x00000001, 0x00000000, 0x00000002, 0.000000, 0.000000, 0), -- Piercing Shots (Rank 1)
(53237, 0x00, 9, 0x00020000, 0x00000001, 0x00000001, 0x00000000, 0x00000002, 0.000000, 0.000000, 0), -- Piercing Shots (Rank 2)
(53238, 0x00, 9, 0x00020000, 0x00000001, 0x00000001, 0x00000000, 0x00000002, 0.000000, 0.000000, 0); -- Piercing Shots (Rank 3)
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (49039);
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
( 49039, 50397, 2, 'Lichborne - shapeshift');
-- ALTER TABLE db_version CHANGE COLUMN required_8190_01_mangos_creature_template required_8191_01_mangos_spell_affect bit;

DROP TABLE IF EXISTS `spell_affect`;
UPDATE `creature_template` SET `ScriptName`='npc_sinkhole_kill_credit' WHERE (`entry`='26248') or (`entry`='26249');
UPDATE `item_template` SET `ScriptName`='item_incendiary_explosives' WHERE (`entry`='35704');
UPDATE `creature_template` SET `flags_extra`='2' WHERE (`entry`='26250');
UPDATE `creature_template` SET `ScriptName`='npc_captured_rageclaw' WHERE (`entry`='29686');
UPDATE `creature_template` SET `ScriptName`='npc_drakuru_shackles' WHERE (`entry`='29700');

DELETE FROM `spell_script_target` WHERE `entry` IN (55083,55223,59951,59952);
INSERT INTO `spell_script_target` VALUES (55083, 1, 29700),(55223, 1, 29686),(59951, 1, 29686),(59952, 1, 29686);
UPDATE `creature_template` SET `ScriptName`='npc_khunok_the_behemoth' WHERE (`entry`='25862');

-- DB CONTENT --
UPDATE `quest_template` SET `SrcSpell`='46232' WHERE (`entry`='11878');
DELETE FROM script_texts WHERE entry BETWEEN -1615042 AND -1615000;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(-1615000,'I fear nothing! Least of all you!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14111,1,0,0,'shadron SAY_SHADRON_AGGRO'),
(-1615001,'You are insignificant!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14112,1,0,0,'shadron SAY_SHADRON_SLAY_1'),
(-1615002,'Such mediocre resistance!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14113,1,0,0,'shadron SAY_SHADRON_SLAY_2'),
(-1615003,'We...are superior! How could this...be...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14118,1,0,0,'shadron SAY_SHADRON_DEATH'),
(-1615004,'You are easily bested! ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14114,1,0,0,'shadron SAY_SHADRON_BREATH'),
(-1615005,'I will take pity on you Sartharion, just this once.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14117,1,0,0,'shadron SAY_SHADRON_RESPOND'),
(-1615006,'Father tought me well!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14115,1,0,0,'shadron SAY_SHADRON_SPECIAL_1'),
(-1615007,'On your knees!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14116,1,0,0,'shadron SAY_SHADRON_SPECIAL_2'),
(-1615008,'A Shadron Disciple appears in the Twilight!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,5,0,0,'shadron WHISPER_SHADRON_DICIPLE'),

(-1615009,'You have no place here. Your place is among the departed.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14122,1,0,0,'tenebron SAY_TENEBRON_AGGRO'),
(-1615010,'No contest.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14123,1,0,0,'tenebron SAY_TENEBRON_SLAY_1'),
(-1615011,'Typical... Just as I was having fun.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14124,1,0,0,'tenebron SAY_TENEBRON_SLAY_2'),
(-1615012,'I should not... have held back...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14129,1,0,0,'tenebron SAY_TENEBRON_DEATH'),
(-1615013,'To darkness I condemn you...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14125,1,0,0,'tenebron SAY_TENEBRON_BREATH'),
(-1615014,'It is amusing to watch you struggle. Very well, witness how it is done.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14128,1,0,0,'tenebron SAY_TENEBRON_RESPOND'),
(-1615015,'Arrogant little creatures! To challenge powers you do not yet understand...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14126,1,0,0,'tenebron SAY_TENEBRON_SPECIAL_1'),
(-1615016,'I am no mere dragon! You will find I am much, much, more...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14127,1,0,0,'tenebron SAY_TENEBRON_SPECIAL_2'),
(-1615017,'%s begins to hatch eggs in the twilight!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,5,0,0,'tenebron WHISPER_HATCH_EGGS'),

(-1615018,'It is my charge to watch over these eggs. I will see you burn before any harm comes to them!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14093,1,0,0,'sartharion SAY_SARTHARION_AGGRO'),
(-1615019,'This pathetic siege ends NOW!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14103,1,0,0,'sartharion SAY_SARTHARION_BERSERK'),
(-1615020,'Burn, you miserable wretches!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14098, 1,0,0,'sartharion SAY_SARTHARION_BREATH'),
(-1615021,'Shadron! Come to me, all is at risk!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14105,1,0,0,'sartharion SARTHARION_CALL_SHADRON'),
(-1615022,'Tenebron! The eggs are yours to protect as well!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14106,1,0,0,'sartharion SAY_SARTHARION_CALL_TENEBRON'),
(-1615023,'Vesperon! The clutch is in danger! Assist me!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14104,1,0,0,'sartharion SAY_SARTHARION_CALL_VESPERON'),
(-1615024,'Such is the price... of failure...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14107,1,0,0,'sartharion SAY_SARTHARION_DEATH'),
(-1615025,'Such flammable little insects....', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14099,1,0,0,'sartharion SAY_SARTHARION_SPECIAL_1'),
(-1615026,'Your charred bones will litter the floor!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14100,1,0,0,'sartharion SAY_SARTHARION_SPECIAL_2'),
(-1615027,'How much heat can you take?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14101,1,0,0,'sartharion SAY_SARTHARION_SPECIAL_3'),
(-1615028,'All will be reduced to ash!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14102,1,0,0,'sartharion SAY_SARTHARION_SPECIAL_4'),
(-1615029,'You will make a fine meal for the hatchlings.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14094,1,0,0,'sartharion SAY_SARTHARION_SLAY_1'),
(-1615030,'You are the grave disadvantage.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14096,1,0,0,'sartharion SAY_SARTHARION_SLAY_2'),
(-1615031,'This is why we call you lesser beeings.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14097,1,0,0,'sartharion SAY_SARTHARION_SLAY_3'),
(-1615032,'The lava surrounding %s churns!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,5,0,0,'sartharion WHISPER_LAVA_CHURN'),

(-1615033,'You pose no threat, lesser beings...give me your worst!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14133,1,0,0,'vesperon SAY_VESPERON_AGGRO'),
(-1615034,'The least you could do is put up a fight...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14134,1,0,0,'vesperon SAY_VESPERON_SLAY_1'),
(-1615035,'Was that the best you can do?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14135,1,0,0,'vesperon SAY_VESPERON_SLAY_2'),
(-1615036,'I still have some...fight..in...me...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14140,1,0,0,'vesperon SAY_VESPERON_DEATH'),
(-1615037,'I will pick my teeth with your bones!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14136,1,0,0,'vesperon SAY_VESPERON_BREATH'),
(-1615038,'Father was right about you, Sartharion...You are a weakling!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14139,1,0,0,'vesperon SAY_VESPERON_RESPOND'),
(-1615039,'Aren\'t you tricky...I have a few tricks of my own...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14137,1,0,0,'vesperon SAY_VESPERON_SPECIAL_1'),
(-1615040,'Unlike, I have many talents.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14138,1,0,0,'vesperon SAY_VESPERON_SPECIAL_2'),
(-1615041,'A Vesperon Disciple appears in the Twilight!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,5,0,0,'shadron WHISPER_VESPERON_DICIPLE'),

(-1615042,'%s begins to open a Twilight Portal!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,5,0,0,'sartharion drake WHISPER_OPEN_PORTAL');
UPDATE instance_template SET script='instance_obsidian_sanctum' WHERE map=615;
UPDATE creature_template SET ScriptName='boss_sartharion' WHERE entry=28860;
UPDATE creature_template SET ScriptName='mob_vesperon' WHERE entry=30449;
UPDATE creature_template SET ScriptName='mob_shadron' WHERE entry=30451;
UPDATE creature_template SET ScriptName='mob_tenebron' WHERE entry=30452;
UPDATE creature_template SET ScriptName='mob_twilight_eggs' WHERE entry=30882;
UPDATE creature_template SET ScriptName='mob_twilight_whelp' WHERE entry IN (30890, 31214);
UPDATE creature_template SET ScriptName='mob_acolyte_of_shadron' WHERE entry=31218;
UPDATE creature_template SET ScriptName='mob_acolyte_of_vesperon' WHERE entry=31219;

UPDATE gameobject_template SET ScriptName='go_resonite_cask' WHERE entry=178145;
DELETE FROM `command` WHERE `name` = 'reload spell_affect';
UPDATE `item_template` SET `ScriptName`='item_dart_gun' WHERE `entry`=44222;

UPDATE `creature_template` SET `ScriptName`='npc_kalecgos' WHERE `entry` IN (24844, 24848);
DELETE FROM `command` WHERE `name` IN ('reload creature_linked_respawn', 'npc setlink');
INSERT INTO `command` (`name`,`security`,`help`) VALUES 
('reload creature_linked_respawn',2,'Syntax: .reload creature_linked_respawn\r\nReload creature_linked_respawn table.'),
('npc setlink',2,'Syntax: .npc setlink $creatureGUID\r\n\r\nLinks respawn of selected creature to the condition that $creatureGUID defined is alive.');
DELETE FROM `spell_bonus_data` WHERE `entry` = 53600;
DELETE FROM `spell_proc_event` WHERE `entry` IN(47569, 47570);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
( 47569, 0x00,   6, 0x00004000, 0x00000000, 0x00000000, 0x00004000, 0x00000000,   0,  50,   0), -- Improved Shadowform (Rank 1)
( 47570, 0x00,   6, 0x00004000, 0x00000000, 0x00000000, 0x00004000, 0x00000000,   0, 100,   0); -- Improved Shadowform (Rank 2)
DELETE FROM `spell_bonus_data` WHERE `entry`=779;
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES 
('779', '-1', '-1', '0.063', '-1', 'Druid - Swipe (Bear)');

DELETE FROM `spell_bonus_data` WHERE `entry`=50256;
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES 
(50256, -1, -1, 0.08, -1, 'Pet Skills - Bear (Swipe)');
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=11898;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=11899;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=149045;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=149046;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=164871;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=175080;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=176080;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=176081;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=176082;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=176083;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=176084;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=176085;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=176086;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=176231;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=176244;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=176310;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=176495;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=177233;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=181056;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=181646;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=183169;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=183177;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=183202;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=183203;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=183407;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=183490;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=183788;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=184330;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=20649;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=20650;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=20651;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=20652;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=20653;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=20654;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=20655;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=20656;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=20657;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=20808;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=210335;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=210336;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=210349;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=211023;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=211024;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=211050;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=211051;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=211052;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=211053;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=4170;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=4171;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=47296;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=47297;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=80022;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=80023;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=85556;
DELETE FROM `spell_bonus_data` where `entry` IN(62124, 64382);
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(62124, 0.085, -1, -1, -1, 'Paladin - Hand of Reckoning'),
(64382, -1, -1, 0.5, -1, 'Warrior - Shattering Throw');
UPDATE `creature_template` SET `ScriptName`='npc_injured_rainspeaker_oracle' WHERE `entry`=28217;

DELETE FROM `script_waypoint` WHERE `entry` = 28217;
INSERT INTO `script_waypoint` VALUES
(28217, 0, 5399.96,4509.07,-131.053, 0, ''),
(28217, 1, 5396.95,4514.84,-131.791,  0, ''),
(28217, 2, 5395.16,4524.06,-132.335,  0, ''),
(28217, 3, 5400.15,4526.84,-136.058, 0, ''),
(28217, 4, 5403.53,4527.2,-138.907, 0, ''),
(28217, 5, 5406.51,4527.47,-141.983, 0, ''),
(28217, 6, 5409.16,4526.37,-143.902,  0, ''),
(28217, 7, 5412.04,4523.05,-143.998,  0, ''),
(28217, 8, 5415.23,4521.19,-143.961,  0, ''),
(28217, 9, 5417.74,4519.74,-144.292,  0, ''),
(28217, 10, 5421.77,4519.79,-145.36, 0, ''),
(28217, 11, 5426.75,4520.53,-147.931, 0, ''),
(28217, 12, 5429.06,4521.82,-148.919,  0, ''),
(28217, 13, 5436.52,4534.63,-149.618,  0, ''),
(28217, 14, 5441.52,4542.23,-149.367,  0, ''),
(28217, 15, 5449.06,4553.47,-149.187, 0, ''),
(28217, 16, 5453.5,4565.61,-147.526,  0, ''),
(28217, 17, 5455.04,4578.6,-147.147,  0, ''),
(28217, 18, 5462.32,4591.69,-147.738,0, ''),
(28217, 19, 5470.04,4603.04,-146.044,0, ''),
(28217, 20, 5475.93,4608.86,-143.152, 0, ''),
(28217, 21, 5484.48,4613.78,-139.19, 0, ''),
(28217, 22, 5489.03,4616.56,-137.796, 0, ''),
(28217, 23, 5497.92,4629.89,-135.556, 0, ''),
(28217, 24, 5514.48,4638.82,-136.19, 0, ''),
(28217, 25, 5570,4654.5,-134.947, 0,  ''),
(28217, 26, 5578.32,4653.29,-136.896, 0, ''),
(28217, 27, 5596.56,4642.26,-136.593, 0, ''),
(28217, 28, 5634.02,4600.35,-137.291,2000,'');

INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(-1571000, 'You save me! We thank you. We going to go back to village now. You come too... you can stay with us! Puppy-men kind of mean anyway. ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'npc_injured_rainspeaker_oracle SAY_END_IRO'),
(-1571001, 'Let me know when you ready to go, okay?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'npc_injured_rainspeaker_oracle SAY_QUEST_ACCEPT_IRO '),
(-1571002, 'Home time!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'npc_injured_rainspeaker_oracle SAY_START_IRO');
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN(47585, 64382);
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
( 47585, 60069, 2, 'Dispersion (transform/regen)'),
( 64382, 64380, 0, 'Shattering Throw'),
( 47585, 63230, 2, 'Dispersion (immunity)');
