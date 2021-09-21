--- 1 employee salary
SELECT  employee.emp_no, employee.last_name, employee.first_name, employee.sex, salaries.salary FROM employee
    LEFT JOIN salaries
    ON (employee.emp_no = salaries.emp_no)
ORDER BY employee.emp_no;

--- 2 employees hired in 1986
SELECT first_name, last_name, hire_date FROM employee
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--- 3 department managers
SELECT  dept_manager.dept_no, department.dept_name, dept_manager.emp_no, employee.last_name, employee.first_name FROM dept_manager
    INNER JOIN department
        ON (dept_manager.dept_no = department.dept_no)
    INNER JOIN employee
        ON (dept_manager.emp_no = employee.emp_no);
		
--- 4 employee deparments
SELECT  employee.emp_no, employee.last_name, employee.first_name, department.dept_name FROM employee
    INNER JOIN dept_emp
        ON (employee.emp_no = dept_emp.emp_no)
    INNER JOIN department
        ON (dept_emp.dept_no = department.dept_no)
ORDER BY employee.emp_no;

--- 5 Hercules B employee
SELECT first_name, last_name, birth_date, sex FROM employee
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--- 6 sales employees
SELECT  employee.emp_no, employee.last_name, employee.first_name, department.dept_name FROM employee
    INNER JOIN dept_emp
        ON (employee.emp_no = dept_emp.emp_no)
    INNER JOIN department
        ON (dept_emp.dept_no = department.dept_no)
WHERE department.dept_name = 'Sales'
ORDER BY employee.emp_no;

--- 7 sales and development employees
SELECT  employee.emp_no, employee.last_name, employee.first_name, department.dept_name FROM employee
    INNER JOIN dept_emp
        ON (employee.emp_no = dept_emp.emp_no)
    INNER JOIN department
        ON (dept_emp.dept_no = department.dept_no)
WHERE department.dept_name IN ('Sales', 'Development')
ORDER BY employee.emp_no;

--- 8 last name count
SELECT last_name, COUNT(last_name) FROM employee
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
