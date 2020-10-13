-- Deliverable 1
select employees.emp_no, employees.first_name, employees.last_name 
	, titles.title, titles.from_date, titles.to_date
-- into retirement_titles
from employees
join titles
	on employees.emp_no = titles.emp_no
where employees.birth_date between '1952-01-01' AND '1955-12-31'
order by employees.emp_no

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name,last_name,title
-- INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

select count(*) as num_titles,title 
into retiring_titles
from unique_titles
group by title 
order by num_titles desc

-- Deliverable 2

SELECT DISTINCT ON (emp_no) employees.emp_no, employees.first_name, employees.last_name, employees.birth_date 
	,  dept_emp.from_date, dept_emp.to_date, titles.title
	-- into mentorship_eligibility
	from employees
	inner join dept_emp
		on employees.emp_no = dept_emp.emp_no
	inner join titles
		on employees.emp_no = titles.emp_no
	where employees.birth_date between '1965-01-01' and '1965-12-31'
	and dept_emp.to_date = '9999-01-01'
	order by emp_no
		