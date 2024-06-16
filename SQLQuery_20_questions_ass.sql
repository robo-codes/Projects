/* Ans1: SELECT ceo, company from [dbo].[ceos] */

/* Ans3: SELECT cto, company FROM [dbo].[CTOs] */

/* Ans2: SELECT cto, company FROM [dbo].[CTOs] order by company */

/* ANS4: SELECT leader, company
FROM [dbo].[CEOs]
UNION
SELECT cto AS leader, company
FROM [dbo].[CTOs]
ORDER BY company */

/* ANS5:  SELECT leader, company
FROM [dbo].[CEOs]
UNION ALL
SELECT cto AS leader, company
FROM [dbo].[CTOs]
ORDER BY company */

/* ANS6: SELECT leader, company FROM [dbo].[CEOs] INTERSECT SELECT cto, company AS leader FROM [dbo].[CTOs] *//* ANS7: SELECT leader, company FROM [dbo].[CEOs] EXCEPT SELECT cto as leader, company FROM [dbo].[CTOs] *//* ANS8: SELECT leader, company from [dbo].[ceos] *//* ANS9: SELECT cto AS leader, company FROM [dbo].[CTOs] EXCEPT SELECT leader, company FROM [dbo].[CEOs] *//* ANS10: SELECT cto AS leader , company FROM [dbo].[CTOs] */
/* ANS11: SELECT *, CASE WHEN est_year > 1930 THEN 'after 1930'
WHEN est_year < 1900 THEN 'before 1900'
ELSE 'between 1900 and 1930' END AS est_year_group FROM [dbo].[Companies] */

/* ANS12: SELECT * FROM [dbo].[CTOs] CROSS JOIN [dbo].[CEOs] */

/*ANS 13 */
SELECT TOP(18) [customerid],[householdid],[gender],[firstname],[customerid],[householdid],[gender],[firstname] FROM [SQLBook].[dbo].[customers]

