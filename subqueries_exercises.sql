-- Sunquieries exercises

#1 Find all the current employees with the same hire date as employee 101010 using a sub-query. 55 responses
USE `employees`;
Select *
FROM employees
where emp_no = '101010';

Select first_name, last_name, hire_date
from employees
Join dept_emp Using (emp_no)
where hire_date = (Select hire_date
FROM employees
where emp_no = '101010')
and dept_emp.to_date > now() ;

#2 Find all the titles ever held by all current employees with the first name Aamod. 251 responses

Select emp_no, last_name, first_name, title, titles.from_date, titles.to_date, dept_emp.to_date
from employees
Join titles using (emp_no)
join dept_emp using (emp_no)
where first_name = 'Aamod' and (select dept_emp.to_date > NOW());

#3 How many people in the employees table are no longer working for the company? 91,479

Select emp_no, first_name, last_name, gender, title, titles.to_date, dept_emp.from_date as 'from', dept_emp.to_date as 'last date as'
from employees
join titles using (emp_no)
join dept_emp using (emp_no)
where dept_emp.to_date <> '9999-01-01'
group by dept_emp.emp_no



No

#4 Find all the current department managers that are female?

 dept_manager
JOIN employees 
ON dept_manager.emp_no = employees.emp_no
join titles
on employees.emp_no = titles.emp_no
join departments
on dept_manager.dept_no = departments.dept_no
where dept_manager.to_date > NOW()   and title = "Manager" and gender ='F'; 
 


 


