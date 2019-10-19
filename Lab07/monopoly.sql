--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerUnfinishedGame;
DROP TABLE IF EXISTS PlayerFinishedGame;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;


-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY, 
	timeStart timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE PlayerFinishedGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	cash integer
	);

CREATE TABLE PlayerUnfinishedGame (
	gameID integer REFERENCES Game(ID),
	playerID integer REFERENCES Player(ID),
	cash integer,
	position varchar(30) NOT NULL,
	property TEXT []
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerFinishedGame TO PUBLIC;
GRANT SELECT ON PlayerUnfinishedGame TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');
INSERT INTO Game VALUES (4, '2019-08-15 11:05:42');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');
INSERT INTO Player VALUES (4, 'nick@terpstra.com', 'Nick');
INSERT INTO Player VALUES (5, 'jones@lol.edu', 'Jones');

INSERT INTO PlayerFinishedGame VALUES (1, 1, 0.00);
INSERT INTO PlayerFinishedGame VALUES (1, 2, 0.00);
INSERT INTO PlayerFinishedGame VALUES (1, 3, 2350.00);
INSERT INTO PlayerFinishedGame VALUES (2, 1, 1000.00);
INSERT INTO PlayerFinishedGame VALUES (2, 2, 0.00);
INSERT INTO PlayerFinishedGame VALUES (2, 3, 500.00);
INSERT INTO PlayerFinishedGame VALUES (3, 2, 0.00);
INSERT INTO PlayerFinishedGame VALUES (3, 3, 5500.00);

INSERT INTO PlayerUnfinishedGame VALUES (4, 4, 500, 'Baltic Ave', ARRAY [ 'Mediterranean Ave', 'Vermont Ave', 'States Ave', 'New York Ave' ] );
INSERT INTO PlayerUnfinishedGame VALUES (4, 5, 1200, 'Illinois Ave', ARRAY [ 'Pennsylvania Ave', 'Electric Company', 'Reading Railroad', 'Pennsylvania Ave', 'Boardwalk' ] );

SELECT * FROM Game;
SELECT * FROM Player;
SELECT * FROM PlayerFinishedGame;
SELECT * FROM PlayerUnfinishedGame;

SELECT COUNT(*) FROM Game;
SELECT COUNT(*) FROM Player;
SELECT COUNT(*) FROM PlayerFinishedGame;
SELECT COUNT(*) FROM PlayerUnfinishedGame;