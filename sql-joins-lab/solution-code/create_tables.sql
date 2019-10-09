-- Create database tables

BEGIN;

SET client_encoding = 'LATIN1';

CREATE TABLE employees (
    id SERIAL PRIMARY KEY NOT NULL,
    ssn VARCHAR(255) NOT NULL UNIQUE,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    year_of_birth INT NOT NULL,
    city VARCHAR(255) NOT NULL
);

CREATE TABLE jobs (
    id SERIAL PRIMARY KEY NOT NULL,
    ssn VARCHAR(255) NOT NULL UNIQUE,
    company VARCHAR(255) NOT NULL,
    salary INT NOT NULL,
    experience INT NOT NULL,
    FOREIGN KEY (ssn) REFERENCES employees(ssn)
);

COMMIT;
