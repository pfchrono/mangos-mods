UPDATE `creature_template` SET `minlevel`='80' WHERE (`entry`='22207');
UPDATE `creature_template` SET `maxlevel`='80' WHERE (`entry`='22207');
UPDATE `creature_template` SET `faction_A`='14' WHERE (`entry`='22207');
UPDATE `creature_template` SET `faction_H`='14' WHERE (`entry`='22207');
UPDATE `creature_template` SET `flags_extra`='128' WHERE (`entry`='22207');
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`) VALUES
(178365, 1, 5771, 'Alliance Banner', '', '', '', 83, 0, 1, 0, 0, 0, 0, 0, 1479, 196608, 180100, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(178925, 1, 5651, 'Alliance Banner', '', '', '', 83, 0, 1, 0, 0, 0, 0, 0, 1479, 196608, 180421, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(178940, 1, 5653, 'Contested Banner', '', '', '', 83, 0, 1, 0, 0, 0, 0, 0, 1479, 196608, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(178943, 1, 5652, 'Horde Banner', '', '', '', 84, 0, 1, 0, 0, 0, 0, 0, 1479, 196608, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(179286, 1, 5772, 'Contested Banner', '', '', '', 83, 0, 1, 0, 0, 0, 0, 0, 1479, 196608, 180102, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(179287, 1, 5774, 'Contested Banner', '', '', '', 84, 0, 1, 0, 0, 0, 0, 0, 1479, 0, 180102, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(179435, 1, 5654, 'Contested Banner', '', '', '', 84, 0, 1, 0, 0, 0, 0, 0, 1479, 196608, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180100, 6, 2232, 'Alliance Banner Aura', '', '', '', 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180101, 6, 1311, 'Horde Banner Aura', '', '', '', 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180102, 6, 266, 'Neutral Banner Aura', '', '', '', 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180418, 1, 6211, 'Snowfall Banner', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 1479, 196608, 180100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180421, 6, 2232, 'Alliance Banner Aura, Large', '', '', '', 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180422, 6, 1311, 'Horde Banner Aura, Large', '', '', '', 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180423, 6, 266, 'Neutral Banner Aura, Large', '', '', '', 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180424, 0, 3751, 'Alterac Valley Gate', '', '', '', 100, 0, 3.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `spell_proc_event` WHERE (`entry`='56375');
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`SpellFamilyName`,`SpellFamilyMask0`,`procFlags`) VALUES ('56375','0','3',0x01000000,0x00010000);
DELETE FROM `trinity_string` where `entry` IN(1333);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(1333, 'The Battle for Alterac Valley begins in 2 minutes.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `spell_bonus_data` WHERE `entry`=42243;
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(42243, -1, -1, 0.07, -1, 'Hunter - Volley');
DELETE FROM `spell_proc_event` WHERE (`entry`='64928');
INSERT INTO `spell_proc_event` (`entry`, `SpellFamilyName`, `SpellFamilyMask0`, `procEx`) VALUES (64928, 11, 0x00000001, 0x00000002);
-- BC Dungeons --
UPDATE `access_requirement` SET `heroic_level_min` = 70 WHERE `id` IN
(
    4404, -- Auchenai Crypts --
    4405, -- Mana-Tombs --
    4406, -- Sethekk Halls --
    4407, -- Shadow Labyrinth --
    4321, -- Old Hillsbrad Foothills --
    4320, -- The Black Morass --
    4365, -- The Slave Pens --
    4364, -- The Steamvault --
    4363, -- The Underbog --
    4150, -- Hellfire Ramparts --
    4152, -- The Blood Furnace --
    4151, -- The Shattered Halls --
    4887, -- Magisters' Terrace --
    4468, -- The Arcatraz --
    4467, -- The Botanica --
    4469  -- The Mechanar --
);

-- WOTLK Dungeons --
UPDATE `access_requirement` SET `heroic_level_min` = 80 WHERE `id` IN
(
    5215, -- Ahn'kahet: The Old Kingdom --
    5117, -- Azjol-Nerub --
    5150, -- The Culling of Stratholme --
    4998, -- Drak'Tharon Keep --
    5206, -- Gundrak --
    4983, -- The Nexus --
    5246, -- The Oculus --
    5209, -- The Violet Hold --
    5093, -- Halls of Lightning --
    5010, -- Halls of Stone --
    4745, -- Utgarde Keep --
    4747  -- Utgarde Pinnacle --
);

-- WOTLK Raids --
UPDATE `access_requirement` SET `heroic_level_min` = 80 WHERE `id` IN
(
    4156, -- Naxxramas --
    5290, -- The Eye of Eternity --
    5243, -- The Obsidian Sanctum --
    5379  -- Ulduar --
);
UPDATE `item_template` SET `ScriptName`='item_mysterious_egg' WHERE `entry` IN(39878);
UPDATE `item_template` SET `ScriptName`='item_disgusting_jar' WHERE `entry` IN(44717);
UPDATE `creature_template` SET `ScriptName`='npc_training_dummy', `flags_extra`='262144', `mechanic_immune_mask`='0', `faction_A`='7', `faction_H`='7' WHERE `entry` IN (17578, 24792, 32543, 32546, 32542, 32545, 30527, 31143, 31144, 31146, 32541, 32666, 32667);
DELETE FROM `spell_script_target` WHERE `entry` IN (58836, 48743, 50524, 50515);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
(58836, 3, 31216),
(50524, 3, 27829),
(50515, 3, 27829);
UPDATE `gameobject_template` SET `ScriptName`='go_shrine_of_the_birds' WHERE `entry` IN (185547,185553,185551);
DELETE FROM `spell_proc_event` WHERE `entry` IN(54639, 54638, 54637, 61433, 61434, 49467, 50033, 50034);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
( 54639, 0x00,   15, 0x00400000, 0x00010000, 0x00000000, 0x00000000, 0x00000000,   0,   0,   0), -- Blood of the north
( 54638, 0x00,   15, 0x00400000, 0x00010000, 0x00000000, 0x00000000, 0x00000000,   0,   0,   0), -- Blood of the north
( 54637, 0x00,   15, 0x00400000, 0x00010000, 0x00000000, 0x00000000, 0x00000000,   0,   0,   0), -- Blood of the north
( 61433, 0x00,   15, 0x00400000, 0x00010000, 0x00000000, 0x00000000, 0x00000000,   0,   0,   0), -- Blood of the north
( 61434, 0x00,   15, 0x00400000, 0x00010000, 0x00000000, 0x00000000, 0x00000000,   0,   0,   0), -- Blood of the north
( 49467, 0x00,   15, 0x00000010, 0x00020000, 0x00000000, 0x00000000, 0x00000000,   0,   0,   0), -- Death Rune Mastery
( 50033, 0x00,   15, 0x00000010, 0x00020000, 0x00000000, 0x00000000, 0x00000000,   0,   0,   0), -- Death Rune Mastery
( 50034, 0x00,   15, 0x00000010, 0x00020000, 0x00000000, 0x00000000, 0x00000000,   0,   0,   0); -- Death Rune Mastery
DELETE FROM `spell_proc_event` WHERE `entry` IN(58872, 58872);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
( 58872, 0x00,   0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000043,   0,   0,   0), -- Damage Shield (Rank 1)
( 58872, 0x00,   0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000043,   0,   0,   0); -- Damage Shield (Rank 2)
DELETE FROM `spell_script_target` WHERE `entry` IN (52173, 60243);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
(52173, 3, 28267),
(60243, 3, 11236);