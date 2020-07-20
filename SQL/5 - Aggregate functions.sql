USE employees;

ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

COMMIT;

INSERT INTO departments_dup(dept_no) 
VALUES('d010'), ('d011');

ALTER TABLE departments_dup
ADD COLUMN dept_manager VARCHAR(255) NULL AFTER dept_name;

-- IS NULL to display other info if some columns is null
SELECT dept_no, IFNULL(dept_name, 'Department name not provided') AS dept_name
FROM departments_dup;

-- COALESCE is like an if with more conditions
SELECT dept_no, dept_name, COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager
FROM departments_dup;

-- Use COALESCE also to add a column with fixed value
SELECT dept_no, dept_name, COALESCE('Fake column') AS fake_column
FROM departments_dup;

-- Remember that all this does not change the table, only for visualization
SELECT * FROM departments_dup;

ROLLBACK;