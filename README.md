# Pewlett-Hackard-Analysis

## Overview of the Analysis 
The purpose of the analysis is to offer Pewlett Hackard a view of how many employees are nearing retirement so the company can strategize for its long-term future. An employee database was created using six csv files with varying human resource details. 

## Results 
The analysis includes three file results from the employee database: 
1. The unique_titles file shows 72,458 employees nearing retirement along with their current titles. Employees born between January 1, 1952 and December 31, 1955
2. The retiring_titles file shows the counts of titles and titles of employees near retirement age. Counts of titles are presented in descending order:
````
25,916 senior engineers
24,926 senior staff
9,285 engineers
7,636 staff
3,603 technique leader
1090 assistant engineer
2 manager
```` 
3. The Mentor_eligibility file shows 1,549 employees eligible for their mentiorship, the criteria for which is having a birthdate between January 1, 1965 and December 31, 1965. 

4. In conclusion, Pewlett-Hackard has a very large number of senior staff members nearing retirement and should begin a mentorship program that provides knowledge transfer specifically in the area of engineering. 


## Summary 

There are about 72.5K unique roles that make up the "silver tsunami."

Given the mentorship eligibility, above the company could have sufficient headcount for an effective mentorship program. 

The number of employees not of retiring age could be used to size retirement age against total employees. The below queries return 167k employees

````
SELECT e.emp_no,
     e.first_name,
     e.last_name,
	 ti.title,
	 ti.from_date,
	 ti.to_date
FROM employees as e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (birth_date NOT between '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name, 
title
INTO UNI_NOT_RET
FROM NOT_RET
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, title DESC;

````
Another query that could be useful is widening the range for mentorship eligibility to include five years. This returns 1,549 mentors. The company could consider widening the eligibilty even more. 

```
SELECT DISTINCT on (emp_no) e.emp_no,
     e.first_name,
     e.last_name,
	 e.birth_date,
	 de.from_date,
	 de.to_date,
	 ti.title
INTO MENT_EL
FROM employees as e
	INNER JOIN dept_emp as de
		ON (e.emp_no = de.emp_no)
	INNER JOIN titles as ti
		ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01') AND 
      (e.birth_date BETWEEN '1965-01-01' AND '1969-12-31')
ORDER BY emp_no

select count(emp_no)
from MENT_EL
`````
