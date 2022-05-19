#This is using the where clause

USE employees;

#Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN.
#709 employees
SELECT emp_no, first_name, last_name 
FROM employees
WHERE first_name IN ('Maya', 'Irena', 'Vidya' );



