/*
=============================================================================================
Quality Checks
=============================================================================================
Script Purpose:
  This script performs quality checks to validate the integrity, consistency and accuracy of 
  the Gold layer. These checks ensure:
  - Uniqueness of surrogate key in dimension tables.
  - Referential integrity between fact and dimension tables.
  - Validation of relationships in the data model for analytical purposes.

Usage Notes:
  - Run these checks after data loading Silver layer.
  - Investigate and resolve any discrepancies found during the checks
=============================================================================================
*/


----------------------------------------------------------------------------------------------
-- Checking gold.dim_customers
----------------------------------------------------------------------------------------------
-- Check for uniqueness of customer key in gold.dim_customers
-- Expectations: No results
SELECT
  customer_key,
  COUNT(*)
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1


----------------------------------------------------------------------------------------------
-- Checking gold.dim_products
----------------------------------------------------------------------------------------------
-- Check for uniqueness of customer key in gold.dim_customers
-- Expectations: No results
SELECT
  product_key,
  COUNT(*)
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1

  
----------------------------------------------------------------------------------------------
-- Checking gold.fact_sales
----------------------------------------------------------------------------------------------
-- Check for data model connectivity between fact and dimension
SELECT
	*
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON	 c.product_key = f.product_key
LEFT JOIN gold.dim_customers c
ON f.customer_key = c.customer_key
WHERE c.product_key IS NULL
