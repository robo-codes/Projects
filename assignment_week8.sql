SELECT YEAR(OrderDate) as year, MONTH(OrderDate) as month,
COUNT(*) as numorders,
COUNT(DISTINCT CustomerId) as numcusts,
SUM(prodsperord) as sumprodsperorder,
SUM(prodsperord)*1.0/COUNT(*) as avgperorder,
SUM(prodsperord)*1.0/COUNT(DISTINCT CustomerId) as avgpercust
FROM (SELECT o.OrderId, o.CustomerId, o.OrderDate,
COUNT(DISTINCT ProductId) as prodsperord
FROM Orders o JOIN OrderLines ol ON o.orderid = ol.orderid
GROUP BY o.orderid, o.customerid, o.orderdate ) o
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY year, month


SELECT YEAR(OrderDate) as year, MONTH(OrderDate) as month,
COUNT(*) as numorders, COUNT(DISTINCT CustomerId) as numcust,
SUM(TotalPrice) as totspend,
SUM(TotalPrice)*1.0/COUNT(*) as avgordersize,
SUM(TotalPrice)*1.0/COUNT(DISTINCT CustomerId) as avgcustorder
FROM Orders o
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY year, month

SELECT billdow, COUNT(*) as numbills
FROM (SELECT ol.*, DATENAME(dw, BillDate) as billdow FROM OrderLines ol) ol
GROUP BY billdow
ORDER BY billdow
----------------------------------------------------------------
SELECT billdow, COUNT(*) as numbills
FROM
(SELECT ol.*, DATENAME(dw, BillDate) as billdow,
(CASE WHEN DATENAME(dw, BillDate) = 'Monday' THEN 1
WHEN DATENAME(dw, BillDate) = 'Tuesday' THEN 2
WHEN DATENAME(dw, BillDate) = 'Wednesday' THEN 3
WHEN DATENAME(dw, BillDate) = 'Thursday' THEN 4
WHEN DATENAME(dw, BillDate) = 'Friday' THEN 5
WHEN DATENAME(dw, BillDate) = 'Saturday' THEN 6
WHEN DATENAME(dw, BillDate) = 'Sunday' THEN 7
END) as billdowNum
FROM OrderLines ol
) ol
GROUP BY billdow,billdowNum
ORDER BY billdowNum

SELECT YEAR(BillDate) as theyear,
AVG(CASE WHEN dow = 'Monday' THEN 1.0 ELSE 0 END) as Monday,
AVG(CASE WHEN dow = 'Tuesday' THEN 1.0 ELSE 0 END) as Tuesday,
AVG(CASE WHEN dow = 'Wednesday' THEN 1.0 ELSE 0 END) as Wednesday,
AVG(CASE WHEN dow = 'Thursday' THEN 1.0 ELSE 0 END) as Thursday,
AVG(CASE WHEN dow = 'Friday' THEN 1.0 ELSE 0 END) as Friday,
AVG(CASE WHEN dow = 'Saturday' THEN 1.0 ELSE 0 END) as Saturday,
AVG(CASE WHEN dow = 'Sunday' THEN 1.0 ELSE 0 END) as Sunday
FROM (SELECT ol.*, DATENAME(dw, BillDate) as dow FROM OrderLines ol) ol
GROUP BY YEAR(BillDate)
ORDER BY theyear

SELECT DATEDIFF(day, o.OrderDate, ol.ShipDate) as days, COUNT(*) as
numol
FROM Orders o JOIN
OrderLines ol
ON o.OrderId = ol.OrderId
GROUP BY DATEDIFF(day, o.OrderDate, ol.ShipDate)
ORDER BY days