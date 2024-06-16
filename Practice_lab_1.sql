SELECT * from [dbo].[Nobel Prize Winners]
SELECT [Full Name],[Category] from [dbo].[Nobel Prize Winners]
SELECT * FROM [dbo].[Nobel Prize Winners] WHERE Sex ='Female'
SELECT * FROM [dbo].[Nobel Prize Winners] WHERE Category = 'Physics' 
SELECT COUNT(Category) FROM [dbo].[Nobel Prize Winners] WHERE Category = 'Physics'
SELECT [Full Name], [Category] FROM [dbo].[Nobel Prize Winners] WHERE Category = 'Physics' OR Category = 'Chemistry'
SELECT [Full Name], [Category] FROM [dbo].[Nobel Prize Winners] WHERE Category = 'Physics' AND Category = 'Chemistry'
SELECT [Full Name], [Category] FROM [dbo].[Nobel Prize Winners] WHERE Category = 'Physics' AND Sex = 'Female'
SELECT [Organization Name] FROM [dbo].[Nobel Prize Winners] WHERE [Organization Name] = 'university'
SELECT [Organization Name] FROM [dbo].[Nobel Prize Winners] WHERE [Organization Name] LIKE '%university%'
SELECT COUNT([Organization Country]) FROM [dbo].[Nobel Prize Winners] WHERE [Organization Country] LIKE 'a%'
SELECT COUNT(*) from [dbo].[Nobel Prize Winners] WHERE [Sex] != 'Male' AND [Sex] != 'Female'
SELECT COUNT([Prize Share]) from [dbo].[Nobel Prize Winners] WHERE [Sex] = 'Female'