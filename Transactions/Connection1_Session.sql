USE AdventureWorks;
GO

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
GO

BEGIN TRANSACTION
select @@SPID AS Connection1_Session
select * from Sales.SalesOrderDetail
WHERE SalesOrderDetailID = 121316
