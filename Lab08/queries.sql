-- N. Henry Terpstra, CS262, Lab08
-- This SQL Script queries the database from monopoly.sql
--

SELECT * FROM Game;
SELECT * FROM Player;
SELECT * FROM PlayerFinishedGame;
SELECT * FROM PlayerUnfinishedGame;

SELECT COUNT(*) FROM Game;
SELECT COUNT(*) FROM Player;
SELECT COUNT(*) FROM PlayerFinishedGame;
SELECT COUNT(*) FROM PlayerUnfinishedGame;

-- 8.1 A
SELECT * FROM Game ORDER BY timeStart DESC;

-- 8.1 B
SELECT * FROM Game WHERE timeStart >= (NOW() - interval '7 days');

-- 8.1 C
SELECT * FROM Player WHERE name IS NOT NULL;

-- 8.1 D
SELECT PlayerFinishedGame.playerID, PlayerFinishedGame.playerID 
FROM PlayerFinishedGame, PlayerUnfinishedGame 
WHERE cash > 2000;

-- 8.1 E
SELECT name FROM Player WHERE emailAddress LIKE '%gmail%';

-- 8.2 A
SELECT PlayerFinishedGame.score, PlayerUnfinishedGame.score FROM PlayerFinishedGame, PlayerUnfinishedGame, 
WHERE Player.name = 