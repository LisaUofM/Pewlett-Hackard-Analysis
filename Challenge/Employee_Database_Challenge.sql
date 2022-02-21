
---Challenge Steps 1 to 7
SELECT e.emp_no,
     e.first_name,
     e.last_name,
	 ti.title,
	 ti.from_date,
	 ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

select * FROM retirement_titles

---Challenge Steps 8 to 15
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name, 
title
INTO Unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, title DESC;

--select * from unique_titles
-- Challenge Steps 16 to 21
select count(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

--select * from retiring_titles

