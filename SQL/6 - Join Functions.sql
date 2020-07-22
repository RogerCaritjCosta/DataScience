USE employees;

-- Prepare Departmens duplicate table
SELECT * FROM departments_dup;
ALTER TABLE departments_dup 
DROP COLUMN dept_manager;
ALTER TABLE departments_dup 
CHANGE COLUMN dept_no dept_no CHAR(4) NULL;
ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

-- Create Dept_manager_dup (Copied from DDL of dept_manager) ...
CREATE TABLE `dept_manager_dup` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`)
);
-- ... and fill it with the data from the original
SELECT * FROM dept_manager;
INSERT INTO dept_manager_dup (emp_no, dept_no, from_date, to_date)
SELECT * FROM dept_manager;
SELECT * FROM dept_manager_dup;

-- Inner join
SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
INNER JOIN departments_dup d
ON m.dept_no = d.dept_no;