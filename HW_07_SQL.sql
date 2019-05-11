CREATE TABLE employees(

	emp_no int NOT NULL,

	birthdate varchar(30),

	first_name varchar(55),

	last_name varchar(55),

	gender varchar(30),

	hire_date varchar(30),
	PRIMARY KEY (emp_no)

);



SELECT *

FROM employees




CREATE TABLE departments(
	
	dept_no varchar(4) NOT NULL,

	dept_name varchar(255),

	Primary Key (dept_no)

);



SELECT *

FROM departments;





CREATE TABLE salaries (

   emp_no int NOT NULL, 
   
   salary int,
   from_date varchar(10),

   to_date varchar(10),

   FOREIGN KEY (emp_no) REFERENCES employees(emp_no)

);



SELECT *

FROM salaries





CREATE TABLE titles (

    emp_no int NOT NULL,
 
   title varchar(255),

    from_date varchar(10),

    to_date varchar(10),

    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)

);



SELECT *

FROM titles




CREATE TABLE dept_emp (

   emp_no int NOT NULL,
 
  dept_no varchar(4) NOT NULL,

   from_date varchar(10),

   to_date varchar(10),

   FOREIGN KEY (emp_no) REFERENCES employees(emp_no),

   FOREIGN KEY (dept_no) REFERENCES departments(dept_no)

);



SELECT *

FROM dept_emp





CREATE TABLE dept_manager (
 
   dept_no varchar(4) NOT NULL,

   emp_no int NOT NULL,
 
  from_date varchar(10),

   to_date varchar(10),

   FOREIGN KEY (emp_no) REFERENCES employees(emp_no),

   FOREIGN KEY (dept_no) REFERENCES departments(dept_no)

);




SELECT *

FROM dept_manager




--1.

-- Query Tables

SELECT * FROM employees;


SELECT * FROM salaries;



-- A join statement to query all employees plus their salary

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary

FROM employees e

LEFT JOIN salaries s

ON e.emp_no = s.emp_no





--2.

--Select statement showing all employees hired in 1986

SELECT *

FROM employees

WHERE hire_date Like '1986%'




--3.

-- Query Tables

SELECT * FROM employees;


SELECT * FROM departments;


SELECT * FROM dept_manager;



-- A join statement to query all department manager information requested 

SELECT  d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date,dm.to_date

FROM departments d

LEFT JOIN dept_manager dm

ON dm.dept_no = d.dept_no

LEFT JOIN employees e

ON e.emp_no = dm.emp_no 




--4.

-- Query Tables

SELECT * FROM employees;


SELECT * FROM departments;


SELECT * FROM dept_emp;



-- A join statement to query all employees plus their department name

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name

FROM employees e

LEFT JOIN dept_emp de

ON e.emp_no = de.emp_no

LEFT JOIN departments d

ON de.dept_no = d.dept_no




--5.

--A select statement to query all employees with the first name 'Hercules' and a last name begining with a 'B'.

SELECT *

FROM employees

WHERE first_name = 'Hercules'
	
AND last_name Like 'B%'
	
	



--6.

-- Query Tables

SELECT * FROM employees;


SELECT * FROM departments;


SELECT * FROM dept_emp;



-- A join statement to query all employees that work in Sales

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name

FROM employees e

LEFT JOIN dept_emp de

ON e.emp_no = de.emp_no

LEFT JOIN departments d

ON de.dept_no = d.dept_no

WHERE dept_name = 'Sales'




--7.

-- Query Tables
SELECT * FROM employees;


SELECT * FROM departments;


SELECT * FROM dept_emp;



-- A join statement to query all employees that work in Sales and Development

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name

FROM employees e

LEFT JOIN dept_emp de

ON e.emp_no = de.emp_no

LEFT JOIN departments d

ON de.dept_no = d.dept_no

WHERE dept_name = 'Sales'
 	
OR dept_name = 'Development'
	



--8.

-- A select statement to query the frequency(count) of employee last names in descending order.


SELECT * FROM employees;



SELECT count(last_name) FROM employees;



SELECT count(last_name) AS "Total Names"

FROM employees;



SELECT last_name, COUNT(last_name) AS "Total Names"

FROM employees

GROUP BY last_name
ORDER BY last_name desc; 
