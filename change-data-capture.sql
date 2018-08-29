USE <db name>
GO

/*enable the change data capture functionality in the db*/
/*EXEC is a function used to call stored procedures*/

EXEC sys.sp_cdc_enable_db
GO

/*the below statement will enable cdc on the specified table, you have to turn CDC on as a function before you can enable it on a per table basis*/

EXEC sys.sp_cdc_enable_table
@source_schema = '<schema>'
@source_name = '<table>'
@role_name = '<MyRole>'
@filegroup_name = '<most db only have one filegroup check default>'
@support_net_changes
GO

/*when activated you will see new tables appear in the sys tables section of the database

- cdc.captured_columns
- cdc.change_tables
- cdc.dbo_<tablename specified on line 14>_CT

and others...

*/


