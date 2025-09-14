/*
*****************************************************************************************************************************
Create Database and Schemas
*****************************************************************************************************************************
Script Purpose
	This script creates a database named 'DataWarehouse. The script also sets up three schemas ('bronze', 'silver', & 'gold') within the database.
*/

USE master;
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
