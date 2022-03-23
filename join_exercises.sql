USE employees;

-- Write a query that shows each department along with the name of the current manager for that department.
SELECT departments.dept_name AS Department_Name,
       CONCAT(employees.first_name, ' ', employees.last_name) AS Department_manager
FROM departments
JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no
WHERE year(dept_manager.to_date) = 9999;

-- Find the name of all departments currently managed by women.
SELECT departments.dept_name AS Department_Name,
       CONCAT(employees.first_name, ' ', employees.last_name) AS Department_manager
FROM departments
JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no
WHERE year(dept_manager.to_date) = 9999
    AND employees.gender = 'F';

-- Find the current titles of employees currently working in the Customer Service department.
SELECT titles.title, COUNT(titles.title) AS Total
FROM titles
JOIN employees ON titles.emp_no = employees.emp_no
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE year(titles.to_date) = 9999
    AND year(dept_emp.to_date) = 9999
    AND departments.dept_name = 'Customer Service'
GROUP BY titles.title;

-- Find the current salary of all current managers.
SELECT departments.dept_name AS Department_Name,
       CONCAT(employees.first_name, ' ', employees.last_name) AS Department_Manager,
       salaries.salary AS Salary
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE year(salaries.to_date) = 9999
    AND year(dept_manager.to_date) = 9999;

-- Find the names of all current employees, their department name, and their current manager's name .
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS Employee,
       departments.dept_name AS Department,
       CONCAT(filteredManagers.first_name, ' ', filteredManagers.last_name) AS Manager
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees AS filteredManagers ON dept_manager.emp_no = filteredManagers.emp_no
WHERE year(dept_emp.to_date) = 9999
    AND year(dept_manager.to_date) = 9999;