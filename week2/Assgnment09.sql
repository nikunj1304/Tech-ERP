#######################################################################################################
--ASSIGNMENT : 09
--Oracle inline view
#######################################################################################################      

-- following query retrieves the top 10 most expensive products from the products table

SELECT
    *
FROM
    (
        SELECT
            product_id,
            product_name,
            list_price
        FROM
            products
        ORDER BY
            list_price DESC
    )
WHERE
    ROWNUM <= 10;
    
--Inline view joins with a table
--The following example joins an inline view with a table in the FROM clause. It returns the product 
--categories and the highest list price of products in each category

SELECT
    category_name,
    max_list_price
FROM
    product_categories a,
    (
        SELECT
            category_id,
            MAX( list_price ) max_list_price
        FROM
            products
        GROUP BY
            category_id
    ) b
WHERE
    a.category_id = b.category_id
ORDER BY
    category_name;

--LATERAL inline view 
--It will shows an error because the inline view cannot reference the tables
--from the outside of its definition. for that we need to use LATERAL 
--Error:ORA-00904: "P"."CATEGORY_ID": invalid identifier

SELECT
    category_name,
    product_name
FROM
    products p,
    (
        SELECT
            *
        FROM
            product_categories c
        WHERE
            c.category_id = p.category_id
    )
ORDER BY
    product_name;
    
--using LATERAL
SELECT
    product_name,
    category_name
FROM
    products p,
    LATERAL(
        SELECT
            *
        FROM
            product_categories c
        WHERE
            c.category_id = p.category_id
    )
ORDER BY
    product_name;
--the following statement increases the list prices of CPU products by 15%
UPDATE
    (
        SELECT
            list_price
        FROM
            products
        INNER JOIN product_categories using (category_id)
        WHERE
            category_name = 'CPU'
    )
SET
    list_price = list_price * 1.15; 
    
-- the following example deletes all video cards with the list price less than 1,000:

DELETE
    (
        SELECT
            list_price
        FROM
            products
        INNER JOIN product_categories
                USING(category_id)
        WHERE
            category_name = 'Video Card'
    )
WHERE
    list_price < 1000; 
