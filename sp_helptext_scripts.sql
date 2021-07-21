--Example 1: Display the definition of the stored procedure
use WideWorldImporters
Go
exec sp_helptext 'Website.ChangePassword'

--Example 2: Display the definition of the user-defined function
use WideWorldImporters
Go
exec sp_helptext 'Website.CalculateCustomerPrice'

--Example 3: Display the definition of the database view
use WideWorldImporters
Go
exec sp_helptext 'Website.Suppliers'

--Example 4: Display the definition of the computed column
use WideWorldImporters
Go
exec sp_helptext 'Application.people','SearchName'

--alternative of the sp_helptext statement
use WideWorldImporters
go
select definition from sys.sql_modules where object_id=object_id('Website.ChangePassword')
