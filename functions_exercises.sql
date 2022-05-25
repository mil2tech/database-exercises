# SQL exercises for functions within sql starts at line 82

#2 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. 
# What was the first and last name in the first row of the results? 
#  'Irena', 'Reutenauer' 
#What was the first and last name of the last person in the table?
#  'Vidya', 'Simmen'

SELECT emp_no, first_name, last_name 
FROM employees
WHERE first_name IN ('Maya', 'Irena', 'Vidya' )
order by first_name;


#3 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name
# What was the first and last name in the first row of the results?
# '46986', 'Irena', 'Acton'
#What was the first and last name of the last person in the table?
# '97971', 'Vidya', 'Zweizig'
SELECT emp_no, first_name, last_name 
FROM employees
WHERE first_name IN ('Maya', 'Irena', 'Vidya' )
order by first_name ASC, last_name ASC;

#Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name.
#What was the first and last name in the first row of the results?
#'228270', 'Maya', 'Khasidashvili'
# What was the first and last name of the last person in the table?
#'479435', 'Maya', 'Zyda'
SELECT emp_no, first_name, last_name 
FROM employees
WHERE first_name IN ('Maya', 'Irena', 'Vidya' )
order by last_name ASC, first_name ASC;

#5 Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number
# the number of employees returned
# 889 employees
# the first employee number and their first and last name
# 'Erde', 'Ramzi', '10021'
# the last employee number with their first and last name.
# 'Erde', 'Tadahiro', '499648'
SELECT distinct last_name, first_name, emp_no 
FROM employees
WHERE last_name LIKE '%e'
AND last_name  Like 'e%'
order by emp_no ASC;

#6 Write a query to to find all employees whose last name starts and ends with 'E'. 
#Sort the results by their hire date, so that the newest employees are listed first
#comment with the number of employees returned
# 889 employees
# the name of the newest employee
# 'Eldridge', 'Teiji', '67892', '1999-11-27'
# name of the oldest employee
# 'Erde', 'Sergi', '233488', '1985-02-02'
SELECT distinct last_name, first_name, emp_no, hire_date 
FROM employees
WHERE last_name LIKE '%e'
AND last_name  Like 'e%'
order by hire_date DESC;

#7 Find all employees hired in the 90s and born on Christmas
# Sort the results so that the oldest employee who was hired last is the first result.
# the number of employees returned
# 362 employee
# the name of the oldest employee who was hired last
# '33936', 'Bernini', 'Khun', '1999-08-31', '1952-12-25'
SELECT emp_no, last_name, first_name, hire_date, birth_date
FROM employees
WHERE birth_date LIKE '____-12-25'
AND hire_date LIKE '199%'
order by hire_date DESC, birth_date ASC;
# the name of the youngest employee who was hired first.
#'254794', 'Ghalwash', 'Woody', '1985-02-22', '1964-12-25'
SELECT emp_no, last_name, first_name, hire_date, birth_date
FROM employees
WHERE birth_date LIKE '____-12-25'
AND hire_date LIKE '199%'
order by birth_date DESC, hire_date ASC;


####################### Exercise questions below

#2 Write a query to to find all employees whose last name starts and ends with 'E'.
#Use concat() to combine their first and last name together as a single column named full_name.

SELECT distinct last_name, first_name, emp_no, hire_date 
FROM employees
WHERE last_name LIKE '%e'
AND last_name  Like 'e%'
order by hire_date DESC;
SELECT CONCAT(first_name , ' ' , last_name) AS full_name 
FROM employees
WHERE last_name LIKE '%e'
AND last_name  Like 'e%';

#3 Convert the names produced in your last query to all uppercase
SELECT UPPER (CONCAT (first_name , ' ' , last_name) )AS full_name 
FROM employees
WHERE last_name LIKE '%e'
AND last_name  Like 'e%'
order by hire_date DESC;

#3 Find all employees hired in the 90s and born on Christmas.
#Use datediff() function to find how many days they have been working at the company 
#(Hint: You will also need to use NOW() or CURDATE()),

SELECT DATEDIFF(CURDATE(), hire_date ) as  days_of_tenure
FROM employees
WHERE birth_date LIKE '____-12-25'
AND hire_date LIKE '199%'
order by birth_date DESC, hire_date ASC;

#5 Find the smallest and largest current salary from the salaries table
# Largest salary
# '158220'
SELECT MAX(salary) from salaries
WHERE to_date > NOW();
# Smallest salary
# '38623'
SELECT MIN(salary) from salaries
WHERE to_date > NOW();

#6 

