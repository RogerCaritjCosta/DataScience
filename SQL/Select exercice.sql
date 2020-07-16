use employees;
-- Select the information from the “dept_no” column of the “departments” table.
SELECT dept_no FROM departments;
    
-- Select all data from the “departments” table.    
SELECT * FROM departments;

-- Select employees which first name is Denis and is a Male
SELECT * FROM employees
WHERE
    first_name = 'Elvis' AND gender = 'M';

-- Importance of parenthesis
SELECT * FROM employees
WHERE
   gender = 'F' AND (first_name = 'Kellie' OR first_name = 'Aruna'); -- Kellie or Aruna Females
   -- gender = 'F' AND first_name = 'Kellie' OR first_name = 'Aruna';	Female Kellies or whatever Arunas

-- Use IN to not overuse OR
SELECT * FROM employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan');

-- Use LIKE to find patterns
-- % for any string (no length limit)
-- _ for given amount of spaces
SELECT * FROM employees
WHERE
	first_name LIKE 'Mar__';
    
SELECT * FROM employees
WHERE
   hire_date LIKE ('%2000%');

-- Between to find ranges
SELECT * FROM employees
WHERE
	hire_date BETWEEN '1990-01-01' AND '2000-01-01';
    
-- Distinct to avoid duplicates (show all posible values only once)
SELECT DISTINCT gender FROM employees;



 