UPDATE creature_template
  SET mindmg = ROUND(mindmg + attackpower), maxdmg=ROUND(maxdmg+attackpower);

DELETE FROM `spell_threat` WHERE `entry` IN (778,9749,9907,14274,15629,15630,15631,15632,17390,17391,17392,26993,27011);

DELETE FROM `spell_proc_event` WHERE `entry` = 50453;
INSERT INTO `spell_proc_event` (`entry`, `procFlags`, `CustomChance`) VALUES ('50453', '0x00000004', '100');

DELETE FROM `creature_template_addon` WHERE `entry` = 28017;
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES ('28017', '50453 0');

DELETE FROM `spell_proc_event` WHERE `entry` IN (56636,56637,56638); 
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
( 56636, 0x00,   4, 0x00000020, 0x00000000, 0x00000000, 0x00000000, 0x00000000,   0,   0,   6), -- Taste for Blood (Rank 1)
( 56637, 0x00,   4, 0x00000020, 0x00000000, 0x00000000, 0x00000000, 0x00000000,   0,   0,   6), -- Taste for Blood (Rank 2)
( 56638, 0x00,   4, 0x00000020, 0x00000000, 0x00000000, 0x00000000, 0x00000000,   0,   0,   6); -- Taste for Blood (Rank 3) 

DELETE FROM `spell_proc_event` WHERE `entry` = 50453;