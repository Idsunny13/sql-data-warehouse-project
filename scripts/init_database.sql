/*
*****************************************************************************************************************************
Create Database and Schemas
*****************************************************************************************************************************
Script Purpose
	This script creates a database named 'DataWarehouse. The script also sets up three schemas ('bronze', 'silver', & 'gold') within the database.
*/

USE master;
GO

	
-- Drop and Recreate the DataWareHouse database
IF EXIST(SELECT 1 FROM sys.database WHERE name = 'DataWarehHouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

	
--Create the 'Data warehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

--Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
