/*
Create all the tables for the school specifying their contstraints
*/
\c schooldb; 

CREATE TABLE IF NOT EXISTS student (
    -- TO DO:
    -- Attributes
    ID serial PRIMARY KEY,
    gradelevel smallint DEFAULT 9,
    fname text NOT NULL DEFAULT 'Jane',
    lname text NOT NULL DEFAULT 'Doe',
    DOB date NOT NULL, 
    sex char(1) NOT NULL DEFAULT 'F',
    street text NOT NULL,
    city text NOT NULL,
    statecode char(2) NOT NULL,
    zip char(5) NOT NULL DEFAULT '99999'
    -- constraints
    CONSTRAINT ck_dob CHECK(dob > '1900-01-01'),
    CONSTRAINT ck_gradelevel CHECK(gradelevel >= 9 AND gradelevel <= 12),
    CONSTRAINT ck_sex CHECK(sex = 'M' OR sex = 'F')
)
TABLESPACE schoolData;

CREATE TABLE IF NOT EXISTS building (
    -- TO DO:
    -- Attributes
    ID smallserial PRIMARY KEY,
    bname text NOT NULL DEFAULT 'Building'
)
TABLESPACE schoolData;

CREATE TABLE IF NOT EXISTS room (
    -- TO DO:
    -- Attributes
    ID smallserial PRIMARY KEY,
    maxoccupancy smallint NOT NULL DEFAULT '0',
    roomtype text NOT NULL DEFAULT 'office',
    buildingid integer REFERENCES building ON DELETE CASCADE ON UPDATE CASCADE, --foreign key
    -- constraints
    CONSTRAINT ck_maxoccupancy CHECK(maxoccupancy > 0)
)
TABLESPACE schoolData;

CREATE TABLE IF NOT EXISTS equipment (
    -- TO DO:
    -- Attributes
    ID serial PRIMARY KEY,
    eqtype text NOT NULL DEFAULT 'generic device',
    purchaseddate date NOT NULL,
    warrantydate date NOT NULL,
    makemodel text NOT NULL,
    buildingid integer REFERENCES building ON DELETE SET NULL ON UPDATE CASCADE,
    roomid integer REFERENCES room ON DELETE SET NULL ON UPDATE CASCADE,--foreign key
    placeddate date NOT NULL,
    -- constraints
    CONSTRAINT ck_dates CHECK(warrantydate > purchaseddate AND placeddate >= purchaseddate)
)
TABLESPACE schoolData;

CREATE TABLE IF NOT EXISTS locker (
    -- TO DO:
    -- Attributes
    ID smallserial PRIMARY KEY,
    lcombo char(8) NOT NULL DEFAULT '00-00-00',
    studentid integer REFERENCES student ON DELETE SET NULL ON UPDATE CASCADE, --foreign key
    buildingid integer REFERENCES building ON DELETE CASCADE ON UPDATE CASCADE -- foreign key
    -- constraints
)
TABLESPACE schoolData;

CREATE TABLE IF NOT EXISTS department (
    -- TO DO:
    -- Attributes
    ID smallserial PRIMARY KEY,
    dname text NOT NULL DEFAULT 'Department',
    budget money NOT NULL DEFAULT 0,
    buildingid integer REFERENCES building ON DELETE SET NULL ON UPDATE CASCADE,
    roomid integer REFERENCES room ON DELETE SET NULL ON UPDATE CASCADE, --foreign key
    -- constraints
    CONSTRAINT ck_budget CHECK(budget >= CAST(0 AS money))
)
TABLESPACE schoolData;

CREATE TABLE IF NOT EXISTS employee (
    -- TO DO:
    -- Attributes
    ID serial PRIMARY KEY,
    fname text NOT NULL DEFAULT 'John',
    lname text NOT NULL DEFAULT 'Doe',
    ssn char(11) NOT NULL DEFAULT 'xxx-xx-xxxx',
    DOB date NOT NULL,
    sex char(1) NOT NULL DEFAULT 'F',
    street text NOT NULL,
    city text NOT NULL,
    statecode char(2) NOT NULL,
    zip char(5) NOT NULL DEFAULT '99999',
    salary money NOT NULL DEFAULT 0,
    departmentID integer REFERENCES department ON DELETE SET NULL ON UPDATE CASCADE, --foreign key
    hiredate date NOT NULL,
    enddate date,
    buildingid integer REFERENCES building ON DELETE SET NULL ON UPDATE CASCADE, --foreign key
    roomID integer REFERENCES room ON DELETE SET NULL ON UPDATE CASCADE, --foreign key
    -- constraints
    constraint ck_date CHECK(dob > '1900-01-01' AND hiredate < enddate),
    constraint ck_salary CHECK(salary >= CAST(0 AS money))
)
TABLESPACE schoolData;

CREATE TABLE IF NOT EXISTS faculty (
    -- TO DO:
    -- Attributes
    ID integer PRIMARY KEY REFERENCES employee ON DELETE CASCADE ON UPDATE CASCADE,
    subjects text NOT NULL DEFAULT 'none',
    degree text NOT NULL DEFAULT 'Bachelors'
    -- constraints
) 
TABLESPACE schoolData;

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
    CONSTRAINT ck_date CHECK(founddate > '1900-01-01' AND founddate <= startdate AND startdate < enddate )
)
TABLESPACE schoolData;

CREATE TABLE IF NOT EXISTS course (
    -- TO DO:
    -- Attributes
    ID smallserial PRIMARY KEY,
    areaofstudy text DEFAULT 'Subject',
    coursename text DEFAULT 'Study Hall',
    departmentid integer REFERENCES department ON DELETE SET NULL ON UPDATE CASCADE --foreign key
    -- constraints
)
TABLESPACE schoolData;

CREATE TABLE IF NOT EXISTS section (
    -- TO DO:
    -- Attributes
    ID serial PRIMARY KEY,
    classsize smallint NOT NULL DEFAULT 0,
    semsteryear char(5) NOT NULL DEFAULT 'F1950',
    instructionhours real NOT NULL DEFAULT '0',
    classperiod char(1) NOT NULL DEFAULT '0',
    facemployeeid integer REFERENCES faculty ON DELETE SET NULL ON UPDATE CASCADE, --foreign key
    buildingid integer REFERENCES building ON DELETE SET NULL ON UPDATE CASCADE,
    roomid integer REFERENCES room ON DELETE SET NULL ON UPDATE CASCADE, --foreign key
    courseid integer REFERENCES course ON DELETE SET NULL ON UPDATE CASCADE, --foreign key
    -- constraints
    constraint ck_classsize CHECK(classsize < 999 AND classsize > -1),
    constraint ck_instructionhours CHECK(instructionhours >= 0),
    constraint ck_classperiod CHECK(classperiod < '9' AND classperiod >= '0')
)
TABLESPACE schoolData;

CREATE TABLE IF NOT EXISTS clubparticipation (
    -- TO DO:
    -- Attributes
    studentid integer REFERENCES student ON DELETE RESTRICT ON UPDATE CASCADE, --foreign key
    clubid integer REFERENCES club ON DELETE RESTRICT ON UPDATE CASCADE, --foreign key
    startdate date NOT NULL,
    enddate date,
    -- constraints
    PRIMARY KEY (clubid, studentid),
    CONSTRAINT ck_dates CHECK(startdate <= enddate)
)
TABLESPACE schoolData;

CREATE TABLE IF NOT EXISTS attends (
    -- TO DO:
    -- Attributes
    studentid integer REFERENCES student ON DELETE RESTRICT ON UPDATE CASCADE NOT NULL, --foreign key
    sectionid integer REFERENCES section ON DELETE RESTRICT ON UPDATE CASCADE NOT NULL, --foreign key
    grade char(2) DEFAULT 'A+',
    register boolean DEFAULT false,
    -- constraints
    PRIMARY KEY (sectionid, studentid)
)
TABLESPACE schoolData;