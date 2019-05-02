/*
Create the default, index, and temp tablespaces for school
*/

create user school superuser password 'bchseagles'; --create role

create tablespace schoolData
    owner school
    location '/var/lib/postgresql/dbs/school/data'; --first create empty directory as postgres user (sudo su postgres) or this will fail

create tablespace schoolIdx
    owner school
    location '/var/lib/postgresql/dbs/school/idx'; --first create empty directory as postgres user (sudo su postgres) or this will fail

create database schooldb with owner = school tablespace = schoolData;