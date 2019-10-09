--
-- Insert data into the database for sql-joins-lesson Guided Practice (with PostgreSQL)
-- https://git.generalassemb.ly/GA-Cognizant/databases/tree/master/sql-joins-lesson
--

BEGIN;

SET client_encoding = 'LATIN1';

COPY employees(name,age,address,salary) FROM '/Users/alex/workspaces/GA-Cognizant/databases/sql-joins-lesson/starter-code/employees.csv' DELIMITER ',' CSV HEADER;
COPY departments(dept,emp_id) FROM '/Users/alex/workspaces/GA-Cognizant/databases/sql-joins-lesson/starter-code/departments.csv' DELIMITER ',' CSV HEADER;

COMMIT;

ANALYZE employees;
ANALYZE departments;
