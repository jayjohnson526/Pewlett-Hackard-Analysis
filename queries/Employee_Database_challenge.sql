-- CHALLENGE ASSIGNMENT

-- Deliverable 1:
-- Create a table of retirement titles
SELECT e.emp_no,
		e.first_name,
		e.last_name,
		ts.title,
		ts.from_date,
		ts.to_date
INTO retirement_titles
FROM employees as e
	INNER JOIN titles as ts
		ON (e.emp_no = ts.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) 
					rts.emp_no,
					rts.first_name,
					rts.last_name,
					rts.title
INTO unique_titles
FROM retirement_titles as rts
ORDER BY emp_no ASC, to_date DESC;

-- Retrieve the number of employees by their most recent job title who are about to retire
SELECT COUNT (uts.title), uts.title
INTO retiring_titles
FROM unique_titles as uts
GROUP BY uts.title 
ORDER BY COUNT DESC;

-- Deliverable 2:
-- Create a mentorship eligibility table
SELECT DISTINCT ON (emp_no)
					e.emp_no,
					e.first_name,
					e.last_name,
					e.birth_date,
					de.from_date,
					de.to_date,
					ts.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
INNER JOIN titles as ts
	ON (e.emp_no = ts.emp_no)
WHERE (de.to_date = '9999-01-01')
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no, ts.from_date DESC;
	



