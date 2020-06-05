SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT se.emp_no, se.last_name, se.first_name, se.sex, ss.salary
FROM employees se
	JOIN salaries ss ON se.emp_no = ss.emp_no;
	
-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT se.emp_no, se.last_name, se.first_name, se.hire_date
FROM employees se
WHERE RIGHT(se.hire_date, 2) = '86';
	
-- List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name.
SELECT sd.dept_no, sd.dept_name, sdm.emp_no, se.last_name, se.first_name 
FROM dept_manager sdm
	JOIN employees se ON sdm.emp_no = se.emp_no
	JOIN departments sd ON sdm.dept_no = sd.dept_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT se.emp_no, se.last_name, se.first_name, sd.dept_name
FROM employees se
	JOIN dept_emp sde ON se.emp_no = sde.emp_no
	JOIN departments sd ON sde.dept_no = sd.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT se.emp_no, se.last_name, se.first_name, se.sex
FROM employees se
WHERE se.first_name LIKE 'Hercules' AND se.last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT se.emp_no, se.last_name, se.first_name, sd.dept_name
FROM departments sd
	JOIN dept_emp sde ON sd.dept_no = sde.dept_no
	JOIN employees se ON sde.emp_no = se.emp_no
WHERE sd.dept_name LIKE 'Sales';
	
-- List all employees in the Sales and Development departments, including their employee number, last name, first name, 
-- and department name.
SELECT se.emp_no, se.last_name, se.first_name, sd.dept_name
FROM departments sd
	JOIN dept_emp sde ON sd.dept_no = sde.dept_no
	JOIN employees se ON sde.emp_no = se.emp_no
WHERE sd.dept_name LIKE 'Sales' OR sd.dept_name LIKE 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT se.last_name, COUNT(se.last_name) AS frequency_count
FROM employees se
GROUP BY se.last_name
ORDER BY frequency_count DESC;