/*
Create all the tables for the school specifying their contstraints
*/
\c school; 

create table if not exists employee (
    -- TO DO:
    -- Attributes
    employeeID serial primary key not null,
    fname varchar(20) default 'John',
    lname varchar(20) default 'Doe',
    ssn integer not null,
    DOB date not null,
    sex boolean default false,
    street varchar(30) default '123 Main Street',
    city varchar(20) default 'Bakersfield',
    state char(2) default 'CA',
    zip integer default 93301,
    salary real default (20000.00),
    departmentID integer not null, --foreign key
    hire_date date not null,
    end_date date,
    roomID integer --foreign key
    -- constraints
)
tablespace schoolData;

create table if not exists faculty (
    -- TO DO:
    -- Attributes
    employeeID serial not null, --foreign key (and primary key?)
    subjects varchar(50) default 'none',
    degree varchar(50) default 'Bachelor'
    -- constraints
) 
tablespace schoolData;

create table if not exists club (
    -- TO DO:
    -- Attributes
    clubid serial primary key not null,
    clubName varchar(20) default 'Club',
    founddate date not null,
    facemployeeid integer not null, --foreign key
    headstudentid integer not null, --foreign key
    start_day date not null,
    end_day date 
    -- constraints
)
tablespace schoolData;

create table if not exists department (
    -- TO DO:
    -- Attributes
    departmentid smallserial primary key not null,
    dname varchar(15) default 'dep',
    budget real default '000000000.00',
    leademployeeid integer not null, --foreign key
    start_day date not null,
    roomid integer not null --foreign key
    -- constraints
)
tablespace schoolData;

create table if not exists course (
    -- TO DO:
    -- Attributes
    courseid smallserial primary key not null,
    areaofstudy varchar(20) default 'Subject',
    coursename varchar(20) default 'Study Hall',
    departmentid integer not null --foreign key
    -- constraints
)
tablespace schoolData;

create table if not exists section (
    -- TO DO:
    -- Attributes
    sectionid serial primary key not null,
    classsize smallint default '0',
    semesteryear char(5) default 'F2999',
    instructionhours real default '0',
    classperiod char(1) default '0',
    facemployeeid integer not null, --foreign key
    roomid integer not null, --foreign key
    courseid integer not null --foreign key
    -- constraints
)
tablespace schoolData;

create table if not exists student (
    -- TO DO:
    -- Attributes
    studentid serial primary key not null,
    gradeLevel char(2) default '09',
    fname varchar(20) default 'John',
    lname varchar(20) default 'Doe',
    DOB date not null,
    sex boolean default false,
    street varchar(30) default '123 Main Street',
    city varchar(20) default 'Bakersfield',
    state char(2) default 'CA',
    zip integer default 93301
    -- constraints
)
tablespace schoolData;

create table if not exists building (
    -- TO DO:
    -- Attributes
    buildingid smallserial primary key not null,
    bname varchar(20) default 'Building',
    bLocation varchar (10) default 'North'
    -- constraints
)
tablespace schoolData;

create table if not exists room (
    -- TO DO:
    -- Attributes
    roomid smallserial primary key not null,
    maxoccupancy smallint default '0',
    roomtype varchar(15) default 'office',
    buildingid integer not null --foreign key
    -- constraints
)
tablespace schoolData;

create table if not exists equipment (
    -- TO DO:
    -- Attributes
    equipmentID serial primary key not null,
    type varchar(20) default 'device',
    purchaseddate date not null,
    warrantydate date not null,
    make_model varchar(20) default 'BCHS Eagle',
    roomid integer not null, --foreign key
    placed_date date not null
    -- constraints
)
tablespace schoolData;

create table if not exists locker (
    -- TO DO:
    -- Attributes
    lockerid serial primary key not null,
    lcombo smallint default '000000',
    studentid integer, --foreign key
    buildingid integer not null -- foreign key
    -- constraints
)
tablespace schoolData;

create table if not exists joins (
    -- TO DO:
    -- Attributes
    studentid integer not null, --foreign key
    clubid integer not null, --foreign key
    start_day date not null,
    end_day date
    -- constraints
)
tablespace schoolData;

create table if not exists attends (
    -- TO DO:
    -- Attributes
    studentid integer not null, --foreign key
    sectionid integer not null, --foreign key
    grade char(2) default 'A+',
    register boolean default false
    -- constraints
)
tablespace schoolData;