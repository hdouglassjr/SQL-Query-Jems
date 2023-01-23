## Notes to remember:

1. Transactions must be explicitly labeled using BEGIN TRANSACTION to be viewed by the transaction query of this repo folder.
2. ISOLATION LEVEL has different flavors and the one that your app needs may vary.  [See MS Docs for more information](https://learn.microsoft.com/en-us/sql/t-sql/statements/set-transaction-isolation-level-transact-sql?view=sql-server-ver16)
3. In order to clear Connection1_Session.sql when running in SSMS, use the following code where 60 is an arbitrary session id (note your session ID value will vary)
   `KILL 60
   GO`
