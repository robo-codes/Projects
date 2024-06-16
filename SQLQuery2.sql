CREATE TABLE Companies
(
    company varchar(30) NOT NULL,
	continent varchar(30) NOT NULL, 
	est_year int,
		
)
GO
BULK INSERT Companies
FROM 'C:\Users\solan\OneDrive\Desktop\St.Clair\Sem_2\companies.csv' --Change this location as  appropriate for you
WITH
(
    FIRSTROW = 2,
	FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'

)
GO