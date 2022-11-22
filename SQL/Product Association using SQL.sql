use AdventureWorksDW2019 
GO
with order_item as (
	select distinct 
	f.CustomerKey,
	f.OrderDateKey,
	f.ProductKey,
	p.EnglishProductName as ProductName
	from dbo.FactInternetSales f
	inner join DimProduct p on f.ProductKey =p.ProductKey
)
/*SELECT how many product is sould*/
select top 10
	a.ProductName,
	b.ProductName,
	count (*) frequency
from order_item a
inner join order_item b on a.CustomerKey = b.CustomerKey
and A.OrderDateKey =B.OrderDateKey
where a.ProductKey < b.ProductKey
group by a.ProductName, b.ProductName
order by count(*) DESC