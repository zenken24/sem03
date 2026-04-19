-- opening database  
psql -U zen -d employee_info; 
Password for user zen: 
psql (16.11 (Homebrew), server 18.1)
WARNING: psql major version 16, server major version 18.
         Some psql features might not work.
Type "help" for help.

-- connecting the sql file with the existing database 
psql -U zen -d employee_info -f /Users/zen/Downloads/sem03/DBMSLAB/lab3/lab3.sql 
Password for user zen: 
psql:/Users/zen/Downloads/sem03/DBMSLAB/lab3/lab3.sql:7: NOTICE:  table "employee" does not exist, skipping
DROP TABLE
CREATE TABLE
INSERT 0 13

-- opening database 
psql -U zen -d employee_info
Password for user zen: 
psql (16.11 (Homebrew), server 18.1)
WARNING: psql major version 16, server major version 18.
         Some psql features might not work.
Type "help" for help.

-- showing the database
employee_info=> \dt
         List of relations
 Schema |   Name   | Type  | Owner 
--------+----------+-------+-------
 public | employee | table | zen
(1 row)

-- task 1 : displaying info 
employee_info=> SELECT * FROM employee;
  id   |   name   | dept_name | salary 
-------+----------+-----------+--------
   128 | Zhang    | Machinery |   1060
 12345 | Shankar  | Finance   |   3200
 19991 | Brandt   | Finance   |  80000
 23121 | Chavez   | Sales     |  11000
 44553 | Peltier  | Machinery |   5750
 45678 | Levy     | Sales     |    460
 54321 | Williams | Finance   |  45000
 55739 | Sanchez  | Research  |  38100
 70557 | Snow     | Machinery |      0
 76543 | Brown    | Research  |   5800
 76653 | Aoi      | Research  |      0
 98765 | Bourikas | Sales     |   9000
 98988 | Tanaka   | Machinery |   1200
(13 rows)

-- task 2 : finding the names of employees from Finance department who earn more than 7,000
employee_info=> SELECT NAME FROM employee WHERE SALARY > 7000 AND DEPT_NAME = 'Finance';
   name   
----------
 Brandt
 Williams
(2 rows)

-- task 3 : finding the names of employees working in either Sales or Research
employee_info=> SELECT NAME FROM employee WHERE DEPT_NAME = 'Sales' OR DEPT_NAME = 'Research';
   name   
----------
 Chavez
 Levy
 Sanchez
 Brown
 Aoi
 Bourikas
(6 rows)

-- task 4 : deleting employees who are working without salary (SALARY = 0)
employee_info=> DELETE FROM employee WHERE SALARY = 0;
DELETE 2

-- task 5 : dropping the EMPLOYEE table with all constraints
employee_info=> DROP TABLE employee;
DROP TABLE


employee_info=> \q