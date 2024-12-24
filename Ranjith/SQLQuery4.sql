-- Create the employee_salaries table
CREATE TABLE employee_salaries (
    emp_id INT PRIMARY KEY,       -- Employee ID (unique identifier)
    department VARCHAR(50),       -- Department name
    salary DECIMAL(10, 2)         -- Salary amount (decimal for precision)
);

INSERT INTO employee_salaries (emp_id, department, salary)
VALUES
(1, 'HR', 5000.00),
(2, 'HR', 6000.00),
(3, 'HR', 6000.00),
(4, 'HR', 7000.00),
(5, 'IT', 7000.00),
(6, 'IT', 9000.00),
(7, 'IT', 9000.00),
(8, 'IT', 8000.00);

SELECT 
    emp_id, 
    department, 
    salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_value,  --Rank():-this will you the ranks if it is tied it will skip the rank
    DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_rank_value, ---dense_rank(0 :- this will give the ranks as per the deparments if it ties it will give the next rank
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS row_number_value -- row_number:- it will give the unique row number 
FROM 
    employee_salaries
ORDER BY 
    department, salary DESC;


select emp_id, 
    department, 
    salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_value
	from employee_salaries