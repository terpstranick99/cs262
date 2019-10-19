--This SQL script is Team C's Sensapp SQL Schema
--
--Drop previous versions of the tables if they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS Favorite;
DROP TABLE IF EXISTS History;
DROP TABLE IF EXISTS Activity;
DROP TABLE IF EXISTS Person;

--Create tables
CREATE TABLE Person (
	ID integer PRIMARY KEY
	);

CREATE TABLE Activity (
	ID integer PRIMARY KEY,
	name varchar(30) NOT NULL
	);


CREATE TABLE Favorite (
	personID integer REFERENCES Person(ID),
	activityID integer REFERENCES Activity(ID),
	PRIMARY KEY (personID, activityID)
	);
	
CREATE TABLE History (
	ID integer PRIMARY KEY,
	personID integer REFERENCES Person(ID),
	activityID integer REFERENCES Activity(ID),
	timeStart timestamp,
	timeEnd timestamp,
	satisfaction integer
	);
	
--Allow persons to select data from the tables
GRANT SELECT ON Person TO PUBLIC;
GRANT SELECT ON Activity TO PUBLIC;
GRANT SELECT ON Favorite TO PUBLIC;
GRANT SELECT ON History TO PUBLIC;

--Add sample records
INSERT INTO Person VALUES (1);
INSERT INTO Person VALUES (2);

INSERT INTO Activity VALUES (1, 'Breathe');
INSERT INTO Activity VALUES (2, 'Fidget Cube');

--Person 2 favorites activity 1, Breathe
INSERT INTO Favorite VALUES (2, 1);
--Person 1 favorites activity 1, Breathe
INSERT INTO Favorite VALUES (1, 1);
--Person 1 favorites activity 2, Fidget Cube
INSERT INTO Favorite VALUES (1, 2);

INSERT INTO History VALUES (1, 1, 1, '2019-10-17 19:01:54', '2019-10-17 19:02:32', 5);
INSERT INTO History VALUES (2, 2, 2, '2019-10-18 23:59:01', '2019-10-19 00:05:13', 1);











 