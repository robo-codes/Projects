SELECT zc.stab,
SUM(is_pop_10000) as num_10000,
SUM(is_pop_1000) as num_1000,
SUM(is_pop_10000*totpop) as pop_10000,
SUM(is_pop_1000*totpop) as pop_1000
FROM
(SELECT zc.*, (CASE WHEN totpop > 10000 THEN 1 ELSE 0 END) as is_pop_10000,
	(CASE WHEN totpop > 1000 THEN 1 ELSE 0 END) as is_pop_1000 FROM ZipCensus zc)zc GROUP BY zc.stabSELECT zc.stab, COUNT(*) as numzips,
SUM(CASE WHEN zc.popdensity > zcsum.avgpopdensity
THEN 1 ELSE 0 END) as numdenser
FROM (SELECT zc.*,
totpop / landsqmi as popdensity
FROM ZipCensus zc
WHERE landsqmi > 0
) zc JOIN
(SELECT zc.stab, AVG(totpop / landsqmi) as avgpopdensity
FROM ZipCensus zc
WHERE (landsqmi > 0)
GROUP BY zc.stab) zcsum
ON zc.stab = zcsum.stab
GROUP BY zc.stab

SELECT zc.stab, AVG(totpop / landsqmi) as avgpopdensity
FROM ZipCensus zc
WHERE landsqmi > 0
GROUP BY zc.stab
Order BY zc.stab;

SELECT zc.*,
totpop / landsqmi as popdensity
FROM ZipCensus zc
WHERE (landsqmi > 0 AND stab = 'NY')
ORDER BY popdensity DESC


SELECT zc.*
FROM ZipCensus zc
WHERE zc.stab IN (SELECT stab
FROM ZipCensus
GROUP BY stab
HAVING COUNT(*) < 100)


SELECT zc.*
FROM ZipCensus zc JOIN
(SELECT stab, count(*) as numstates
FROM ZipCensus
GROUP BY stab) zipstates
ON zc.stab =zipstates.stab AND
zipstates.numstates < 100

SELECT o.zipcode, count(*) as NumOrders
FROM Orders o
WHERE ZipCode NOT IN (SELECT zcta5 FROM ZipCensus zc)
GROUP BY o.ZipCode

SELECT o.ZipCode, COUNT(*) as NumOrders FROM Orders o
LEFT OUTER JOIN ZipCensus zc ON o.ZipCode = zc.zcta5
WHERE zc.zcta5 IS NULL
GROUP BY o.ZipCode
ORDER BY NumOrders DESC