BEGIN;

SET client_encoding = 'LATIN1';

CREATE TABLE employee(
    id SERIAL PRIMARY KEY NOT NULL,
    ssn VARCHAR(255),
    fist VARCHAR(255),
    last VARCHAR(255),
    year_of_birth INT,
    city VARCHAR(255),
    UNIQUE(ssn)
);

CREATE TABLE job(
    id SERIAL PRIMARY KEY NOT NULL,
    ssn VARCHAR(255),
    company VARCHAR(255),
    salary INT,
    experience INT
);

ALTER TABLE employee RENAME COLUMN fist TO first;

COMMIT;

