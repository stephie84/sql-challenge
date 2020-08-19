--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT "Employees"."emp_no", "Employees"."last_name", "Employees"."first_name", "Employees"."sex", "Salary"."salary"
FROM "Employees"
INNER JOIN "Salary" ON
"Employees"."emp_no" = "Salary"."emp_no";


--List first name, last name, and hire date for employees who were hired in 1986.

SELECT "first_name", "last_name", "hire_date" FROM "Employees"
WHERE "hire_date" >= '1986-01-01'
AND "hire_date" < '1987-01-01';


--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

SELECT "Department_Manager"."dept_no", "Departments"."dept_name",
"Department_Manager"."emp_no", "Employees"."last_name", "Employees"."first_name"
FROM "Department_Manager"
INNER JOIN "Departments" ON
"Department_Manager"."dept_no" = "Departments"."dept_no"
INNER JOIN "Employees" ON
"Department_Manager"."emp_no" = "Employees"."emp_no";


--List the department of each employee with the following information:
--employee number, last name, first name, and department name.

SELECT "Employees"."emp_no", "Employees"."last_name", "Employees"."first_name",
"Departments"."dept_name"
FROM "Employees" 
INNER JOIN "Department_Employee" ON
"Employees"."emp_no" = "Department_Employee"."emp_no"
INNER JOIN "Departments" ON
"Department_Employee"."dept_no" = "Departments"."dept_no";


--List first name, last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B."

SELECT "Employees"."first_name", "Employees"."last_name", "Employees"."sex"
FROM "Employees"
WHERE "first_name" = 'Hercules'
and "last_name" LIKE 'B%';


--List all employees in the Sales department, including their employee number,
--last name, first name, and department name.

SELECT "Employees"."emp_no", "Employees"."last_name", "Employees"."first_name", 
"Departments"."dept_name"
FROM "Employees"
INNER JOIN "Department_Employee" ON
"Employees"."emp_no" = "Department_Employee"."emp_no"
INNER JOIN "Departments" ON
"Department_Employee"."dept_no" = "Departments"."dept_no"
WHERE "dept_name" = 'Sales';


--List all employees in the Sales and Development departments,
--including their employee number, last name, first name, and department name.

SELECT "Employees"."emp_no", "Employees"."last_name", "Employees"."first_name", 
"Departments"."dept_name"
FROM "Employees"
INNER JOIN "Department_Employee" ON
"Employees"."emp_no" = "Department_Employee"."emp_no"
INNER JOIN "Departments" ON
"Department_Employee"."dept_no" = "Departments"."dept_no"
WHERE "dept_name" = 'Sales' OR "dept_name" = 'Development';


--In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.

SELECT "last_name", COUNT("last_name") FROM "Employees"
GROUP BY "last_name"
ORDER BY COUNT("last_name")DESC;
