## Notes to remember:

1. Transactions must be explicitly labeled using BEGIN TRANSACTION to be viewed by the transaction query of this repo folder.
2. ISOLATION LEVEL has different flavors and the one that your app needs may vary.  
   - [MS ISOLATION LEVEL Docs information](https://learn.microsoft.com/en-us/sql/t-sql/statements/set-transaction-isolation-level-transact-sql?view=sql-server-ver16)
   - [For more detailed information on transactions](https://learn.microsoft.com/en-us/sql/relational-databases/sql-server-transaction-locking-and-row-versioning-guide?view=sql-server-ver16)
3. In order to clear Connection1_Session.sql when running in SSMS, use the following code where 60 is an arbitrary session id (note your session ID value will vary)
   `KILL 60
   GO`

## Shared Locks
- You issue a lock for your transaction by using the "ISOLATION LEVEL" syntax.
- Transactions may be *blocked* or *blocking*.  
   - A blocked transaction is one that shares a lock with a row that is waiting for another transaction that is blocking it from seeing or manipulating that row.
   - A blocking transaction is one that issues a shared lock on a row or set of rows, and holds a lock on them and not release that lock until that transaction is committed or rolled back.
- To identify blocked or blocking requests, the following DMV tables are relavent:
   - dm_exec_requests
   - dm_exec_sessions
   - dm_exec_connections
   - dm_exec_sql_text
