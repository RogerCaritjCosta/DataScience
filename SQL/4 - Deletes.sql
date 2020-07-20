USE employees;
-- In MySQL Workbench: Edit > preferences > SQL Editor > Uncheck Safe Updates
COMMIT;

SELECT * FROM titles
WHERE
    emp_no = 499997;
    
DELETE FROM employees
WHERE
    emp_no = 499997;
    
ROLLBACK;

