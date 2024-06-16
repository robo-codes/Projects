-- ASCII - Return numeric value of left-most character
SELECT ASCII('Ruturaj'), ASCII('Adam');

-- CHAR() - Return the character the integer passed
SELECT CHAR(77);
SELECT CHAR(65);

-- LENGTH() - Return the length of a string in bytes
SELECT LEN('  SQLAuthority'), LEN('SQLAuthority  ');

-- CONCAT() - Return concatenatd string
SELECT CONCAT('SQL', 'Authori', 'ty');
SELECT CONCAT('Rutu', NULL, 'Raj');
SELECT CONCAT(NULL, NULL, NULL);

-- LCASE() - Return the argument in uppercase - synonym for LOWER()
SELECT LOWER('DATA ANALYTICS');

SELECT DATALENGTH(' FLORIDA ')AS TrimmedString

-- UCASE() - Return the argument in uppercase - synonym for UPPER()
SELECT UPPER('SQLAuthority');

-- LEFT() - Return the leftmost number of characters as specified
SELECT LEFT('SQLAuthority', 4);

-- RIGHT() - Return the rightmost number of characters as specified
SELECT right('SQLAuthority', 4);

-- RTRIM() - Remove trailling spaces
SELECT RTRIM('    SQLAuthority    '), LEN(RTRIM('    SQLAuthority    '));

-- LTRIM() - Remove leading spaces
SELECT LTRIM('    SQLAuthority    '), LEN(LTRIM('    SQLAuthority    '));

-- REVERSE() - Reverse the characters in string
SELECT REVERSE('SQLAuthority');

-- DATEADD() - Add time values (intervals) to a date value
SELECT DATEADD(day, 45, '2013-01-01');

-- DATEDIFF() - Substract two dates
SELECT DATEDIFF(year, '2013-01-01', '2015-01-01');

-- GETDATE() 
	-- Return the current date
	SELECT GETDATE();
	SELECT CONVERT(Date, GETDATE());

	-- Return the current date
	SELECT CONVERT(Time, GETDATE());

	-- Various date parts of DATETIME
	SELECT
		DAY(GETDATE()),
		YEAR(GETDATE()),
		MONTH(GETDATE())

-- CURRENT_TIMESTAMP - Return the current date and time
SELECT CURRENT_TIMESTAMP;

-- SYSDATETIME() - Return systems date and time
SELECT SYSDATETIME();

-- SYSDATETIMEOFFSET() - Return the current date and time with time zone
SELECT SYSDATETIMEOFFSET();

-- ABS() - Return the absolute values
SELECT ABS(66), ABS(-66);

-- CEILING() - Return the smallest integer values not less than the argument
SELECT CEILING(12.34), CEILING(-12.34);

-- FLOOR() - Return the largest integer values not greater than the argument
SELECT FLOOR(12.34), FLOOR(-12.34);

-- DEGREES() - Convert radians to degrees
SELECT DEGREES(PI()), DEGREES(PI() / 2);

-- PI() - Return the value of pi
SELECT PI();

-- POWER() - Return the argument raised to the specified power - synonym for POWER(X,Y)
SELECT POWER(8, 2);

-- SQRT() - Return the squared root of the given argument
SELECT SQRT(49)