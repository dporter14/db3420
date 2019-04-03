/*
Create all the tables for the school specifying their contstraints
*/
\c school; 

create table if not exists student (
    -- TO DO:
    -- Attributes
    studentid integer primary key not null,
    gradeLevel smallint default 9,
    fname varchar(20) default 'John',
    lname varchar(20) default 'Doe',
    DOB date not null,
    sex char(1) default 'F',
    street varchar(30) default '123 Main Street',
    city varchar(20) default 'Bakersfield',
    state char(2) default 'CA',
    zip integer default 93301,
    -- constraints
    constraint ck_dob check(dob > '1900-01-01'),
    constraint ck_gradelevel check(gradelevel >= 9 and gradelevel <= 12)
)
tablespace schoolData;

create table if not exists building (
    -- TO DO:
    -- Attributes
    buildingid integer primary key not null,
    bname varchar(20) default 'Building',
    bLocation varchar (10) default 'North'
)
tablespace schoolData;

create table if not exists room (
    -- TO DO:
    -- Attributes
    roomid integer not null,
    maxoccupancy smallint default '0',
    roomtype varchar(15) default 'office',
    buildingid integer not null, --foreign key
    -- constraints
    constraint pk_room unique (buildingid, roomid),
    constraint fk_building foreign key (buildingid) references building(buildingid)
)
tablespace schoolData;

create table if not exists equipment (
    -- TO DO:
    -- Attributes
    equipmentID integer primary key not null,
    type varchar(255) default 'device',
    purchaseddate date not null,
    warrantydate date not null,
    make_model varchar(255) default 'BCHS Eagle',
    buildingid integer not null,
    roomid integer not null, --foreign key
    placed_date date not null,
    -- constraints
    constraint fk_buildingid foreign key (buildingid) references building(buildingid),
    constraint fk_roomid foreign key (buildingid, roomid) references room(buildingid, roomid)
)
tablespace schoolData;

create table if not exists locker (
    -- TO DO:
    -- Attributes
    lockerid integer primary key not null,
    lcombo char(6) default '000000',
    studentid integer unique references student(studentid), --foreign key
    buildingid integer not null, -- foreign key
    -- constraints
    constraint fk_buildingid foreign key (buildingid) references building(buildingid)
)
tablespace schoolData;

create table if not exists department (
    -- TO DO:
    -- Attributes
    departmentid integer primary key not null,
    dname varchar(15) default 'dep',
    budget real default '000000000.00',
    buildingid integer not null,
    roomid integer not null, --foreign key
    -- constraints
    constraint fk_buildingid foreign key (buildingid) references building,
    constraint fk_roomid foreign key (buildingid,roomid) references room(buildingid, roomid)
)
tablespace schoolData;

create table if not exists employee (
    -- TO DO:
    -- Attributes
    employeeID integer primary key not null,
    fname varchar(20) default 'John',
    lname varchar(20) default 'Doe',
    ssn integer not null,
    DOB date not null,
    sex char(1) default 'F',
    street varchar(30) default '123 Main Street',
    city varchar(20) default 'Bakersfield',
    state char(2) default 'CA',
    zip integer default 93301,
    salary real default (20000.00),
    departmentID integer not null, --foreign key
    hire_date date not null,
    end_date date,
    buildingid integer,
    roomID integer, --foreign key
    -- constraints
    constraint fk_departmentid foreign key (departmentID) references department(departmentid),
    constraint fk_buildingid foreign key (buildingid) references building(buildingid),
    constraint fk_roomid foreign key (buildingid,roomid) references room(buildingid, roomid),
    constraint ck_ssn check(ssn > 0 and ssn < 999999999),
    constraint ck_date check(dob > '1900-01-01'),
    constraint ck_salary check(salary > 19999.99)
)
tablespace schoolData;

create table if not exists faculty (
    -- TO DO:
    -- Attributes
    facultyid integer not null references employee(employeeid), --foreign key (and primary key?)
    subjects varchar(50) default 'none',
    degree varchar(50) default 'Bachelor',
    -- constraints
    constraint pk_employeeid primary key (facultyid)
) 
tablespace schoolData;

create table if not exists club (
    -- TO DO:
    -- Attributes
    clubid integer primary key not null,
    clubName varchar(20) default 'Club',
    founddate date not null,
    facemployeeid integer not null, --foreign key
    headstudentid integer not null, --foreign key
    start_day date not null,
    end_day date, 
    -- constraints
    constraint fk_facemployeeid foreign key (facemployeeid) references faculty(facultyid),
    constraint fk_headstudentid foreign key (headstudentid) references student(studentid),
    constraint ck_founddate check(founddate > '1900-01-01')
)
tablespace schoolData;

create table if not exists course (
    -- TO DO:
    -- Attributes
    courseid integer primary key not null,
    areaofstudy varchar(20) default 'Subject',
    coursename varchar(20) default 'Study Hall',
    departmentid integer not null, --foreign key
    -- constraints
    constraint fk_departmentid foreign key (departmentid) references department(departmentid)
)
tablespace schoolData;

create table if not exists section (
    -- TO DO:
    -- Attributes
    sectionid integer primary key not null,
    classsize smallint default '0',
    semsteryear char(5) default 'F2999',
    instructionhours real default '0',
    classperiod char(1) default '0',
    facemployeeid integer not null, --foreign key
    buildingid integer not null,
    roomid integer not null, --foreign key
    courseid integer not null, --foreign key
    -- constraints
    constraint fk_facemployeeid foreign key (facemployeeid) references faculty(facultyid),
    constraint fk_buildingid foreign key (buildingid) references building(buildingid),
    constraint fk_roomid foreign key (buildingid,roomid) references room(buildingid, roomid),
    constraint fk_courseid foreign key (courseid) references course(courseid),
    constraint ck_classsize check(classsize < 100 and classsize > -1),
    constraint ck_instructionhours check(instructionhours > -1),
    constraint ck_classperiod check(classperiod < '9' and classperiod >= '0')
)
tablespace schoolData;

create table if not exists joins (
    -- TO DO:
    -- Attributes
    studentid integer not null references student(studentid), --foreign key
    clubid integer not null references club(clubid), --foreign key
    start_day date not null,
    end_day date,
    -- constraints
    constraint pk_joinid unique (studentid,clubid)
)
tablespace schoolData;

create table if not exists attends (
    -- TO DO:
    -- Attributes
    studentid integer not null references student(studentid), --foreign key
    sectionid integer not null references section(sectionid), --foreign key
    grade char(2) default 'A+',
    register boolean default false,
    -- constraints
    constraint pk_attends unique (studentid,sectionid)
)
tablespace schoolData;