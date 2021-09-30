
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT COUNT(title), title 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;


SELECT e.emp_no, e.first_name, e.last_name, e.birthdate,
dept.from_date, dept.to_date, ti.title
INTO emp_table_chall
FROM employees as e
LEFT JOIN dept_emp as dept
ON (e.emp_no = dept.emp_no)
LEFT JOIN titles as ti
ON (e.emp_no = ti.emp_no);

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
birth_date,
from_date,
to_date,
title
INTO emp_table_chall_next
FROM emp_table_chall
ORDER BY emp_no, to_date DESC;

DROP TABLE emp_table_chall_next;

SELECT * 
INTO mentorship_eligibilty
FROM emp_table_chall_next
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND to_date = '9999-01-01';

