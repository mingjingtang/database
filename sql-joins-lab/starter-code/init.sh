# psql postgres
# CREATE DATABASE joinlab2;

# create two table
psql -d joinlab2 -f /Users/mingjing/Documents/JavaCourse/databases/sql-joins-lab/starter-code/table.sql

# populate data into table
psql -d joinlab2 -f /Users/mingjing/Documents/JavaCourse/databases/sql-joins-lab/starter-code/init_db.sql

#run the queries
psql -d joinlab2 -f /Users/mingjing/Documents/JavaCourse/databases/sql-joins-lab/starter-code/queries.sql