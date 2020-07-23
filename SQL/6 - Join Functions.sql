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

-- Inner join ex1
SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
INNER JOIN departments_dup d
ON m.dept_no = d.dept_no;

-- Inner join ex2
SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM employees e 
JOIN dept_manager dm 
ON e.emp_no = dm.emp_no;

-- Left Join
SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date
FROM employees e
LEFT JOIN dept_manager dm 
ON e.emp_no = dm.emp_no
WHERE e.last_name = 'Markovitch'
ORDER BY dm.dept_no DESC, e.emp_no;

-- Old Join syntax
SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM employees e, dept_manager dm
WHERE e.emp_no = dm.emp_no;

-- New Join Syntax
SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM employees e 
JOIN dept_manager dm 
ON e.emp_no = dm.emp_no; 

-- Using WHERE and JOIN
SELECT e.first_name, e.last_name, e.hire_date, t.title
FROM employees e
JOIN titles t 
ON e.emp_no = t.emp_no
WHERE first_name = 'Margareta' AND last_name = 'Markovitch'
ORDER BY e.emp_no;  

-- Cross Join
SELECT dm.*, d.*
FROM departments d
CROSS JOIN dept_manager dm
WHERE d.dept_no = 'd009'
ORDER BY d.dept_name;

SELECT e.*, d.*
FROM employees e
CROSS JOIN departments d
WHERE e.emp_no < 10011
ORDER BY e.emp_no , d.dept_name;

-- Join more than 2 tables
SELECT e.first_name, e.last_name, e.hire_date, t.title, m.from_date, d.dept_name
FROM employees e
JOIN dept_manager m ON e.emp_no = m.emp_no
JOIN departments d ON m.dept_no = d.dept_no   
JOIN titles t ON e.emp_no = t.emp_no AND m.from_date = t.from_date
ORDER BY e.emp_no;

-- Use union
SELECT *
FROM 
    (SELECT e.emp_no, e.first_name, e.last_name, NULL AS dept_no, NULL AS from_date
	FROM employees e
    WHERE last_name = 'Denis' 
    UNION 
    SELECT NULL AS emp_no, NULL AS first_name, NULL AS last_name, dm.dept_no, dm.from_date
    FROM dept_manager dm) AS a
ORDER BY a.emp_no DESC;
