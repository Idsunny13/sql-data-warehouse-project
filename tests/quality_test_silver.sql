/* 
=========================================================================================
Quality Checks
=========================================================================================
Script Purpose:
  This script performs various quality checks for data consistency, accuracy and 
  standardization across the Silver schema. It includes checks for;
    - Null and duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization anad consistency.
    - Invalid date ranges and orders.
    - Data consistency between related fields.

Usage Notes:
  - Run these checks after data loading silver layer.
  - Investigate and resolve any discrepancies found during the checks.
=========================================================================================
*/




-- Check for duplicates
SELECT 
	cst_id,
	COUNT(*) AS Duplicates
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL

-- Check for unwanted spaces
SELECT
	cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

SELECT
	cst_lastname
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)

--Data Standardization & Consistency
SELECT 
	DISTINCT cst_gndr
FROM silver.crm_cust_info
