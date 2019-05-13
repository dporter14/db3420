/*
*/
CREATE DATABASE schooldb;

CREATE USER school PASSWORD 'bchseagles';

ALTER ROLE school SET client_encoding TO 'utf8';
ALTER ROLE school SET default_transaction_isolation TO 'read committed';
ALTER ROLE school SET timezone TO 'UTC';

GRANT ALL PRIVILEGES ON DATABASE schooldb TO school;