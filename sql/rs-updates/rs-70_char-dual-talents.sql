START TRANSACTION; /* Transaction is used due to the destructive nature of these queries, if anything fails the transaction should abort, and the updates should be applied manually. */

CREATE TABLE `character_glyphs` (
  `guid` int(11) unsigned NOT NULL,
  `spec` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `glyph1` int(11) unsigned NOT NULL DEFAULT '0',
  `glyph2` int(11) unsigned DEFAULT '0',
  `glyph3` int(11) unsigned DEFAULT '0',
  `glyph4` int(11) unsigned DEFAULT '0',
  `glyph5` int(11) unsigned DEFAULT '0',
  `glyph6` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`guid`,`spec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `character_talent` (
  `guid` int(11) unsigned NOT NULL,
  `spell` int(11) unsigned NOT NULL,
  `spec` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`,`spec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* The below DELETE query should remove all known talents from `character_spell`, talents gathered by rockzOr of getmangos.com. This update should (probably) only be run once, on your characters database before enabling Dual Spec.. */
UPDATE characters SET at_login = 20; -- Lets flag all chars to reset talents then run the cleanup for talent spells bellow
DELETE FROM `character_spell` WHERE `spell` IN (12505,12522,12523,12524,12525,12526,13018,13019,13020,13021,13031,13032,13033,17311,17312,17313,17314,17347,17348,18807,18809,18867,18868,18869,18870,18871,18937,18938,19238,19240,19241,19242,19243,20900,20901,20902,20903,20904,20909,20910,20929,20930,21551,21552,21553,24132,24133,24974,24975,24976,24977,25248,25387,25437,25899,26864,27013,27065,27067,27068,27132,27133,27134,27174,27263,27265,27870,27871,28275,30016,30022,30330,30404,30405,30413,30414,30546,32593,32594,32699,32700,33041,33042,33043,33072,33405,33891,33933,33938,33982,33983,33986,33987,34411,34412,34413,34863,34864,34865,34866,34916,34917,42890,42891,42944,42945,42949,42950,43038,43039,44780,44781,47485,47486,47497,47498,47826,47827,47841,47843,47846,47847,48086,48087,48088,48089,48155,48156,48159,48160,48172,48173,48468,48563,48564,48565,48566,48660,48663,48666,48824,48825,48826,48827,48998,48999,49011,49012,49049,49050,49283,49284,51325,51326,51327,51328,51376,51378,51379,51409,51410,51411,51416,51417,51418,51419,53005,53006,53007,53199,53200,53201,53223,53225,53226,53248,53249,53251,55258,55259,55260,55261,55262,55265,55268,55270,55271,55359,55360,57720,57721,57722,59092,59156,59158,59159,59161,59163,59164,59170,59171,59172,60051,61299,61300,61301,61384,63668,63669,63670,63671,63672,66052,66053);ALTER TABLE `characters` ADD `speccount` tinyint(3) unsigned NOT NULL default 1 AFTER `arena_pending_points`;
ALTER TABLE `characters` ADD `speccount` tinyint(3) unsigned NOT NULL default 1 AFTER `arena_pending_points`;
ALTER TABLE `characters` ADD `activespec` tinyint(3) unsigned NOT NULL default 0 AFTER `speccount`;

ALTER TABLE `character_action` RENAME `character_action_old`;
CREATE TABLE `character_action` (
  `guid` int(11) unsigned NOT NULL default '0',
  `spec` tinyint(3) unsigned NOT NULL default '0',
  `button` tinyint(3) unsigned NOT NULL default '0',
  `action` int(11) unsigned NOT NULL default '0',
  `type` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`,`spec`,`button`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
INSERT INTO `character_action` (`guid`,`button`,`action`,`type`) SELECT `guid`,`button`,`action`,`type` FROM `character_action_old`;
DROP TABLE `character_action_old`;

COMMIT;