ALTER TABLE `npc_spellclick_spells` DROP COLUMN `quest_status`;
ALTER TABLE `npc_spellclick_spells` ADD `aura_required` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'player without aura cant click' AFTER `cast_flags`;
ALTER TABLE `npc_spellclick_spells` ADD `aura_forbidden` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'player with aura cant click' AFTER `aura_required`;
ALTER TABLE `npc_spellclick_spells` ADD `user_type` SMALLINT(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'relation with summoner: 0-no 1-friendly 2-raid 3-party player can click' AFTER `aura_forbidden`;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN(31883, 31893, 31894, 31895, 31896, 31897);
INSERT INTO `npc_spellclick_spells` (npc_entry, spell_id, quest_start, quest_start_active, quest_end, cast_flags, aura_required, aura_forbidden, user_type) VALUES
(31883, 60123, 0, 0, 0, 0x2, 0, 48085, 2),
(31893, 60123, 0, 0, 0, 0x2, 0, 48084, 2),
(31894, 60123, 0, 0, 0, 0x2, 0, 28276, 2),
(31895, 60123, 0, 0, 0, 0x2, 0, 27874, 2),
(31896, 60123, 0, 0, 0, 0x2, 0, 27873, 2),
(31897, 60123, 0, 0, 0, 0x2, 0, 7001, 2);

DELETE FROM `spell_bonus_data` WHERE `entry` IN(7001);
REPLACE INTO `spell_bonus_data` (entry, direct_bonus, dot_bonus, ap_bonus, ap_dot_bonus, comments) VALUES
(7001, -1, 0.3333, -1, -1, 'Priest - Lightwell Renew Rank 1');

DELETE FROM `spell_proc_event` WHERE `entry`IN(63373,63374);
INSERT INTO `spell_proc_event` (`entry`,`SpellFamilyName`,`SpellFamilyMask0`,`procFlags`) VALUES
(63373,11,0x80000000,0x00010000), -- Frozen Power (Rank 1)
(63374,11,0x80000000,0x00010000); -- Freeze Power (Rank 2)

UPDATE `creature_template` SET `ScriptName`='npc_crusade_persuaded' WHERE `entry` IN (28939,28940,28610);

update item_template set spellppmRate_1 = 1 where entry = 39371; -- persuader


DELETE FROM script_texts WHERE entry BETWEEN -1609600 AND -1609501;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
-- How To Win Friends And Influence Enemies
   (-1609501, 'I\'ll tear the secrets from your soul! Tell me about the "Crimson Dawn" and your life may be spared!',0,0,0,0,'player SAY_PERSUADE1'),
   (-1609502, 'Tell me what you know about "Crimson Dawn" or the beatings will continue!',0,0,0,0,'player SAY_PERSUADE2'),
   (-1609503, 'I\'m through being courteous with your kind, human! What is the "Crimson Dawn?"',0,0,0,0,'player SAY_PERSUADE3'),
   (-1609504, 'Is your life worth so little? Just tell me what I need to know about "Crimson Dawn" and I\'ll end your suffering quickly.',0,0,0,0,'player SAY_PERSUADE4'),
   (-1609505, 'I can keep this up for a very long time, Scarlet dog! Tell me about the "Crimson Dawn!"',0,0,0,0,'player SAY_PERSUADE5'),
   (-1609506, 'What is the "Crimson Dawn?"',0,0,0,0,'player SAY_PERSUADE6'),
   (-1609507, '"Crimson Dawn!" What is it! Speak!',0,0,0,0,'player SAY_PERSUADE7'),
   (-1609508, 'You\'ll be hanging in the gallows shortly, Scourge fiend!',0,0,0,0,'crusader SAY_CRUSADER1'),
   (-1609509, 'You\'ll have to kill me, monster! I will tell you NOTHING!',0,0,0,0,'crusader SAY_CRUSADER2'),
   (-1609510, 'You hit like a girl. Honestly. Is that the best you can do?',0,0,0,0,'crusader SAY_CRUSADER3'),
   (-1609511, 'ARGH! You burned my last good tabard!',0,0,0,0,'crusader SAY_CRUSADER4'),
   (-1609512, 'Argh... The pain... The pain is almost as unbearable as the lashings I received in grammar school when I was but a child.',0,0,0,0,'crusader SAY_CRUSADER5'),
   (-1609513, 'I used to work for Grand Inquisitor Isillien! Your idea of pain is a normal mid-afternoon for me!',0,0,0,0,'crusader SAY_CRUSADER6'),
   (-1609514, 'I\'ll tell you everything! STOP! PLEASE!',0,0,0,20,'break crusader SAY_PERSUADED1'),
   (-1609515, 'We... We have only been told that the "Crimson Dawn" is an awakening. You see, the Light speaks to the High General. It is the Light...',0,0,0,20,'break crusader SAY_PERSUADED2'),
   (-1609516, 'The Light that guides us. The movement was set in motion before you came... We... We do as we are told. It is what must be done.',0,0,0,20,'break crusader SAY_PERSUADED3'),
   (-1609517, 'I know very little else... The High General chooses who may go and who must stay behind. There\'s nothing else... You must believe me!',0,0,0,20,'break crusader SAY_PERSUADED4'),
   (-1609518, 'LIES! The pain you are about to endure will be talked about for years to come!',0,0,0,0,'break crusader SAY_PERSUADED5'),
   (-1609519, 'NO! PLEASE! There is one more thing that I forgot to mention... A courier comes soon... From Hearthglen. It...',0,0,0,20,'break crusader SAY_PERSUADED6'),
-- Ambush At The Overlook
   (-1609531, 'Hrm, what a strange tree. I must investigate.',0,0,0,0,'Scarlet Courier SAY_TREE1'),
   (-1609532, 'What''s this!? This isn''t a tree at all! Guards! Guards!',0,0,0,0,'Scarlet Courier SAY_TREE2'),
-- Bloody Breakout
   (-1609561, 'I\'ll need to get my runeblade and armor... Just need a little more time.',0,0,0,399,'Koltira Deathweaver SAY_BREAKOUT1'),
   (-1609562, 'I\'m still weak, but I think I can get an anti-magic barrier up. Stay inside it or you\'ll be destroyed by their spells.',0,0,0,0,'Koltira Deathweaver SAY_BREAKOUT2'),
   (-1609563, 'Maintaining this barrier will require all of my concentration. Kill them all!',0,0,0,16,'Koltira Deathweaver SAY_BREAKOUT3'),
   (-1609564, 'There are more coming. Defend yourself! Don\'t fall out of the anti-magic field! They\'ll tear you apart without its protection!',0,0,0,0,'Koltira Deathweaver SAY_BREAKOUT4'),
   (-1609565, 'I can\'t keep barrier up much longer... Where is that coward?',0,0,0,0,'Koltira Deathweaver SAY_BREAKOUT5'),
   (-1609566, 'The High Inquisitor comes! Be ready, death knight! Do not let him draw you out of the protective bounds of my anti-magic field! Kill him and take his head!',0,0,0,0,'Koltira Deathweaver SAY_BREAKOUT6'),
   (-1609567, 'Stay in the anti-magic field! Make them come to you!',0,0,0,0,'Koltira Deathweaver SAY_BREAKOUT7'),
   (-1609568, 'The death of the High Inquisitor of New Avalon will not go unnoticed. You need to get out of here at once! Go, before more of them show up. I\'ll be fine on my own.',0,0,0,0,'Koltira Deathweaver SAY_BREAKOUT8'),
   (-1609569, 'I\'ll draw their fire, you make your escape behind me.',0,0,0,0,'Koltira Deathweaver SAY_BREAKOUT9'),
   (-1609570, 'Your High Inquisitor is nothing more than a pile of meat, Crusaders! There are none beyond the grasp of the Scourge!',0,1,0,0,'Koltira Deathweaver SAY_BREAKOUT10'),
   (-1609581, 'The Crusade will purge your kind from this world!',0,1,0,0,'High Inquisitor Valroth start'),
   (-1609582, 'It seems that I\'ll need to deal with you myself. The High Inquisitor comes for you, Scourge!',0,1,0,0,'High Inquisitor Valroth aggro'),
   (-1609583, 'You have come seeking deliverance? I have come to deliver!',0,0,0,0,'High Inquisitor Valroth yell'),
   (-1609584, 'LIGHT PURGE YOU!',0,0,0,0,'High Inquisitor Valroth yell'),
   (-1609585, 'Coward!',0,0,0,0,'High Inquisitor Valroth yell'),
   (-1609586, 'High Inquisitor Valroth\'s remains fall to the ground.',0,2,0,0,'High Inquisitor Valroth death');

-- Distracting Jarven does not depend on taking quest from the guarded barrel, it's available while Bitter Rivals is active
update quest_template set PrevQuestID = -310 where entry = 308;

-- Make the unguarded barrel appear sooner after Jarven leaves
delete from `quest_end_scripts` where `id` = 308;
insert into `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) values('308','0','3','0','0','0','-5601.64','-541.38','392.42','0.5');
insert into `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) values('308','0','0','0','0','2000000077','0','0','0','0');
insert into `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) values('308','2','3','0','0','0','-5597.94','-542.04','392.42','5.5');
insert into `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) values('308','3','3','0','0','0','-5597.95','-548.43','395.48','4.7');
insert into `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) values('308','3','9','35875','30','0','0','0','0','0');
insert into `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) values('308','7','3','0','0','0','-5605.31','-549.33','399.09','3.1');
insert into `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) values('308','10','3','0','0','0','-5607.55','-546.63','399.09','1.5');
insert into `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) values('308','14','3','0','0','0','-5597.52','-538.75','399.09','1.5');
insert into `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) values('308','18','3','0','0','0','-5597.62','-530.24','399.65','3');
insert into `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) values('308','21','3','0','0','0','-5603.67','-529.91','399.65','4.2');
insert into `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) values('308','25','0','0','0','2000000056','0','0','0','0');
insert into `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) values('308','36','3','0','0','0','-5603.67','-529.91','399.65','4.2');
insert into `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) values('308','39','3','0','0','0','-5597.62','-530.24','399.65','3');
insert into `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) values('308','42','3','0','0','0','-5597.52','-538.75','399.09','1.5');
insert into `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) values('308','45','3','0','0','0','-5607.55','-546.63','399.09','1.5');
insert into `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) values('308','48','3','0','0','0','-5605.31','-549.33','399.09','3.1');
insert into `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) values('308','51','3','0','0','0','-5597.95','-548.43','395.48','4.7');
insert into `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) values('308','54','3','0','0','0','-5597.94','-542.04','392.42','5.5');
insert into `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) values('308','55','0','0','0','2000000078','0','0','0','0');
insert into `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) values('308','58','3','0','0','0','-5601.64','-541.38','392.42','0.5');
insert into `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) values('308','60','3','0','0','0','-5605.96','-544.45','392.43','0.9');
insert into `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) values('308','62','0','0','0','2000000079','0','0','0','0');

UPDATE `creature_template` SET `ScriptName`='mob_scarlet_courier' WHERE `entry`='29076';

UPDATE `creature_template` SET `ScriptName`='mob_scarlet_courier' WHERE `entry`='29076';

UPDATE `creature_template` SET `ScriptName`='npc_koltira_deathweaver' WHERE `entry`='28912';
UPDATE `creature_template` SET `ScriptName`='mob_high_inquisitor_valroth' WHERE `entry`='29001';


DELETE FROM script_waypoint WHERE entry=28912;
INSERT INTO script_waypoint VALUES
   (28912, 0, 1653.518, -6038.374, 127.585, 1000, 'Jump off'),
   (28912, 1, 1653.978, -6034.614, 127.585, 5000, 'To Box'),
   (28912, 2, 1653.854, -6034.726, 127.585, 0, 'Equip'),
   (28912, 3, 1652.297, -6035.671, 127.585, 1000, 'Recover'),
   (28912, 4, 1639.762, -6046.343, 127.948, 0, 'Escape'),
   (28912, 5, 1640.963, -6028.119, 134.740, 0, ''),
   (28912, 6, 1625.805, -6029.197, 134.740, 0, ''),
   (28912, 7, 1626.845, -6015.085, 134.740, 0, ''),
   (28912, 8, 1649.150, -6016.975, 133.240, 0, ''),
   (28912, 9, 1653.063, -5974.844, 132.652, 5000, 'Mount'),
   (28912, 10, 1654.747, -5926.424, 121.191, 0, 'Disappear');
   
DELETE FROM `spell_proc_event` WHERE `entry` = 54821;
INSERT INTO `spell_proc_event` ( `entry` , `SpellFamilyName` , `SpellFamilyMask0` , `procFlags`) VALUES
(54821, 7, 0x00001000, 0x00000010); -- Glyph of Rake

DELETE FROM `creature_questrelation` WHERE `quest` = 12754; 
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (28914, 12754); 
DELETE FROM `creature_involvedrelation` WHERE `quest` = 12754; 
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (28914, 12754); 
DELETE FROM `creature_questrelation` WHERE `quest` = 12755; 
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (28914, 12755);
DELETE FROM `creature_involvedrelation` WHERE `quest` = 12755; 
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (29077, 12755);
DELETE FROM `creature_questrelation` WHERE `quest` = 12756; 
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (29077, 12756);
DELETE FROM `creature_involvedrelation` WHERE `quest` = 12756; 
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (28914, 12756); 
DELETE FROM `creature_questrelation` WHERE `quest` = 12757; 
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (28914, 12757);

UPDATE `quest_template` SET `PrevQuestId`=12751 WHERE `entry`=12754;

update spell_area set quest_end = 12756 where spell=53081;

ALTER TABLE `channels` DROP `m_ownerGUID`;
DELETE FROM `spell_area` where spell in (40216,42016);

DELETE FROM `spell_linked_spell` WHERE spell_trigger = 40214;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
( 40214, 40216, 2, 'Dragonmaw Illusion'),
( 40214, 42016, 2, 'Dragonmaw Illusion');

update creature_template set spell1=53117 where entry=29104;
update creature_template set spell1=53348,killcredit1=29150 where entry IN (29102,29103);
update creature_template set scriptname="mob_anti_air" where entry in (29102,29103,29104);


DELETE FROM `spell_script_target` WHERE entry IN
(53110);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
(53110, 1, 29102),
(53110, 1, 29103); -- Devour Humanoid
