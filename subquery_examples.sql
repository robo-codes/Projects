SELECT market,
SUM(CASE WHEN rate_plan = 'Top' THEN 1 ELSE 0 END) AS 'Top Plan' ,
SUM(CASE WHEN rate_plan = 'Bottom' THEN 1 ELSE 0 END) AS 'Bottom Plan',
SUM(CASE WHEN rate_plan = 'Middle' THEN 1 ELSE 0 END) AS 'Middle Plan',
COUNT (*) AS 'Count'
FROM Subscribers
GROUP BY market
Order BY marketSELECT channel,
SUM(CASE WHEN rate_plan = 'Top' THEN 1 ELSE 0 END) AS 'Top Plan' ,
SUM(CASE WHEN rate_plan = 'Bottom' THEN 1 ELSE 0 END) AS 'Bottom Plan',
SUM(CASE WHEN rate_plan = 'Middle' THEN 1 ELSE 0 END) AS 'Middle Plan',
COUNT (*) AS 'Count'
FROM Subscribers
GROUP BY channel
ORDER BY channel

SELECT market, SUM([monthly_fee]) AS 'Total Monthly Fee'
FROM Subscribers
GROUP BY marketSELECT market, 
SUM([monthly_fee]) OVER (PARTITION BY market) AS 'Total Monthly Fee'
FROM Subscribers

SELECT zc.stab,
SUM(is_pop_more_10000) as num_more_10000,
SUM(is_pop_less_10000) as num_less_10000,
SUM(is_pop_more_10000*totpop) as pop_more_10000,
SUM(is_pop_less_10000*totpop) as pop_less_10000,
SUM(totpop) AS 'Total Population'
FROM (SELECT zc.*,
(CASE WHEN totpop >= 10000 THEN 1 ELSE 0 END) as
is_pop_more_10000,
(CASE WHEN totpop < 10000 THEN 1 ELSE 0 END) as
is_pop_less_10000
FROM zipcensus zc
) zc
GROUP BY zc.stab

WITH zc as
( SELECT zc.*, (CASE WHEN totpop >= 10000 THEN 1 ELSE 0 END) as
is_pop_more_10000,
(CASE WHEN totpop < 10000 THEN 1 ELSE 0 END) as is_pop_less_10000
FROM ZipCensus zc )
SELECT zc.stab,
SUM(is_pop_more_10000) as num_more_10000,
SUM(is_pop_less_10000) as num_less_10000,
SUM(is_pop_more_10000 * totpop) as pop_more_10000,
SUM(is_pop_less_10000 * totpop) as pop_less_10000,
sum(totpop) as 'Total Population'
FROM zc
GROUP BY zc.stab

SELECT LEN(city) as length, COUNT(*) as numorders, MIN(city), MAX(city)
FROM orders
GROUP BY LEN(city)
ORDER BY length

SELECT CITY FROM orders
WHERE LEN(CITY) IS NULL
Order by CITY

SELECT CITY FROM orders
WHERE LEN(CITY) = 2
Order by CITY

SELECT COUNT(*) as 'not equal length'
FROM orders
WHERE city IS NOT NULL AND LEN(city) <> LEN(LTRIM(RTRIM(city)))

SELECT LEN('     FLORIDA     ') AS TrimmedString
SELECT DATALENGTH('     FLORIDA     ')AS TrimmedString
SELECT DATALENGTH(TRIM ('     FLORIDA     '))AS TrimmedString
SELECT DATALENGTH(LTRIM ('     FLORIDA     '))AS TrimmedString
SELECT DATALENGTH(RTRIM ('     FLORIDA     '))AS TrimmedString

SELECT LEN('     UT     ') AS TrimmedString
SELECT DATALENGTH('     UT     ')AS TrimmedString
SELECT DATALENGTH(TRIM ('     UT     '))AS TrimmedString
SELECT DATALENGTH(LTRIM ('     UT     '))AS TrimmedString
SELECT DATALENGTH(RTRIM ('     UT     '))AS TrimmedString

SELECT State, AVG(TotalPrice) as avgtotalprice
FROM Orders
GROUP BY State
ORDER BY avgtotalprice DESC

SELECT TOP 1 STATE, COUNT(*) as 'Number of AE Card Holders'
FROM Orders WHERE PaymentType='AE'
GROUP BY STATE
ORDER BY 'Number of AE Card Holders' DESC

SELECT State, COUNT(*) as numorders,
SUM(CASE WHEN PaymentType = 'AE' THEN 1 ELSE 0 END) as numae,
AVG(CASE WHEN PaymentType = 'AE' THEN 1.0 ELSE 0 END) as avgae
FROM Orders o
GROUP BY State
HAVING COUNT(*) >= 100
ORDER BY avgae DESC
