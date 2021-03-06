-- CHARACTERS REPUTATION
-- for that whoe already do the quests before the fix

UPDATE character_reputation AS a, character_reputation AS b
SET a.standing = a.standing + (b.standing/2) 
WHERE a.faction = 1037 AND b.faction = 1068 AND a.guid = b.guid;


UPDATE character_reputation AS a, character_reputation AS b
SET a.standing = a.standing + (b.standing/2) 
WHERE a.faction = 1037 AND b.faction = 1126 AND a.guid = b.guid;


UPDATE character_reputation AS a, character_reputation AS b
SET a.standing = a.standing + (b.standing/2) 
WHERE a.faction = 1037 AND b.faction = 1094 AND a.guid = b.guid;


UPDATE character_reputation AS a, character_reputation AS b
SET a.standing = a.standing + (b.standing/2) 
WHERE a.faction = 1037 AND b.faction = 1050 AND a.guid = b.guid;

-- CHARACTERS REPUTATION
-- for that whoe already do the quests before the fix

UPDATE character_reputation AS a, character_reputation AS b
SET a.standing = a.standing + (b.standing/2) WHERE a.faction = 1052 AND
b.faction = 1067
AND a.guid = b.guid;


UPDATE character_reputation AS a, character_reputation AS b
SET a.standing = a.standing + (b.standing/2) WHERE a.faction = 1052 AND
b.faction = 1124
AND a.guid = b.guid;


UPDATE character_reputation AS a, character_reputation AS b
SET a.standing = a.standing + (b.standing/2) WHERE a.faction = 1052 AND
b.faction = 1064
AND a.guid = b.guid;


UPDATE character_reputation AS a, character_reputation AS b
SET a.standing = a.standing + (b.standing/2) WHERE a.faction = 1052 AND
b.faction = 1085
AND a.guid = b.guid;



-- ALLIANCE VANGUARD
-- QUEST TEMPLATES

UPDATE quest_template SET rewrepfaction5 = 1037, 
rewrepvalue5 = rewrepvalue1/2
WHERE rewrepfaction1 IN (1068,1126,1094,1050)
AND rewrepfaction5 = 0 AND rewrepfaction2 != 1037 AND rewrepfaction3 != 1037 AND rewrepfaction4 != 1037;

UPDATE quest_template SET rewrepfaction5 = 1037, 
rewrepvalue5 = rewrepvalue2/2
WHERE rewrepfaction2 IN (1068,1126,1094,1050)
AND rewrepfaction5 = 0 AND rewrepfaction1 != 1037 AND rewrepfaction3 != 1037 AND rewrepfaction4 != 1037;

-- HORDE EXPEDITION
-- QUEST TEMPLATES

UPDATE quest_template SET rewrepfaction5 = 1052, 
rewrepvalue5 = rewrepvalue1/2
WHERE rewrepfaction1 IN (1067,1124,1064,1085)
AND rewrepfaction5 = 0
AND rewrepfaction2 != 1052
AND rewrepfaction3 != 1052
AND rewrepfaction4 != 1052;

UPDATE quest_template SET rewrepfaction5 = 1052, 
rewrepvalue5 = rewrepvalue2/2
WHERE rewrepfaction2 IN (1067,1124,1064,1085)
AND rewrepfaction5 = 0
AND rewrepfaction1 != 1052
AND rewrepfaction3 != 1052
AND rewrepfaction4 != 1052;