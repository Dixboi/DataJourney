-- create
CREATE TABLE EMPLOYEE (
  ID INTEGER PRIMARY KEY,
  NAME TEXT NOT NULL,
  CITY TEXT NOT NULL,
  DATE_OF_BIRTH TEXT NOT NULL,
  AGE INTEGER NOT NULL,
  SALARY INTEGER NOT NULL
);

-- insert
INSERT INTO EMPLOYEE VALUES (0001, 'Andrea', 'Calamba City', 'December 8, 1995', 26, 12000);
INSERT INTO EMPLOYEE VALUES (0002, 'Clarence', 'Batangas City', 'October 20, 1994', 27, 10000);
INSERT INTO EMPLOYEE VALUES (0003, 'Charlene', 'Calapan City', 'January 16, 1996', 26, 11500);
INSERT INTO EMPLOYEE VALUES (0004, 'Dexter', 'San Pablo City', 'January 18, 1996', 26, 15000);
INSERT INTO EMPLOYEE VALUES (0005, 'Emanuel', 'Batangas City', 'June 8, 1996', 25, 14200);
INSERT INTO EMPLOYEE VALUES (0006, 'Jose', 'Lucena City', 'September 24, 1997', 25, 25300);

-- description of Table
DESCRIBE EMPLOYEE;

-- change name of table to EMPLOYEE_INFO
ALTER TABLE EMPLOYEE RENAME TO EMPLOYEE_INFO;

-- arrange employee in increasing order of AGE
SELECT * FROM EMPLOYEE_INFO ORDER BY AGE ASC;

-- arrange employee in decreasing order of AGE
SELECT * FROM EMPLOYEE_INFO ORDER BY AGE DESC;

-- fetch words whose age is greater than 25
SELECT * FROM EMPLOYEE_INFO WHERE AGE > 25;
