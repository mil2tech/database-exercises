use `join_example_db`;

SELECT *
FROM users 
JOIN roles  ON users.role_id = roles.id;

/* the above is an inner join statement
 # id, name, email, role_id, id, name
'1', 'bob', 'bob@example.com', '1', '1', 'admin'
'2', 'joe', 'joe@example.com', '2', '2', 'author'
'3', 'sally', 'sally@example.com', '3', '3', 'reviewer'
'4', 'adam', 'adam@example.com', '3', '3', 'reviewer' 
*/


SELECT *
FROM users 
LEFT JOIN roles  ON users.role_id = roles.id;
/* The above statement is a left join
# id, name, email, role_id, id, name
'1', 'bob', 'bob@example.com', '1', '1', 'admin'
'2', 'joe', 'joe@example.com', '2', '2', 'author'
'3', 'sally', 'sally@example.com', '3', '3', 'reviewer'
'4', 'adam', 'adam@example.com', '3', '3', 'reviewer'
'5', 'jane', 'jane@example.com', NULL, NULL, NULL
'6', 'mike', 'mike@example.com', NULL, NULL, NULL 
*/

SELECT *
FROM users 
RIGHT JOIN roles  ON users.role_id = roles.id;

/* THe statement above is a right joint statement
# id, name, email, role_id, id, name
'1', 'bob', 'bob@example.com', '1', '1', 'admin'
'2', 'joe', 'joe@example.com', '2', '2', 'author'
'3', 'sally', 'sally@example.com', '3', '3', 'reviewer'
'4', 'adam', 'adam@example.com', '3', '3', 'reviewer'
NULL, NULL, NULL, NULL, '4', 'commenter'  
*/


#2 query that shows current mananger per department
use `employees`;

Select  dept_name as 'Department Name', CONCAT(employees.first_name,'  ', employees.last_name) as 'Deapartment Manager'
From dept_manager
JOIN employees 
ON dept_manager.emp_no = employees.emp_no
join titles
on employees.emp_no = titles.emp_no
join departments
on dept_manager.dept_no = departments.dept_no
where dept_manager.to_date > NOW()   and title = "Manager";

#3 Find the name of all departments currently managed by women.


Select  dept_name as 'Department Name', CONCAT(employees.first_name,'  ', employees.last_name) as 'Deapartment Manager'
From dept_manager
JOIN employees 
ON dept_manager.emp_no = employees.emp_no
join titles
on employees.emp_no = titles.emp_no
join departments
on dept_manager.dept_no = departments.dept_no
where dept_manager.to_date > NOW()   and title = "Manager" and gender ='F';

#4 Find the current titles of employees currently working in the Customer Service department.


select * 
from titles 



/*Select  titles.title as 'Title', CONCAT(employees.first_name,'  ', employees.last_name) as 'DEmployee'
From titles
JOIN employees 
ON  = titles.emp_no = employees.emp_no
join departments
on dept_manager.dept_no = departments.dept_no
where titles.to_date > NOW()   