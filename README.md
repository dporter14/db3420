# db3420
SQL Commands to build cmps3420 database
Run these files in order inside psql

1. \i init_tbspace_db.sql 
2. \c schooldb
3. \i init_all.sql

Credentials to access db after it is made
USER:     school
PASSWORD: bchseagles

Clean up can be done by running:
1. \i drop_all.sql
2. \c postgres [or your own psql user db]
3. \i drop_tbspace.sql
