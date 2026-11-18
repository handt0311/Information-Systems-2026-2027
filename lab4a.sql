USE employees;
-- What is the average salary of each employee?
SELECT emp_no, AVG(salary) AS Average_Salary FROM salaries
GROUP BY emp_no;

-- How much was each employee paid in total?
SELECT emp_no, SUM(salary) AS Total FROM salaries
GROUP BY emp_no;

-- Minimum, maximum and total salaries of each department?
DESCRIBE salaries;
DESCRIBE dept_emp;
SELECT dept_no, MIN(salary), MAX(salary), SUM(salary)
FROM dept_emp DE JOIN salaries S ON DE.emp_no = S.emp_no
GROUP BY dept_no;

-- Which departments have paid more than 20 billion dollars for their employees?
SELECT dept_no, SUM(salary) AS Total 
FROM dept_emp DE JOIN salaries S ON DE.emp_no = S.emp_no
GROUP BY dept_no
HAVING Total > 20000000000;

-- Total salaries of male employees in each department?
SELECT dept_no, SUM(salary), gender
FROM dept_emp DE JOIN salaries S ON DE.emp_no = S.emp_no
JOIN employees E ON DE.emp_no= E.emp_no
WHERE E.gender='M'
GROUP BY dept_no;


-- Total salaries of department managers for each department, from highest to lowest?
SELECT dept_no, SUM(salary) AS Total
FROM dept_manager DE JOIN salaries S ON DE.emp_no = S.emp_no
GROUP BY dept_no
ORDER BY Total DESC