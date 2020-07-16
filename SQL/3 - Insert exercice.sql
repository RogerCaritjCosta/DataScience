SELECT * FROM employees ORDER BY emp_no DESC LIMIT 10;
-- Normal insertion to a table
INSERT INTO employees
(
	emp_no,
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date
) VALUES
(
	999901,
    '1986-04-21',
    'John',
    'Smith',
    'M',
    '2011-01-01'
);

-- Import data to another table
CREATE TABLE departments_dup
(
	dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

SELECT * FROM departments_dup;
INSERT INTO departments_dup (dept_no, dept_name)
SELECT * FROM departments;