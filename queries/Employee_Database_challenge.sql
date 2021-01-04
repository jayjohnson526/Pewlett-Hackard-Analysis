-- CHALLENGE ASSIGNMENT
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
