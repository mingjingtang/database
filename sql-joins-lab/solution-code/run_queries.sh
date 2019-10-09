#!/bin/sh

# Employees working at macys
psql -d joinlab -c "SELECT * FROM employees JOIN jobs ON employees.ssn=jobs.ssn WHERE company='Macy''s';"

# Companies in Boston
psql -d joinlab -c "SELECT * FROM employees JOIN jobs ON employees.ssn=jobs.ssn WHERE city='Boston';"

# Employee with the highest salary
psql -d joinlab -c "SELECT * FROM employees JOIN jobs ON employees.ssn=jobs.ssn ORDER BY SALARY DESC LIMIT 1;"