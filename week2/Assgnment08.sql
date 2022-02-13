#######################################################################################################
--ASSIGNMENT : 08
--Oracle FETCH
#######################################################################################################      
SELECT
    product_name,
	quantity
FROM
	inventories
INNER JOIN products
		USING(product_id)
ORDER BY
	quantity DESC 
LIMIT 5;

--By using the row limiting clause, you can rewrite the query that uses the LIMIT clause

SELECT
    product_name,
    quantity
FROM
    inventories
INNER JOIN products
        USING(product_id)
ORDER BY
    quantity DESC 
FETCH NEXT 5 ROWS ONLY;

--returns the top 10 products with the highest inventory level

SELECT
    product_name,
    quantity
FROM
    inventories
INNER JOIN products
        USING(product_id)
ORDER BY
    quantity DESC 
FETCH NEXT 10 ROWS ONLY;

-- The query requested 10 rows, because it had the WITH TIES option, the query returned two more additional rows

SELECT
	product_name,
	quantity
FROM
	inventories
INNER JOIN products
		USING(product_id)
ORDER BY
	quantity DESC 
FETCH NEXT 10 ROWS WITH TIES;

--Limit by percentage of rows example
--It will shows 5% rows of table
SELECT
    product_name,
    quantity
FROM
    inventories
INNER JOIN products
        USING(product_id)
ORDER BY
    quantity DESC 
FETCH FIRST 5 PERCENT ROWS ONLY;

--OFFSET
--ofset skip the rows
-- This query skip top 10 rows and shows next 10 rows

SELECT
	product_name,
	quantity
FROM
	inventories
INNER JOIN products
		USING(product_id)
ORDER BY
	quantity DESC 
OFFSET 10 ROWS 
FETCH NEXT 10 ROWS ONLY;
