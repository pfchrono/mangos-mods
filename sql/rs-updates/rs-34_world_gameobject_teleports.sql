-- Portal ID = 1327
-- Type will be 10 and data0 = 75000
-- goentry = Gameobject Entry
-- mapid = Map player will go to
-- x_pos = X position player will go to
-- y_pos = Y position player will go to
-- z_pos = Z position player will go to
-- orientation = orientation player will face
-- name = Name of Teleport

DROP TABLE IF EXISTS `gameobject_teleports`;
CREATE TABLE `gameobject_teleports` (
  `goentry` INT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mapid` INT(20) UNSIGNED NOT NULL,
  `x_pos` FLOAT NOT NULL,
  `y_pos` FLOAT NOT NULL,
  `z_pos` FLOAT NOT NULL,
  `orientation` FLOAT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  UNIQUE KEY `EntryUnique` (`goentry`)
) ENGINE=MYISAM DEFAULT CHARSET=latin1 COMMENT='Portal Tele';

REPLACE INTO `gameobject_teleports`
VALUES 
(7500000,609,'2347.629883','2347.629883','426.028992','3.997680','Acherus: The Ebon Hold (Phased)'),
(7500001,609,'2357.977295','-5662.664063','382.258606','0.534065','Acherus: Heart of Acherus (Phased)'),
(7500002,609,'2369.701416','-5721.929199','153.921478','5.364110','Death\'s Breach (Phased)'),
(7500003,0,'2353.530029','-5665.819854','426.028015','5.364110','Acherus: The Ebon Hold'),
(7500004,0,'2460.407227','-5593.413086','367.394226','3.787965','Acherus: Heart of Acherus'),
(7500005,1,'-8534.029297','2008.405884','100.720947','0.126833','Portal to Twisting Nether');

REPLACE INTO `gameobject_template` (`entry`,`type`,`displayId`,`name`,`data0`)
VALUES
(7500000,10,1327,'Acherus: The Ebon Hold (Phased)',75000),
(7500001,10,1327,'Acherus: Heart of Acherus (Phased)',75000),
(7500002,10,1327,'Death\'s Breach (Phased)',75000),
(7500003,10,1327,'Acherus: The Ebon Hold',75000),
(7500004,10,1327,'Acherus: Heart of Acherus',75000),
(7500005,10,1327,'Portal to Twisting Nether',75000); 