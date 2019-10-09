#!/bin/sh

# create database
psql -c 'CREATE DATABASE joinlab;'

# initialize the database tables
psql -d joinlab -f create_tables.sql

# insert data
psql -d joinlab -c "COPY employees(ssn,first_name,last_name,year_of_birth,city) FROM '`pwd`/employees.csv' DELIMITER ',' CSV HEADER";
psql -d joinlab -c "COPY jobs(ssn,company,salary,experience) FROM '`pwd`/jobs.csv' DELIMITER ',' CSV HEADER";

