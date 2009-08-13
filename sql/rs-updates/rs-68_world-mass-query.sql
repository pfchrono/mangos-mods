INSERT INTO script_texts (entry,content_default,sound,type,language,emote,comment) VALUES
(-1043000,'At last! Naralex can be awakened! Come aid me, brave adventurers!',0,1,0,0,'Disciple SAY_AT_LAST'),
(-1043001,'I must make the necessary preparations before the awakening ritual can begin. You must protect me!',0,0,0,0,'Disciple SAY_MAKE_PREPARATIONS'),
(-1043002,'These caverns were once a temple of promise for regrowth in the Barrens. Now, they are the halls of nightmares.',0,0,0,0,'Disciple SAY_TEMPLE_OF_PROMISE'),
(-1043003,'Come. We must continue. There is much to be done before we can pull Naralex from his nightmare.',0,0,0,0,'Disciple SAY_MUST_CONTINUE'),
(-1043004,'Within this circle of fire I must cast the spell to banish the spirits of the slain Fanglords.',0,0,0,0,'Disciple SAY_BANISH_THE_SPIRITS'),
(-1043005,'The caverns have been purified. To Naralex\'s chamber we go!',0,0,0,0,'Disciple SAY_CAVERNS_PURIFIED'),
(-1043006,'Beyond this corridor, Naralex lies in fitful sleep. Let us go awaken him before it is too late.',0,0,0,0,'Disciple SAY_BEYOND_THIS_CORRIDOR'),
(-1043007,'Protect me brave souls as I delve into this Emerald Dream to rescue Naralex and put an end to this corruption!',0,0,0,0,'Disciple SAY_EMERALD_DREAM'),
(-1043008,'%s begins to perform the awakening ritual on Naralex.',0,2,0,0,'Disciple EMOTE_AWAKENING_RITUAL'),
(-1043009,'%s tosses fitfully in troubled sleep.',0,2,0,0,'Naralex EMOTE_TROUBLED_SLEEP'),
(-1043010,'%s writhes in agony. The Disciple seems to be breaking through.',0,2,0,0,'Naralex EMOTE_WRITHE_IN_AGONY'),
(-1043011,'%s dreams up a horrendous vision. Something stirs beneath the murky waters.',0,2,0,0,'Naralex EMOTE_HORRENDOUS_VISION'),
(-1043012,'This Mutanus the Devourer is a minion from Naralex\'s nightmare no doubt!',0,0,0,0,'Disciple SAY_MUTANUS_THE_DEVOURER'),
(-1043013,'I AM AWAKE, AT LAST!',0,1,0,0,'Naralex SAY_I_AM_AWAKE'),
(-1043014,'At last! Naralex awakes from the nightmare.',0,0,0,0,'Disciple SAY_NARALEX_AWAKES'),
(-1043015,'Ah, to be pulled from the dreaded nightmare! I thank you, my loyal Disciple, along with your brave companions.',0,0,0,0,'Naralex SAY_THANK_YOU'),
(-1043016,'We must go and gather with the other Disciples. There is much work to be done before I can make another attempt to restore the Barrens. Farewell, brave souls!',0,0,0,0,'Naralex SAY_FAREWELL'),
(-1043017,'Attacked! Help get this $N off of me!',0,0,0,0,'Disciple SAY_ATTACKED');

INSERT INTO creature_ai_scripts (creature_id,event_type,event_chance,event_flags,action1_type,action1_param1,action1_param2,comment) VALUES
(3669,6,100,6,34,1,3,'Lord Cobrahn - Set Inst Data on Death'),
(3670,6,100,6,34,2,3,'Lord Pythas - Set Inst Data on Death'),
(3671,6,100,6,34,3,3,'Lady Anacondra - Set Inst Data on Death'),
(3673,6,100,6,34,4,3,'Lord Serpentis - Set Inst Data on Death'),
(3654,6,100,6,34,9,3,'Mutanus the Devourer - Set Inst Data on Death');

DELETE FROM script_waypoint WHERE entry=3678;
INSERT INTO script_waypoint VALUES
(3678, 0, -120.864, 132.825, -79.2972, 5000, 'TYPE_NARALEX_EVENT'),
(3678, 1, -109.944, 155.417, -80.4659, 0, ''),
(3678, 2, -106.104, 198.456, -80.5970, 0, ''),
(3678, 3, -110.246, 214.763, -85.6669, 0, ''),
(3678, 4, -105.609, 236.184, -92.1732, 0, 'TYPE_NARALEX_PART1'),
(3678, 5, -93.5297, 227.956, -90.7522, 0, ''),
(3678, 6, -85.3155, 226.976, -93.1286, 0, ''),
(3678, 7, -62.1510, 206.673, -93.5510, 0, ''),
(3678, 8, -45.0534, 205.580, -96.2435, 0, ''),
(3678, 9, -31.1235, 234.225, -94.0841, 0, ''),
(3678, 10, -49.2158, 269.141, -92.8442, 0, ''),
(3678, 11, -54.1220, 274.717, -92.8442, 31000, 'TYPE_NARALEX_PART2'),
(3678, 12, -58.9650, 282.274, -92.5380, 0, ''),
(3678, 13, -38.3566, 306.239, -90.0192, 0, ''),
(3678, 14, -28.8928, 312.842, -89.2155, 0, ''),
(3678, 15, -1.58198, 296.127, -85.5984, 0, ''),
(3678, 16, 9.89992, 272.008, -85.7759, 0, ''),
(3678, 17, 26.8162, 259.218, -87.3938, 0, ''),
(3678, 18, 49.1166, 227.259, -88.3379, 0, ''),
(3678, 19, 54.4171, 209.316, -90.0000, 1500, 'SAY_BEYOND_THIS_CORRIDOR'),
(3678, 20, 71.0380, 205.404, -93.0422, 0, ''),
(3678, 21, 81.5941, 212.832, -93.0154, 0, ''),
(3678, 22, 94.3376, 236.933, -95.8261, 0, ''),
(3678, 23, 114.619, 235.908, -96.0495, 0, ''),
(3678, 24, 114.777, 237.155, -96.0304, 2500, 'NARALEX_EVENT_FINISHED');

UPDATE creature_template SET ScriptName = 'npc_disciple_of_naralex' WHERE entry = 3678;
UPDATE instance_template SET script = 'instance_wailing_caverns' WHERE map = 43;

DELETE FROM `command` WHERE `name` = 'reload autobroadcast';
INSERT INTO `command` (`name`, `security`, `help`) VALUES ('reload autobroadcast', 3, 'Syntax: .reload autobroadcast\nReload autobroadcast table.');

UPDATE `creature_template` SET `ScriptName` = 'npc_skywing' WHERE `entry` = 22424;
 
replace into `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) values('22424','0','-3605.719971','4175.580078','-0.031817','0','START_SKYWING');
replace into `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) values('22424','1','-3602.311279','4253.213867','0.562436','0','');
replace into `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) values('22424','2','-3529.151367','4263.524414','-7.871151','0','');
replace into `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) values('22424','3','-3448.130371','4257.990723','-11.626289','0','');
replace into `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) values('22424','4','-3377.783936','4209.064941','-9.476727','0','');
replace into `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) values('22424','5','-3378.211426','4154.628418','0.366330','0','');
replace into `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) values('22424','6','-3376.920166','4085.501709','14.178538','0','');
replace into `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) values('22424','7','-3399.274658','4055.948975','18.603474','0','');
replace into `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) values('22424','8','-3432.678223','4054.069824','29.588032','10000','');

UPDATE `creature_template` SET `ScriptName` = 'npc_lightwell' WHERE `entry` IN (31883, 31893, 31894, 31895, 31896, 31897);

REPLACE INTO `npc_spellclick_spells` (npc_entry, spell_id, quest_start, quest_start_active, quest_end, cast_flags, quest_status) VALUES
(31883, 60123, 0, 0, 0, 2, 0),
(31893, 60123, 0, 0, 0, 2, 0),
(31894, 60123, 0, 0, 0, 2, 0),
(31895, 60123, 0, 0, 0, 2, 0),
(31896, 60123, 0, 0, 0, 2, 0),
(31897, 60123, 0, 0, 0, 2, 0);

REPLACE INTO `spell_bonus_data` (entry, direct_bonus, dot_bonus, ap_bonus, ap_dot_bonus, comments) VALUES
(7001, -1, 0.3333, -1, -1, 'Priest - Lightwell Renew Rank 1'),
(27873, -1, 0.3333, -1, -1, 'Priest - Lightwell Renew Rank 2'),
(27874, -1, 0.3333, -1, -1, 'Priest - Lightwell Renew Rank 3'),
(28276, -1, 0.3333, -1, -1, 'Priest - Lightwell Renew Rank 4'),
(48084, -1, 0.3333, -1, -1, 'Priest - Lightwell Renew Rank 5'),
(48085, -1, 0.3333, -1, -1, 'Priest - Lightwell Renew Rank 6');

REPLACE INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(-59907,     7, 0, 'Lightwell Charges - Suicide');

DELETE FROM `script_texts` WHERE `entry` IN (-1602018,-1602019,-1602020,-1602021,-1602022,-1602023,-1602024,-1602025,-1602026,-1602027,-1602028,-1602029,-1602030,-1602031);
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(-1602018,'What hope is there for you? None!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14162,1,0,0,'loken SAY_AGGRO0'),
(-1602019,'I have witnessed the rise and fall of empires. The birth and extinction of entire species. Over countless millennia the foolishness of mortals has remained beyond a constant. Your presence here confirms this.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14160,1,0,0,'loken SAY_INTRO_1'),
(-1602020,'My master has shown me the future, and you have no place in it. Azeroth will be reborn in darkness. Yogg-Saron shall be released! The Pantheon shall fall!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14162,1,0,0,'loken SAY_INTRO_2'),
(-1602021,'Only mortal...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14166,1,0,0,'loken SAY_SLAY_1'),
(-1602022,'I... am... FOREVER!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14167,1,0,0,'loken SAY_SLAY_2'),
(-1602023,'What little time you had, you wasted!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14168,1,0,0,'loken SAY_SLAY_3'),
(-1602024,'My death... heralds the end of this world.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14172,1,0,0,'loken SAY_DEATH'),
(-1602025,'You cannot hide from fate!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14163,1,0,0,'loken SAY_NOVA_1'),
(-1602026,'Come closer. I will make it quick.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14164,1,0,0,'loken SAY_NOVA_2'),
(-1602027,'Your flesh cannot hold out for long.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14165,1,0,0,'loken SAY_NOVA_3'),
(-1602028,'You stare blindly into the abyss!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14169,1,0,0,'loken SAY_75HEALTH'),
(-1602029,'Your ignorance is profound. Can you not see where this path leads?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14170,1,0,0,'loken SAY_50HEALTH'),
(-1602030,'You cross the precipice of oblivion!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14171,1,0,0,'loken SAY_25HEALTH'),
(-1602031,'%s begins to cast Lightning Nova!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,3,0,0,'loken EMOTE_NOVA');

UPDATE `creature_template` SET `ScriptName`='boss_loken' WHERE `entry`=28923;

UPDATE script_texts SET entry=-1609080 WHERE entry=-1609017;
UPDATE script_texts SET entry=-1609081 WHERE entry=-1609018;
UPDATE script_texts SET entry=-1609082 WHERE entry=-1609019;
UPDATE script_texts SET entry=-1609083 WHERE entry=-1609020;
UPDATE script_texts SET entry=-1609084 WHERE entry=-1609021;
UPDATE script_texts SET entry=-1609085 WHERE entry=-1609022;

DELETE FROM script_texts WHERE entry IN (-1609086,-1609087,-1609088);
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(-1609086,'The Lich King will see his true champion on this day!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,0,0,0,'dk_initiate SAY_DUEL_G'),
(-1609087,'You\'re going down!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,0,0,0,'dk_initiate SAY_DUEL_H'),
(-1609088,'You don\'t stand a chance, $n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,0,0,0,'dk_initiate SAY_DUEL_I');

UPDATE `creature_template` SET `ScriptName`='npc_slim' WHERE `entry`=19679;
UPDATE `creature_template` SET `ScriptName`='npc_taxi' WHERE `entry` = 23704;

UPDATE `creature_template` SET `ScriptName` = 'npc_skywing' WHERE `entry` = 22424;

UPDATE `gameobject_template` SET `ScriptName` = 'containment_sphere' WHERE `entry` IN (188527, 188528, 188526);

UPDATE `creature_template` SET `scriptname`='boss_razorscale' WHERE `entry`=33186;
UPDATE `creature_template` SET `scriptname`='boss_flame_leviathan' WHERE `entry`=33113;

DELETE FROM `spell_bonus_data` WHERE `entry` IN(53352);
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(53352, -1, -1, 0.14, -1, 'Hunter - Explosive Shot (triggered)');

DELETE FROM `script_texts` WHERE `entry` between -1602042 AND -1602032;
DELETE FROM `script_texts` WHERE `entry` between -1602017 AND -1602011;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(-1602011,'You wish to confront the master? You must weather the storm!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14453,1,0,0,'ionar SAY_AGGRO'),
(-1602012,'Shocking ... I know!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14456,1,0,0,'ionar SAY_SLAY_1'),
(-1602013,'You atempt the unpossible.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14457,1,0,0,'ionar SAY_SLAY_2'),
(-1602014,'Your spark of light is ... extinguish.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14458,1,0,0,'ionar SAY_SLAY_3'),
(-1602015,'Master... you have guests.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14459,1,0,0,'ionar SAY_DEATH'),
(-1602016,'The slightest spark shall be your undoing.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14454,1,0,0,'ionar SAY_SPLIT_1'),
(-1602017,'No one is safe!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,14455,1,0,0,'ionar SAY_SPLIT_2'),
(-1602032,'It is you who have destroyed my children? You... shall... pay!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13960,1,0,0,'volkhan SAY_AGGRO'),
(-1602033,'The armies of iron will conquer all!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13965, 1,0,0,'volkhan SAY_SLAY_1'),
(-1602034,'Ha, pathetic!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13966,1,0,0,'volkhan SAY_SLAY_2'),
(-1602035,'You have cost me too much work!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13967,1,0,0,'volkhan SAY_SLAY_3'),
(-1602036,'The master was right... to be concerned.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13968,1,0,0,'volkhan SAY_DEATH'),
(-1602037,'I will crush you beneath my boots!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13963,1,0,0,'volkhan SAY_STOMP_1'),
(-1602038,'All my work... undone!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13964,1,0,0,'volkhan SAY_STOMP_2'),
(-1602039,'Life from the lifelessness... death for you.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13961,1,0,0,'volkhan SAY_FORGE_1'),
(-1602040,'Nothing is wasted in the process. You will see....', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,13962,1,0,0,'volkhan SAY_FORGE_2'),
(-1602041,'runs to his anvil!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,3,0,0,'volkhan EMOTE_TO_ANVIL'),
(-1602042,'prepares to shatter his Brittle Golems!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,3,0,0,'volkhan EMOTE_SHATTER');

UPDATE creature_template SET ScriptName='boss_volkhan' WHERE entry=28587;
UPDATE creature_template SET ScriptName='mob_molten_golem' WHERE entry=28695;
UPDATE creature_template SET ScriptName='npc_volkhan_anvil' WHERE entry=28823;
UPDATE creature_template SET ScriptName='boss_ionar' WHERE entry=28546;
UPDATE creature_template SET ScriptName='mob_spark_of_ionar' WHERE entry=28926;

DELETE FROM script_waypoint WHERE entry=11856;
INSERT INTO script_waypoint VALUES
(11856, 0, 113.91, -350.13, 4.55, 0, ''),
(11856, 1, 109.54, -350.08, 3.74, 0, ''),
(11856, 2, 106.95, -353.40, 3.60, 0, ''),
(11856, 3, 100.28, -338.89, 2.97, 0, ''),
(11856, 4, 110.11, -320.26, 3.47, 0, ''),
(11856, 5, 109.78, -287.80, 5.30, 0, ''),
(11856, 6, 105.02, -269.71, 4.71, 0, ''),
(11856, 7, 86.71, -251.81, 5.34, 0, ''),
(11856, 8, 64.10, -246.38, 5.91, 0, ''),
(11856, 9, -2.55, -243.58, 6.3, 0, ''),
(11856, 10, -27.78, -267.53, -1.08, 0, ''),
(11856, 11, -31.27, -283.54, -4.36, 0, ''),
(11856, 12, -28.96, -322.44, -9.19, 0, ''),
(11856, 13, -35.63, -360.03, -16.59, 0, ''),
(11856, 14, -58.30, -412.26, -30.60, 0, ''),
(11856, 15, -58.88, -474.17, -44.54, 0, ''),
(11856, 16, -45.92, -496.57, -46.26, 5000, 'AMBUSH'),
(11856, 17, -40.25, -510.07, -46.05, 0, ''),
(11856, 18, -38.88, -520.72, -46.06, 5000, 'END');

DELETE FROM script_waypoint WHERE entry=28912;
INSERT INTO script_waypoint VALUES
(28912, 0, 1653.518, -6038.374, 127.585, 0, 'Jump off'),
(28912, 1, 1653.978, -6034.614, 127.585, 5000, 'To Box'),
(28912, 2, 1653.854, -6034.726, 127.585, 500, 'Equip'),
(28912, 3, 1652.297, -6035.671, 127.585, 3000, 'Recover'),
(28912, 4, 1639.762, -6046.343, 127.948, 0, 'Escape'),
(28912, 5, 1640.963, -6028.119, 134.740, 0, ''),
(28912, 6, 1625.805, -6029.197, 134.740, 0, ''),
(28912, 7, 1626.845, -6015.085, 134.740, 0, ''),
(28912, 8, 1649.150, -6016.975, 133.240, 0, ''),
(28912, 9, 1653.063, -5974.844, 132.652, 5000, 'Mount'),
(28912, 10, 1654.747, -5926.424, 121.191, 0, 'Disappear');

UPDATE creature_template SET ScriptName='npc_koltira_deathweaver' WHERE entry=28912;

DELETE FROM `script_texts` WHERE `entry` between -1609098 AND -1609089;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(-1609089, 'I\'ll need to get my runeblade and armor... Just need a little more time.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,0,0,399,'koltira SAY_BREAKOUT1'),
(-1609090, 'I\'m still weak, but I think I can get an anti-magic barrier up. Stay inside it or you\'ll be destroyed by their spells.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,0,0,0,'koltira SAY_BREAKOUT2'),
(-1609091, 'Maintaining this barrier will require all of my concentration. Kill them all!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,0,0,16,'koltira SAY_BREAKOUT3'),
(-1609092, 'There are more coming. Defend yourself! Don\'t fall out of the anti-magic field! They\'ll tear you apart without its protection!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,0,0,0,'koltira SAY_BREAKOUT4'),
(-1609093, 'I can\'t keep barrier up much longer... Where is that coward?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,0,0,0,'koltira SAY_BREAKOUT5'),
(-1609094, 'The High Inquisitor comes! Be ready, death knight! Do not let him draw you out of the protective bounds of my anti-magic field! Kill him and take his head!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,0,0,0,'koltira SAY_BREAKOUT6'),
(-1609095, 'Stay in the anti-magic field! Make them come to you!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,0,0,0,'koltira SAY_BREAKOUT7'),
(-1609096, 'The death of the High Inquisitor of New Avalon will not go unnoticed. You need to get out of here at once! Go, before more of them show up. I\'ll be fine on my own.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,0,0,0,'koltira SAY_BREAKOUT8'),
(-1609097, 'I\'ll draw their fire, you make your escape behind me.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,0,0,0,'koltira SAY_BREAKOUT9'),
(-1609098, 'Your High Inquisitor is nothing more than a pile of meat, Crusaders! There are none beyond the grasp of the Scourge!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,1,0,0,'koltira SAY_BREAKOUT10');

UPDATE creature_template SET ScriptName='' WHERE entry=13936;

DELETE FROM areatrigger_scripts WHERE entry=3066;
INSERT INTO areatrigger_scripts VALUES (3066,'at_ravenholdt');

DELETE FROM script_waypoint WHERE entry=16812;
INSERT INTO script_waypoint VALUES
(16812, 0, -10868.260, -1779.836, 90.476, 2500, 'Open door, begin walking'),
(16812, 1, -10875.585, -1779.581, 90.478, 0, ''),
(16812, 2, -10887.447, -1779.258, 90.476, 0, ''),
(16812, 3, -10894.592, -1780.668, 90.476, 0, ''),
(16812, 4, -10895.015, -1782.036, 90.476, 2500, 'Begin Speech after this'),
(16812, 5, -10894.592, -1780.668, 90.476, 0, 'Resume walking (back to spawn point now) after speech'),
(16812, 6, -10887.447, -1779.258, 90.476, 0, ''),
(16812, 7, -10875.585, -1779.581, 90.478, 0, ''),
(16812, 8, -10868.260, -1779.836, 90.476, 5000, 'close door'),
(16812, 9, -10866.799, -1780.958, 90.470, 2000, 'Summon mobs, open curtains');
