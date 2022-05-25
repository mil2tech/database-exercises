use `kalpana_1829`;

use `employees`;

/*select * 
from employees e
join dept_emp de using (emp_no)
join salaries s using (emp_no)
join departments d using (emp_no)
where de.to_date > now() and s.to_date > now()
and t.to.date > now() and dept_name = 'Customer Service';*/
use `kalpana_1829`;

#1 Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department. Be absolutely sure to create this table on your own database. */
use `employees`;
CREATE TEMPORARY TABLE kalpana_1829.employees_with_departments
AS Select first_name, last_name, dept_name
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
where to_date > curdate();
use `kalpana_1829`;

select *
from kalpana_1829.employees_with_departments;

#1A Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns

ALTER TABLE kalpana_1829.employees_with_departments  ADD full_name VARCHAR(30);

#1B Update the table so that full name column contains the correct data

UPDATE kalpana_1829.employees_with_departments
SET full_name = CONCAT(first_name,' ', last_name);

select *
from kalpana_1829.employees_with_departments;

#1c Remove the first_name and last_name columns from the table.

ALTER TABLE kalpana_1829.employees_with_departments DROP COLUMN first_name; 

select *
from kalpana_1829.employees_with_departments;

ALTER TABLE kalpana_1829.employees_with_departments DROP COLUMN  last_name;

select *
from kalpana_1829.employees_with_departments;

#1D Another way would be concat the first and last name columns as full name when creating the table initally.alter


#2 Create a temporary table based on the payment table from the sakila database.
# Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. 
#For example, 1.99 should become 199.

USE`sakila`;

CREATE TEMPORARY TABLE kalpana_1829.payments
AS Select *
FROM payment;

select *
from kalpana_1829.payments;

ALTER TABLE kalpana_1829.payments
MODIFY amount INT;

select *
from kalpana_1829.payments;

UPDATE kalpana_1829.payments
SET amount=amount*100;

select *
from kalpana_1829.payments;

#3 Find out how the current average pay in each department compares to the overall current pay for everyone at the company.
#In order to make the comparison easier, you should use the Z-score for salaries. 
#In terms of salary, what is the best department right now to work for? The worst?

