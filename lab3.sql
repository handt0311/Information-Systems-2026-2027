USE employees;

SHOW TABLES;
-- All info of all employees
SELECT * FROM employees;

-- All info of all departments
SELECT * FROM departments;

-- Full names of all employees
SELECT CONCAT(first_name,' ', last_name) AS full_name FROM employees;

-- Names of all departments
SELECT dept_name FROM departments;

-- Full names of employees working in “Sales” department
DESCRIBE employees;
DESCRIBE departments;
DESCRIBE dept_emp;
SELECT CONCAT(first_name,' ' , last_name) AS full_name
FROM employees E JOIN dept_emp DE ON E.emp_no=DE.emp_no
JOIN departments D ON DE.dept_no = D.dept_no
WHERE D.dept_name = 'Sales';



-- Full names of male employees working in “Finance” department
SELECT CONCAT(first_name,' ' , last_name) AS full_name
FROM employees E JOIN dept_emp DE ON E.emp_no= DE.emp_no
JOIN departments D ON DE.dept_no = D.dept_no
WHERE dept_name = 'Finance' AND gender= 'M' ;

-- Salaries of female employees working in “Marketing” department
SELECT salary FROM employees E JOIN salaries S ON E.emp_no=S.emp_no 
JOIN dept_emp DE ON E.emp_no=DE.emp_no
JOIN departments D ON D.dept_no = D.dept_no
WHERE gender='F' AND dept_name='Marketing';

-- Full names of employees who have the same last name as their manager
DESCRIBE dept_manager;
SELECT CONCAT(E.first_name,' ', E.last_name) AS full_name 
FROM employees E JOIN dept_emp DE ON E.emp_no = DE.emp_no
JOIN dept_manager DM ON DE.dept_no = DM.dept_no
JOIN employees M ON M.emp_no = DM.emp_no
WHERE E.last_name = M.last_name AND E.emp_no <> M.emp_no; 


-- Full names of managers who have been doing the job at least twice

SELECT CONCAT(E.first_name, ' ', E.last_name) AS full_name
FROM employees E
JOIN dept_manager DM
    ON E.emp_no = DM.emp_no
GROUP BY E.emp_no
HAVING COUNT(*) >= 2;

-- Full names of employees who was paid more than $100000
SELECT DISTINCT CONCAT(first_name,' ', last_name) AS Full_name
FROM employees E JOIN salaries S ON E.emp_no = S.emp_no
WHERE salary>100000;

-- Names of all departments that have employees paid more than $100000
SELECT DISTINCT dept_name FROM departments D
JOIN dept_emp DE ON D.dept_no = DE.dept_no
JOIN salaries S ON DE.emp_no = S.emp_no
WHERE S.salary>100000;
