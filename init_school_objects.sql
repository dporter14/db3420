/*
Create all the tables for the school specifying their contstraints
*/
\c schooldb

CREATE TABLE IF NOT EXISTS student (
    -- TO DO:
    -- Attributes
    id serial PRIMARY KEY,
    gradelevel smallint CHECK(gradelevel >= 9 AND gradelevel <= 12) DEFAULT 9,
    fname text NOT NULL DEFAULT 'Jane',
    lname text NOT NULL DEFAULT 'Doe',
    DOB date NOT NULL CHECK(dob > '1900-01-01'), 
    sex char(1) NOT NULL CHECK(sex = 'M' OR sex = 'F') DEFAULT 'F',
    street text NOT NULL DEFAULT '',
    city text NOT NULL DEFAULT 'Bakersfield',
    statecode char(2) NOT NULL DEFAULT 'CA',
    zip smallint NOT NULL CHECK(zip > 9999 AND zip < 100000) DEFAULT 99999
    -- constraints
);

CREATE TABLE IF NOT EXISTS building (
    -- TO DO:
    -- Attributes
    id serial PRIMARY KEY,
    bname text NOT NULL DEFAULT 'Building'
);

CREATE TABLE IF NOT EXISTS room (
    -- TO DO:
    -- Attributes
    id serial PRIMARY KEY,
    num smallint NOT NULL CHECK(num > 99 AND num < 1000) DEFAULT 100,
    maxoccupancy smallint NOT NULL CHECK(maxoccupancy > 0) DEFAULT '1',
    roomtype text NOT NULL DEFAULT 'office',
    buildingid integer REFERENCES building ON DELETE CASCADE ON UPDATE CASCADE, --foreign key
    -- constraints
    UNIQUE (buildingid, num)
);

CREATE TABLE IF NOT EXISTS equipment (
    -- TO DO:
    -- Attributes
    id serial PRIMARY KEY,
    eqtype text NOT NULL DEFAULT 'generic device',
    purchaseddate date NOT NULL,
    warrantydate date NOT NULL,
    makemodel text NOT NULL DEFAULT '',
    roomid smallint REFERENCES room ON DELETE SET NULL ON UPDATE CASCADE, --foreign key
    placeddate date NOT NULL,
    -- constraints
    CONSTRAINT ck_dates CHECK(warrantydate > purchaseddate AND placeddate >= purchaseddate)
);

CREATE TABLE IF NOT EXISTS locker (
    -- TO DO:
    -- Attributes
    id serial PRIMARY KEY,
    lcombo char(8) NOT NULL DEFAULT '00-00-00',
    studentid integer REFERENCES student ON DELETE SET NULL ON UPDATE CASCADE, --foreign key
    buildingid integer REFERENCES building ON DELETE CASCADE ON UPDATE CASCADE -- foreign key
    -- constraint
);

CREATE TABLE IF NOT EXISTS department (
    -- TO DO:
    -- Attributes
    id serial PRIMARY KEY,
    dname text NOT NULL DEFAULT 'Department',
    budget numeric(20,2) NOT NULL CHECK(budget >= 0 ) DEFAULT 0,
    roomid integer REFERENCES room ON DELETE SET NULL ON UPDATE CASCADE --foreign key 
    -- constraints
);

CREATE TABLE IF NOT EXISTS employee (
    -- TO DO:
    -- Attributes
    id serial PRIMARY KEY,
    fname text NOT NULL DEFAULT 'John',
    lname text NOT NULL DEFAULT 'Doe',
    ssn integer NOT NULL CHECK(ssn > 99999999 AND ssn < 1000000000) DEFAULT 100000000,
    DOB date NOT NULL,
    sex char(1) NOT NULL CHECK(sex = 'M' OR sex = 'F') DEFAULT 'F',
    street text NOT NULL DEFAULT '',
    city text NOT NULL DEFAULT 'Bakersfield',
    statecode char(2) NOT NULL DEFAULT 'CA',
    zip integer NOT NULL CHECK(zip > 9999 AND zip < 100000) DEFAULT 99999,
    salary money NOT NULL CHECK(salary >= CAST(0 AS money)) DEFAULT 0,
    departmentid integer REFERENCES department ON DELETE SET NULL ON UPDATE CASCADE, --foreign key
    hiredate date NOT NULL,
    enddate date,
    roomid integer REFERENCES room ON DELETE SET NULL ON UPDATE CASCADE, --foreign key 
    -- constraints
    constraint ck_dates CHECK(dob > '1900-01-01' AND hiredate < enddate)
);

CREATE TABLE IF NOT EXISTS faculty (
    -- TO DO:
    -- Attributes
    id integer PRIMARY KEY REFERENCES employee ON DELETE CASCADE ON UPDATE CASCADE,
    subjects text NOT NULL DEFAULT 'none',
    degree text NOT NULL DEFAULT 'Bachelors'
    -- constraints
);

CREATE TABLE IF NOT EXISTS club (
    -- TO DO:
    -- Attributes
    clubid serial PRIMARY KEY,
    clubName text NOT NULL DEFAULT 'Club',
    founddate date NOT NULL,
    facemployeeid integer REFERENCES faculty ON DELETE SET NULL ON UPDATE CASCADE, --foreign key
    headstudentid integer REFERENCES student ON DELETE SET NULL ON UPDATE CASCADE, --foreign key
    startdate date NOT NULL,
    enddate date, 
    -- constraints
    CONSTRAINT ck_dates CHECK(founddate > '1900-01-01' AND founddate <= startdate AND startdate < enddate )
);

CREATE TABLE IF NOT EXISTS course (
    -- TO DO:
    -- Attributes
    id serial PRIMARY KEY,
    num integer NOT NULL,
    areaofstudy text DEFAULT 'Subject',
    coursename text DEFAULT 'Study Hall',
    departmentid integer REFERENCES department ON DELETE SET NULL ON UPDATE CASCADE, --foreign key
    -- constraints
    UNIQUE (departmentid, num)
);

CREATE TABLE IF NOT EXISTS section (
    -- TO DO:
    -- Attributes
    id serial PRIMARY KEY,
    num integer NOT NULL,
    classsize smallint NOT NULL CHECK(classsize < 999 AND classsize > -1) DEFAULT 0,
    semsteryear char(5) NOT NULL DEFAULT 'F1950',
    instructionhours real NOT NULL CHECK(instructionhours >= 0) DEFAULT '0',
    classperiod char(1) NOT NULL CHECK(classperiod < '9' AND classperiod >= '0') DEFAULT '0',
    facemployeeid integer REFERENCES faculty ON DELETE SET NULL ON UPDATE CASCADE, --foreign key
    courseid integer REFERENCES course ON DELETE SET NULL ON UPDATE CASCADE, --foreign key
    roomid integer REFERENCES room ON DELETE SET NULL ON UPDATE CASCADE, --foreign key 
    -- constraints
    UNIQUE (courseid, num)
);

CREATE TABLE IF NOT EXISTS clubparticipation (
    -- TO DO:
    -- Attributes
    studentid integer REFERENCES student ON DELETE RESTRICT ON UPDATE CASCADE, --foreign key
    clubid integer REFERENCES club ON DELETE RESTRICT ON UPDATE CASCADE, --foreign key
    startdate date NOT NULL,
    enddate date,
    -- constraints
    CONSTRAINT ck_dates CHECK(startdate <= enddate)
);

CREATE TABLE IF NOT EXISTS attends (
    -- TO DO:
    -- Attributes
    studentid integer REFERENCES student ON DELETE RESTRICT ON UPDATE CASCADE NOT NULL, --foreign key
    sectionid integer REFERENCES section ON DELETE RESTRICT ON UPDATE CASCADE NOT NULL, --foreign key
    grade varchar(2) NOT NULL DEFAULT 'A+',
    register boolean NOT NULL DEFAULT false
    -- constraints
);