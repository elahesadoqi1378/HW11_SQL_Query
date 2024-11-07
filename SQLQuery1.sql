use ShopDb
go 

-----نام و قیمت محصولاتی که قیمت بیشتر از 500 دلار

select name , price 
from Products where price>500;

--------مجموع مبلغ سفارشات ثبت شده در هر سال

select
    YEAR(OrderDate) AS order_year,
    SUM(TotalAmount) AS total_amount
from
Orders
    
group by 
    YEAR(OrderDate)
order by
    order_year;

-------مجموع مبلغ سفارشات برای هر دسته بندی محصول

select

    c.Name AS CategoryName,
    SUM(o.TotalAmount) AS TotalPrice
from
    Orders o
JOIN 
    Products p ON o.ProductId = p.Id
JOIN 
    Categories c ON p.CategoryId = c.Id
group by
    c.Id, c.Name
order by 
    TotalPrice Asc;


------نام محصولات و قیمت آن ها به ترتیب قیمت از بالا به پایین


select Name , Price 
from Products
order by price desc;



-----تعداد سفارشاتی که هر مشتری ثبت کرده


select 
    c.Id AS CustomerId,
    c.Name AS CustomerName,
    COUNT(o.Id) AS OrderCount
from
    Customers c
left JOIN 
    Orders o ON c.Id = o.CustomerId
group by
    c.Id, c.Name;


---------متوسط قیمت محصولات در هر دسته بندی
select 
 c.Name AS CategoryName,
 avg(p.price) as productsAVG
 from 
 Categories c
 join 
 Products p on c.Id = p.CategoryId
 group by 
 c.Name , c.Id


 -----------نام محصولات و نام دسته بندی به ترتیب الفبایی
select 
p.name as productsname,
c.name as categoriesname
from 
Products p 
join 
Categories c on p.CategoryId=c.Id
order by p.Name , c.Name asc


----------مجموع مبلغ سفارشات ثبت شده در هر دسته بندی در سال 2023
select 
c.name as categoryname,
sum(o.totalamount) as totalprice
from 
orders o
join 
Products p on o.ProductId = p.Id
join 
Categories c on p.CategoryId = c.Id
where 
YEAR(o.OrderDate) = 2023
group by 
c.Name


---------------تعداد سفارشاتی که در هر ماه از سال ثبت شده
select
  year(OrderDate) AS OrderYear, 
  month(OrderDate) AS OrderMonth, 
  COUNT(*) AS NumberOfOrders              
  from
       Orders
  group by
  YEAR(OrderDate), 
  MONTH(OrderDate)
  ORDER BY 
  YEAR(OrderDate), 
  MONTH(OrderDate)

---------------------




----محموع فروش برای هر مشتری

select
c.name as customername,
sum(o.totalamount) as totalprice
from 
Customers c 
join 
Orders o  on  c.Id = o.CustomerId
group by 
c.Name , c.Id
-------------
-----نام دسته بندی و تعداد سفارشات ثبت شده در هر دسته بندی را نمایش دهید
select
c.name as categoryname , 
count(o.id) as countoforders
from 
Categories c
left join
Products p  on c.Id = p.CategoryId
left join 
orders o on p.Id=o.ProductId
group by 
c.Name

--------------------نام و تعداد سفارشات هر مشتر ی را به ترتیب تعداد سفارشات از زیاد به کم نمایش دهید
select
c.name as customername,
count(o.id) as countoforders
from 
Customers c
join 
orders o on c.Id = o.CustomerId
group by 
c.Name , c.Id
order by COUNT(o.id) desc


-----------تعداد سفارشات ثبت شده در هر سال را محاسبه کنید
select 
    YEAR(OrderDate) as OrderYear, 
    COUNT(*) as NumberOfOrders
from
    Orders
group by 
    YEAR(OrderDate)
order by 
    OrderYear;


	------------------• نام محصولات و تعداد خریداران هر محصول را به ترتیب تعداد خریداران از زیاد به کم نمایش دهید
	select 
	p.Name as productname,
	COUNT(o.CustomerId) as countofcustomers
	from 
	Products p
	 join 
	Orders o on p.Id = o.ProductId
	group by 
	p.Name
	order by 
	countofcustomers desc

	