create procedure sample
as
begin
select * from [dbo].[DimReseller]
end

exec sample

select * from DimReseller

select * from DimCustomer

select * from FactInternetSales;


create procedure ranjith
as
begin
select D.CustomerKey,
		CONCAT(D.firstname,'',D.LastName) AS fullname,
		D.BirthDate,
		D.EmailAddress,
		F.UnitPrice,
		F.TaxAmt
		from DimCustomer D
		inner join FactInternetSales F
		on D.CustomerKey=F.CustomerKey
		where F.ProductKey='310'
end;

select * sales

