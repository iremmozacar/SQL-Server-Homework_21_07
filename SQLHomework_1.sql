use Northwind
go


--1)En çok ciro yapılan 3 ürünü listeleyin.
-- SELECT top(3)
-- p.ProductName as 'Ürün',
-- CAST(SUM(od.Quantity*od.UnitPrice*(1-od.Discount)) as decimal(18,2)) as 'Ciro'
-- from OrderDetails od JOIN Products p on od.ProductID=p.ProductID
-- GROUP by p.ProductName
-- ORDER by 'Ciro' desc


--2)Hangi kargo şirketine ne kadarlık ödeme yapılmıştır? 
-- select 
-- s.CompanyName as 'Kargo şirketi',
-- SUM(o.freight) as 'Ödeme'
-- from Orders o join Shippers s on o.ShipVia=s.ShipperID
-- GROUP by s.CompanyName


--3)En az ödeme yapılmış olan kargo şirketi hangisidir? Ne kadarlık ödeme yapılmıştır? 
-- SELECT top(1)
--  s.CompanyName as 'Kargo şirketi',
--  SUM(o.freight) as 'Tutar'
--  FROM Orders o join Shippers s on o.ShipVia=s.ShipperID
-- GROUP BY s.CompanyName
-- order by 'Tutar' ASC


--4)Hangi müşteriye ne kadarlık satış yapılmıştır? Satış tutarına göre büyükten küçüğe sıralı getiriniz.
-- select 
-- c.CompanyName as 'Şirket adı',
-- CAST(sum(od.Quantity*od.UnitPrice*(1-od.Discount)) as decimal(18,2)) as 'Tutar'
-- FROM Orders o join OrderDetails od on o.OrderID=od.OrderID join Customers c on o.CustomerID=c.CustomerID
-- GROUP by c.CompanyName
-- ORDER by 'Tutar' DESC



--5)Bölgelere göre satış tutarlarını listeleyiniz.
-- select 
-- r.RegionDescription as 'Bölge',
-- CAST(SUM(od.Quantity*od.UnitPrice*(1-od.Discount)) as decimal (18,2)) as 'Tutar'
-- from Region r join Territories t on r.RegionID=t.RegionID join EmployeeTerritories et 
--      on et.TerritoryID=t.TerritoryID join Employees e 
--       on et.EmployeeID=e.EmployeeID join Orders o
--        on o.EmployeeID=e.EmployeeID join OrderDetails od
--          on od.OrderID=o.OrderID
-- GROUP by r.RegionDescription



--6)Hangi bölgede hangi üründen ne kadarlık satış yapılmıştır? 
-- select 
-- r.RegionDescription as 'Bölge',
-- p.ProductName as 'Ürün adı',
-- CAST(SUM(od.Quantity*od.UnitPrice*(1-od.Discount)) as decimal (18,2)) as 'Tutar'
-- from Region r join Territories t on r.RegionID=t.RegionID join EmployeeTerritories et 
--      on et.TerritoryID=t.TerritoryID join Employees e 
--       on et.EmployeeID=e.EmployeeID join Orders o
--        on o.EmployeeID=e.EmployeeID join OrderDetails od
--          on od.OrderID=o.OrderID join Products p 
--           on od.ProductID=p.ProductID
-- GROUP by r.RegionDescription, p.ProductName
-- order by r.RegionDescription,p.ProductName DESC
