-- For Dual-spec
ALTER TABLE characters ADD speccount tinyint(3) NOT NULL DEFAULT 1;
ALTER TABLE characters ADD activespec tinyint(3) NOT NULL DEFAULT 0;

-- Create the talent table
DROP TABLE IF EXISTS `character_talent`;
 
CREATE TABLE `character_talent` (
  `guid` int(11) unsigned NOT NULL,
  `spell` int(11) unsigned NOT NULL,
  `spec` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`,`spec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Create the Glyphs table
DROP TABLE IF EXISTS `character_glyphs`;
 
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

-- Create the spec field for Action Bars
ALTER TABLE character_action ADD spec TINYINT(3) NOT NULL DEFAULT 0 AFTER guid;

-- Reset the players talents for this update
update characters set at_login = 20;