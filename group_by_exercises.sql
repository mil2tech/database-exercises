# SQL exercises for Group BY function

#2 In your script, use DISTINCT to find the unique titles in the titles table.
#How many unique titles have there ever been? 6 different titles
Select distinct title FROM titles;

#3 Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY
# total of 5 employees # last_name
#Erde
E#ldridge
#Etalle
#Erie
#Erbe

Select last_name from employees
where last_name LIKE 'e%e'
group by	last_name;

#4 Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'
Select distinct last_name from employees
where last_name like 'e%e';

#5 Write a query to find the unique last names with a 'q' but not 'qu'. 
#Include those names in a comment in your sql code.
# Chleq
#Lindqvist
#Qiwen

SELECT 
    last_name
FROM
    employees
WHERE
    last_name NOT LIKE '%qu%' 
AND    last_name like '%q%'
GROUP BY last_name;

#6 Add a COUNT() to your results (the query above) to find the number of employees with the same last name
#'Chleq', '189'
#'Lindqvist', '190'
#'Qiwen', '168'

SELECT 
    last_name, count(last_name)
FROM
    employees
WHERE
    last_name NOT LIKE '%qu%' 
AND    last_name like '%q%'
GROUP BY last_name;

#7 Find all all employees with first names 'Irena', 'Vidya', or 'Maya'.
# Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
# 'Vidya', 'M', '151'
#'Irena', 'M', '144'
#'Irena', 'F', '97'
#'Maya', 'F', '90'
#'Vidya', 'F', '81'
#'Maya', 'M', '146'

SELECT first_name,gender, COUNT(first_name)
FROM employees
WHERE first_name  IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender, first_name;

#8 Using your query that generates a username for all of the employees, generate a count employees for each unique username
#Are there any duplicate usernames? 
#
