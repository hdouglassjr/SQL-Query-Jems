/*
From link https://www.mssqltips.com/sqlservertip/1634/find-sql-server-missing-indexes-with-dmvs/
The dynamic management views are:

sys.dm_db_missing_index_details - Returns detailed information about a missing index
sys.dm_db_missing_index_group_stats  - Returns summary information about missing index groups
sys.dm_db_missing_index_groups - Returns information about a specific group of missing indexes
sys.dm_db_missing_index_columns(index_handle) - Returns information about the database table columns that are missing for an index. This is a function and requires the index_handle to be passed.

*/

--Base qUERY
USE AdventureWorks;
GO

SELECT City, StateProvinceID, PostalCode
FROM Person.Address
WHERE StateProvinceID = 1;
GO 

-- Helpful queries to see what SQL server recommends for missing indexes
SELECT * FROM sys.dm_db_missing_index_details

/*
So for the query above, we can see the following:

equality_columns = "StateProvinceID", this is because this column is used in the WHERE clause with 
an equals operator.  So SQL Server is telling us this would be a good candidate for an index.

inequality_columns = "NULL", this column will have data if you use other operators such as not equal, but since we are using equals there are no columns that could be used here 

included_columns = this is additional columns that could be used when the index is created.  Since 
the query only uses City, StateProvinceID and PostalCode, the StateProvinceID will be handled in 
the index and the other two columns could be used as included columns when the index is created.  Take a look at this tip for more information about included columns.
https://www.mssqltips.com/sqlservertip/1078/improve-sql-server-performance-with-covering-index-enhancements/

*/
--This query gives a nice excel like table versus the one above with one row.
SELECT * FROM sys.dm_db_missing_index_columns(1)

--To get all of the data displayed in one result set, the following query gives us this data.
SELECT mig.*, statement AS table_name, column_id, column_name, column_usage
FROM sys.dm_db_missing_index_details AS mid
CROSS APPLY sys.dm_db_missing_index_columns (mid.index_handle)
INNER JOIN sys.dm_db_missing_index_groups AS mig ON mig.index_handle = mid.index_handle
ORDER BY mig.index_group_handle, mig.index_handle, column_id; 

SELECT * FROM sys.dm_db_missing_index_group_stats

SELECT * FROM sys.dm_db_missing_index_groups

