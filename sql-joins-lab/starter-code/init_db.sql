BEGIN;

SET client_encoding = 'LATIN1';


COPY employee(ssn,first,last,year_of_birth,city) FROM '/Users/mingjing/Documents/JavaCourse/databases/sql-joins-lab/starter-code/employees.csv' DELIMITER ',' CSV HEADER;
COPY job(ssn, company,salary,experience) FROM '/Users/mingjing/Documents/JavaCourse/databases/sql-joins-lab/starter-code/jobs.csv' DELIMITER ',' CSV HEADER;

COMMIT;

ANALYZE employee;
ANALYZE job;