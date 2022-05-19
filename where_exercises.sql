#This is using the where clause

USE employees;

#2 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN.
#709 employees
SELECT emp_no, first_name, last_name 
FROM employees
WHERE first_name IN ('Maya', 'Irena', 'Vidya' );

#3 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?
#
SELECT emp_no, first_name, last_name 
FROM employees
WHERE first_name = 'Maya' OR  first_name = 'Irena' OR first_name = 'Vidya' ;

#4 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male
# 441 employees that are male
SELECT emp_no, first_name, last_name,	gender
FROM employees
WHERE first_name IN ('Maya', 'Irena', 'Vidya' )
AND  gender = 'M';

#5 Find all current or previous employees whose last name starts with 'E'
#  1000 employees
SELECT distinct last_name, first_name, emp_no 
FROM employees
WHERE last_name LIKE 'e%' ; 

#6a Find all current or previous employees whose last name starts or ends with 'E'
# 1000
SELECT distinct last_name, first_name, emp_no 
FROM employees
WHERE last_name LIKE 'e%' 
OR last_name LIKE '%e';

#6b How many employees have a last name that ends with E, but does not start with E?
# 1000 employees
SELECT distinct last_name, first_name, emp_no 
FROM employees
WHERE last_name LIKE '%e'
AND last_name NOT Like 'e%';

#7a Find all current or previous employees employees whose last name starts and ends with 'E'
# 889 employees
SELECT distinct last_name, first_name, emp_no 
FROM employees
WHERE last_name LIKE '%e'
AND last_name  Like 'e%';

#7b How many employees' last names end with E, regardless of whether they start with E?
# 1000 employees
SELECT distinct last_name, first_name, emp_no 
FROM employees
WHERE last_name LIKE '%e';

#8 Find all current or previous employees hired in the 90s
# 1000 employees
SELECT emp_no, last_name, first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';

#9 Find all current or previous employees born on Christmas.
# 1000 employees
SELECT emp_no, last_name, first_name, hire_date, birth_date
FROM employees
WHERE birth_date LIKE '%____-12-__';

#10 Find all current or previous employees hired in the 90s and born on Christmas
# 1000 employees
SELECT emp_no, last_name, first_name, hire_date, birth_date
FROM employees
WHERE birth_date LIKE '%____-12-__'
AND hire_date BETWEEN '1990-01-01' AND '1999-12-31';

#11 Find all current or previous employees with a 'q' in their last name.
#
SELECT distinct last_name, first_name, emp_no 
FROM employees
WHERE last_name LIKE '%q%';

#12 Find all current or previous employees with a 'q' in their last name but not 'qu'
# 547 employees
SELECT distinct last_name, first_name, emp_no 
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT Like '%qu%';


