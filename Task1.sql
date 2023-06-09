CREATE DATABASE galaxy;
CREATE TABLE stars(
starsID INT IDENTITY(1,1) PRIMARY KEY,
starsNAME VARCHAR(50) NOT NULL CHECK (LEN(starsNAME) >= 3),
starsMASS DECIMAL(10,2) NOT NULL DEFAULT 0,
starsGRAVITY DECIMAL(20,4) DEFAULT 0,
starsPLANET VARCHAR(30) NULL,
starsCOLOR VARCHAR(15)
);

ALTER TABLE stars
ALTER COLUMN starsNAME VARCHAR(2) NOT NULL;

ALTER TABLE stars
DROP COLUMN starsCOLOR;

ALTER TABLE stars
ALTER COLUMN starsMASS SET DEFAULT 0;


CREATE TABLE planets(
planetsID INT IDENTITY(1,1) PRIMARY KEY,
planetsNAME VARCHAR(40) NOT NULL,
planetsGRAVITY decimal(20,3),
planetshaslifeform tinyint default 0,
planetsPOPULATION INT
);

ALTER TABLE planets
ALTER COLUMN planetsNAME VARCHAR(40) NULL;

ALTER TABLE planets
ADD CONSTRAINT uniq_name UNIQUE (planetsNAME);

ALTER TABLE planets
ALTER COLUMN planetshaslifeform SET DEFAULT false;

ALTER TABLE planets
ADD CONSTRAINT max_population CHECK (planetsPOPULATION <= 50000000000);
