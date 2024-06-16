/* Q1. Write a query to display the customer’s name, gender, corresponding zip code, longitude and latitude. */

SELECT C.[firstname], C.[gender], O.[zipcode], Z.[Latitude], Z.[Longitude]
FROM [dbo].[customers] C
JOIN [dbo].[orders] O ON C.[customerid]= O.[customerid]
JOIN [dbo].[ZipCensus] Z ON O.[zipcode] = Z.[zcta5]
WHERE C.[firstname] IS NOT NULL AND C.[firstname] <> '';


/* Q2. Write a query to display the yearly distribution of number of orders (year>2010). */

SELECT YEAR([orderdate]) AS year, COUNT([orderid]) AS distribution
FROM [dbo].[orders] WHERE YEAR([orderdate]) > 2010
GROUP BY YEAR([orderdate])
ORDER BY YEAR([orderdate])

/* Q3. Write a query to display the yearly distribution of number of orders (year>2010) and sum of number of units. */

SELECT YEAR([orderdate]) AS year, sum([numunits])as numofunits, COUNT(*) AS num_orders
FROM [dbo].[orders] WHERE YEAR([orderdate]) > 2010
GROUP BY YEAR([orderdate])
ORDER BY YEAR([orderdate])

/* Q4. Write a query to display the distribution of gender (female and male) by years in Order (year>2010). */

SELECT YEAR(orderdate) AS yearly, 
	SUM(CASE WHEN c.gender = 'M' THEN 1 ELSE 0 END) AS male_count, 
	SUM(CASE WHEN c.gender = 'F' THEN 1 ELSE 0 END) AS female_count
FROM orders o
JOIN customers c
ON o.customerid = c.customerid
GROUP BY year(orderdate)
HAVING year(orderdate) > 2010
ORDER BY yearly


/* Q5) Write a query for displaying the longitude, latitude, total populations of 20 zipcode areas that has the highest total population (totpop). */

SELECT TOP 20 zcta5, latitude, longitude, TotPop
FROM ZipCensus
ORDER BY TotPop DESC


/* Q6. Write a query for showing the zipcodes that in the Orders table but not in the Zipcensus table. */

SELECT zipcode
FROM orders
EXCEPT
SELECT zcta5 FROM ZipCensus
ORDER BY zipcode

