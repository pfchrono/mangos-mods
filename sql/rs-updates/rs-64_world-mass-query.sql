-- TC2 Rev-4762
-- ALTER TABLE db_version CHANGE COLUMN required_8254_01_mangos_spell_proc_event required_8294_01_mangos_playercreateinfo_action bit;

-- Remove Double attack icons for Night Elf Warrior
DELETE FROM playercreateinfo_action WHERE race=4 AND class=1 AND button=73;
-- Move Heroic Strike to correct location for Night Elf Warrior
DELETE FROM playercreateinfo_action WHERE race=4 AND class=1 AND button=74;
INSERT INTO playercreateinfo_action VALUES (4,1,73,78,0);
-- Moved Shadowmeld to correct location for Night Elf Warrior
DELETE FROM playercreateinfo_action WHERE race=4 AND class=1 AND button IN (82,83);
INSERT INTO playercreateinfo_action VALUES (4,1,82,58984,0);
-- Add correct Tough Jerky location for Night elf Warrior
DELETE FROM playercreateinfo_action WHERE race=4 AND class=1 AND button=84;
INSERT INTO playercreateinfo_action VALUES (4,1,83,117,128);

-- Moved Shadowmeld to correct location for Night Elf Druid
DELETE FROM playercreateinfo_action WHERE race=4 AND class=11 AND button IN (3,9);
INSERT INTO playercreateinfo_action VALUES (4,11,9,58984,0);

-- Moved Shadowmeld to correct location for Night Elf Rogue
DELETE FROM playercreateinfo_action WHERE race=4 AND class=4 AND button IN (4,10);
INSERT INTO playercreateinfo_action VALUES (4,4,10,58984,0);
-- Add Shadowmeld For Night Elf Rogue Shadow form bar
DELETE FROM playercreateinfo_action WHERE race=4 AND class=4 AND button = 82;
INSERT INTO playercreateinfo_action VALUES (4,4,82,58984,0);

-- Replace Tough Jerky for Gnome Death Knight Action Bar
DELETE FROM playercreateinfo_action WHERE race=7 AND class=6 AND button IN (11,83);
INSERT INTO playercreateinfo_action VALUES
(7,6,11,41751,128),
(7,6,83,41751,128);

-- Moved Gift of Naaru to correct location for Draenei Death Knight
DELETE FROM playercreateinfo_action WHERE race=11 AND class=6 AND button IN (6,10);
INSERT INTO playercreateinfo_action VALUES (11,6,10,59545,0);
-- Add Black Mushroom to Draenei Death Knight Action Bar
DELETE FROM playercreateinfo_action WHERE race=11 AND class=6 AND button IN (11);
INSERT INTO playercreateinfo_action VALUES
(11,6,11,41751,128);

-- Moved Blood Fury to correct action bar location for Orc Hunter
DELETE FROM playercreateinfo_action WHERE race=2 AND class=3 AND button IN (4,9);
INSERT INTO playercreateinfo_action VALUES (2,3,9,20572,0);

-- Moved Berserking to correct action bar location for Non-Heroic Troll classes 
DELETE FROM playercreateinfo_action WHERE race=8 AND class IN (3,5,7,8) AND button IN (3,76);
INSERT INTO playercreateinfo_action VALUES
(8,3,3,20554,0),
(8,5,3,20554,0),
(8,7,3,20554,0),
(8,8,3,20554,0);

-- Updated and moved Berserking skill for Troll Rogue
DELETE FROM playercreateinfo_action WHERE race=8 AND class=4 AND button IN (4,76);
INSERT INTO playercreateinfo_action VALUES (8,4,4,26297,0);

-- TC2 Rev-4783
UPDATE creature_template set ScriptName = 'boss_bjarngrim' where entry =28586;
UPDATE creature_template set ScriptName = 'mob_stormforged_lieutenant' where entry =29240;
DELETE FROM script_texts  where entry IN (-1602001,-1602000,-1602002,-1602003,-1602004,-1602005,-1602006,-1602007,-1602008,-1602009,-1602010);
INSERT INTO script_texts (entry,content_default,sound,type,language,emote,comment) VALUES
(-1602000,'I am the greatest of my father\'s sons! Your end has come!',14149,1,0,0,'bjarngrim SAY_AGGRO'),
(-1602001,'So ends your curse!',14153,1,0,0,'bjarngrim SAY_SLAY_1'),
(-1602002,'Flesh... is... weak!',14154,1,0,0,'bjarngrim SAY_SLAY_2'),
(-1602003,'...',14155,1,0,0,'bjarngrim SAY_SLAY_3'),
(-1602004,'How can it be...? Flesh is not... stronger!',14156,1,0,0,'bjarngrim SAY_DEATH'),
(-1602005,'Defend yourself, for all the good it will do!',14151,1,0,0,'bjarngrim SAY_BATTLE_STANCE'),
(-1602006,'%s switches to Battle Stance!',0,3,0,0,'bjarngrim EMOTE_BATTLE_STANCE'),
(-1602007,'GRAAAAAH! Behold the fury of iron and steel!',14152,1,0,0,'bjarngrim SAY_BERSEKER_STANCE'),
(-1602008,'%s switches to Berserker Stance!',0,3,0,0,'bjarngrim EMOTE_BERSEKER_STANCE'),
(-1602009,'Give me your worst!',14150,1,0,0,'bjarngrim SAY_DEFENSIVE_STANCE'),
(-1602010,'%s switches to Defensive Stance!',0,3,0,0,'bjarngrim EMOTE_DEFENSIVE_STANCE');

-- TC2 Rev-4787
UPDATE `script_texts` SET `entry`=`entry`+20 WHERE `entry` IN(-1574001,-1574002,-1574003,-1574004);
UPDATE `script_texts` SET `entry`=-1574001 WHERE `entry`=-1574023;
UPDATE `script_texts` SET `entry`=-1574002 WHERE `entry`=-1574024;
UPDATE `script_texts` SET `entry`=-1574003 WHERE `entry`=-1574021;
UPDATE `script_texts` SET `entry`=-1574004 WHERE `entry`=-1574022;

INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(-1574005,'I\'ll paint my face with your blood!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13207,1,0,0,'ingvar SAY_AGGRO_FIRST'),
(-1574006,'I return! A second chance to carve out your skull!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13209,1,0,0,'ingvar SAY_AGGRO_SECOND'),
(-1574007,'My life for the... death god!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13213,1,0,0,'ingvar SAY_DEATH_FIRST'),
(-1574008,'No! I can do... better! I can...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13211,1,0,0,'ingvar SAY_DEATH_SECOND'),
(-1574009,'Mjul orm agn gjor!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13212,1,0,0,'ingvar SAY_KILL_FIRST'),
(-1574010,'I am a warrior born!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13214,1,0,0,'ingvar SAY_KILL_SECOND'),
(-1574011,'Dalronn! See if you can muster the nerve to join my attack!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13229,1,0,0,'skarvald YELL_SKARVALD_AGGRO'),
(-1574012,'Not... over... yet.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13230,1,0,0,'skarvald YELL_SKARVALD_DAL_DIED'),
(-1574013,'A warrior\'s death.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13231,1,0,0,'skarvald YELL_SKARVALD_SKA_DIEDFIRST'),
(-1574014,'???', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13232,1,0,0,'skarvald YELL_SKARVALD_KILL'),
(-1574015,'Pagh! What sort of necromancer lets death stop him? I knew you were worthless!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13233,1,0,0,'skarvald YELL_SKARVALD_DAL_DIEDFIRST'),
(-1574016,'By all means, don\'t assess the situation, you halfwit! Just jump into the fray!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13199,1,0,0,'dalronn YELL_DALRONN_AGGRO'),
(-1574017,'See... you... soon.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13200,1,0,0,'dalronn YELL_DALRONN_SKA_DIED'),
(-1574018,'There\'s no... greater... glory.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13201,1,0,0,'dalronn YELL_DALRONN_DAL_DIEDFIRST'),
(-1574019,'You may serve me yet.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13202,1,0,0,'dalronn YELL_DALRONN_KILL'),
(-1574020,'Skarvald, you incompetent slug! Return and make yourself useful!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13203,1,0,0,'dalronn YELL_DALRONN_SKA_DIEDFIRST');

-- TC2 Rev-4793
UPDATE item_template SET ScriptName='' WHERE entry=34368;
UPDATE item_template SET ScriptName='' WHERE entry=31129;
UPDATE item_template SET ScriptName='' WHERE entry=44222;
UPDATE item_template SET ScriptName='' WHERE entry=22473;
UPDATE item_template SET ScriptName='' WHERE entry IN (9606,9618,9619,9620,9621);
UPDATE item_template SET ScriptName='' WHERE entry=30656;
UPDATE item_template SET ScriptName='' WHERE entry=34255;
UPDATE item_template SET ScriptName='' WHERE entry=32825;
UPDATE item_template SET ScriptName='' WHERE entry=32321;
UPDATE item_template SET ScriptName='' WHERE entry IN (15908,15911,15913,15914,15915,15916,15917,15919,15920,15921,15922,15923,23697,23702,23703,23896,23897,23898);
UPDATE item_template SET ScriptName='' WHERE entry=8149;
UPDATE item_template SET ScriptName='' WHERE entry=30259;
UPDATE item_template SET ScriptName='' WHERE entry=10699;
UPDATE item_template SET ScriptName='' WHERE entry=31463;
UPDATE item_template SET ScriptName='' WHERE entry=22962;
UPDATE item_template SET ScriptName='' WHERE entry=28132;

-- TC2 Rev-4795
INSERT INTO creature_template (entry, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8) VALUES
(29987, 55645, 0, 0, 0, 0, 0, 0, 27892), # Unrelenting Trainee (H)
(29985, 27825, 0, 0, 0, 0, 0, 0, 27928), # Unrelenting Death Knight (H)
(29986, 55638, 55608, 0, 0, 0, 0, 0, 27935) # Unrelenting Rider (H)
ON DUPLICATE KEY UPDATE
spell1 = VALUES(spell1),
spell2 = VALUES(spell2),
spell3 = VALUES(spell3),
spell4 = VALUES(spell4),
spell5 = VALUES(spell5),
spell6 = VALUES(spell6),
spell7 = VALUES(spell7),
spell8 = VALUES(spell8);