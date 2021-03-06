DELETE FROM script_texts WHERE entry=-1000431;
INSERT INTO script_texts (entry,content_default,sound,TYPE,LANGUAGE,emote,COMMENT) VALUES
(-1000431,'Okay, okay... gimme a minute to rest now. You gone and beat me up good.',0,0,14,1,'calvin SAY_COMPLETE');

UPDATE script_texts SET LANGUAGE=1, emote=14 WHERE entry=-1000431;

DELETE FROM script_texts WHERE entry IN(-1590000,-1590001,-1590002);
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(-1590000, 'Emalon the Storm Watcher overcharges a Tempest Minion!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, 0, 0, 'emalon EMOTE_OVERCHARGE_TEMPEST_MINION'),
(-1590001, 'A Tempest Minion appears to defend Emalon!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, 0, 0, 'emalon EMOTE_MINION_RESPAWN'),
(-1590002, 'Archavon the Stone Watcher goes into a berserker rage!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 0, 0, 'archavon EMOTE_BERSERK');

INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(-1609017,'No potions!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,0,0,0,'dk_initiate SAY_DUEL_A'),
(-1609018,'Remember this day, $n, for it is the day that you will be thoroughly owned.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,0,0,0,'dk_initiate SAY_DUEL_B'),
(-1609019,'I\'m going to tear your heart out, cupcake!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,0,0,0,'dk_initiate SAY_DUEL_C'),
(-1609020,'Don\'t make me laugh.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,0,0,0,'dk_initiate SAY_DUEL_D'),
(-1609021,'Here come the tears...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,0,0,0,'dk_initiate SAY_DUEL_E'),
(-1609022,'You have challenged death itself!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,0,0,0,0,'dk_initiate SAY_DUEL_F');

CREATE TABLE `autobroadcast` (
`id` INT(11) NOT NULL AUTO_INCREMENT,
`text` LONGTEXT NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

DELETE FROM `trinity_string` WHERE `entry` = 11000;
INSERT INTO `trinity_string` (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8)
VALUES (11000, '|cffffff00[|c00077766Autobroadcast|cffffff00]: |cFFF222FF%s|r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- optional examples
INSERT INTO `autobroadcast` (`id`, `text`) VALUES('1','All Battlegrounds and Arena\'s work on this server.');
INSERT INTO `autobroadcast` (`id`, `text`) VALUES('2','The Auction House on this server is always full, because we use an AH Bot.');
INSERT INTO `autobroadcast` (`id`, `text`) VALUES('3','Welcome to RockStar, if you need help /join world or /join gmhelp');
