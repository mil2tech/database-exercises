use employees;
/*Write a query that returns all employees, their department number, their start date, their end date, 
and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.*/
CREATE TEMPORARY TABLE kalpana_1829.current_employees
Select concat(first_name, '  ', last_name) as employee, dept_no , from_date, to_date
from dept_emp
join employees using (emp_no)
join departments using (dept_no);
USE `kalpana_1829`;

select * FROM kalpana_1829.current_employees;

select employee, dept_no, from_date, to_date,
IF (to_date = '9999-01-01', True, False) as is_current_employee
from kalpana_1829.current_employees; 

-- DROP TABLE kalpana_1829.current_employees;
-- using just the employees table instead creating new table
Select concat(first_name, '  ', last_name) as employee, from_date, to_date, dept_no, 
IF (to_date = '9999-01-01', True, False) 
as is_current_employee
from dept_emp
join employees using (emp_no)
join departments using (dept_no);

/* #2 Write a query that returns all employee names (previous and current), and a new column 
'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.*/

Select concat(first_name, '  ', last_name) as employee, 
case
when last_name in ( between 