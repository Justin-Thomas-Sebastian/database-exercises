USE employees;

-- Write a query that shows each department along with the name of the current manager for that department.
SELECT departments.dept_name AS Department_Name,
       CONCAT(employees.first_name, ' ', employees.last_name) AS department_manager
FROM departments
JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no
WHERE year(dept_manager.to_date) = 9999;
