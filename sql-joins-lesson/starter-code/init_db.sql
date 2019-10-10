--
-- Initialize the database for sql-joins-lesson Guided Practice (with PostgreSQL)
-- https://git.generalassemb.ly/GA-Cognizant/databases/tree/master/sql-joins-lesson
--

BEGIN;

SET client_encoding = 'LATIN1';

CREATE TABLE employees (
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(255),
    age INT,
    address VARCHAR(255),
    salary INT,
    UNIQUE(name,age,address)
);

CREATE TABLE departments (
    id SERIAL PRIMARY KEY NOT NULL,
    dept VARCHAR(255),
    emp_id SERIAL NOT NULL,
    FOREIGN KEY (emp_id) REFERENCES employees(id)
);

COMMIT;