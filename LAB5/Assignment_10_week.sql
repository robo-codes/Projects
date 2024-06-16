SELECT recency, COUNT(*) as numofcustrecpurch
FROM (SELECT HouseholdId, DATEDIFF(day, MAX(OrderDate), '2016-01-01') as recency
FROM Orders o JOIN Customers c ON o.CustomerId = c.CustomerId
WHERE OrderDate < '2016-01-01'
GROUP BY HouseholdId
--order by recency
) h
GROUP BY recency
ORDER BY recency

SELECT frequency,
COUNT(*) numofcustfrepurch
FROM (SELECT HouseholdId, DATEDIFF(day, MIN(OrderDate), '2016-01-01')/COUNT(*) as frequency
FROM Orders o JOIN Customers c ON o.CustomerId = c.CustomerId
WHERE OrderDate < '2016-01-01'
GROUP BY HouseholdId) h
GROUP BY frequency
ORDER BY frequency

SELECT floor(money) as dollars, count(*) as numofcustspenddollars
FROM (SELECT HouseholdId, SUM(TotalPrice)/count(*) as money
FROM Orders o JOIN Customers c ON o.CustomerId = c.CustomerId
WHERE OrderDate < '2016-01-01'
GROUP BY HouseholdId) a
GROUP BY floor(money)
ORDER BY dollars