DELETE FROM `command` WHERE `name` IN ('goname','namego', 'die');
insert into `command` (`name`, `security`, `help`) values('kill','3','Syntax: .kill\r\n\r\nKill the selected player. If no player is selected, it will kill you.');
insert into `command` (`name`, `security`, `help`) values('goto','1','Syntax: .goto [$charactername]\r\n\r\nTeleport to the given character. Either specify the character name or click on the character\'s portrait, e.g. when you are in a group. Character can be offline.');
insert into `command` (`name`, `security`, `help`) values('summon','1','Syntax: .summon [$charactername]\r\n\r\nTeleport the given character to you. Character can be offline.');