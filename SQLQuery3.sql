CREATE TABLE Retile (
    sale_id INT PRIMARY KEY,       -- Unique identifier for each sale
    product VARCHAR(50),           -- Name or identifier of the product
    sale_date DATE,                -- Date when the sale was made
    amount DECIMAL(10, 2)          -- Amount or value of the sale
);
INSERT INTO Retile (sale_id, product, sale_date, amount) 
VALUES
(1, 'A', '2024-01-01', 100.00),
(2, 'A', '2024-01-02', 200.00),
(3, 'B', '2024-01-03', 150.00),
(4, 'A', '2024-01-04', 250.00),
(5, 'B', '2024-01-05', 300.00);

select sum(amount) from Retile 

select sale_id,product,sale_date,amount,
sum(amount) over(order by sale_date) As TotalRunningSales
from Retile

select sale_id,product,sale_date,amount,
sum(amount) over(partition by product order by sale_date) as runningtotal
from Retile

select sale_id,product,sale_date,amount,
rank()
over(partition by product order by amount desc) As Runningtotal
from Retile

select sale_id,product,sale_date,amount,
row_number()
over(partition by product order by amount desc) As Runningtotal
from Retile

select sale_id,product,sale_date,amount,
DENSE_RANK()
over(partition by product order by amount desc) As Runningtotal
from Retile



