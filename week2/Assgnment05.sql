#######################################################################################################
--ASSIGNMENT : 05
--Oracle CREATE VIEW
#######################################################################################################    
    
SELECT * FROM EMPLOYEES;

CREATE VIEW employee_yos AS
SELECT
    employee_id,
    first_name || ' ' || last_name full_name,
    FLOOR( months_between( CURRENT_DATE, hire_date )/ 12 ) yos
FROM
    employees;
    
Select * FROM employee_yos;
--In this example, we did not define the column names for the view because the defining query uses 
--column aliases for expressions such as full_name for first_name || ' ' || last_name and yos for 
--FLOOR( months_between( CURRENT_DATE, hire_date )/ 12 ).

--If you don’t want to use column aliases in the query, you must define them in the CREATE VIEWclause:

CREATE OR REPLACE VIEW employee_yos (employee_id, full_name, yos) AS
SELECT
    employee_id,
    first_name || ' ' || last_name,
    FLOOR( months_between( CURRENT_DATE, hire_date )/ 12 )
FROM
    employees;
--Using our created view in below query   

SELECT
    *
FROM
    employee_yos
WHERE
    yos = 5
ORDER BY
    full_name; 

--creating read only view
CREATE OR REPLACE VIEW customer_credits(
        customer_id,
        name,
        credit
    ) AS 
SELECT
        customer_id,
        name,
        credit_limit
    FROM
        customers WITH READ ONLY;
        
SELECT * FROM customer_Credits;

DELETE FROM customer_Credits where customer_id=117;--will show error coz its read only view


--creating join view
CREATE OR REPLACE VIEW backlogs AS
SELECT
    product_name,
    EXTRACT(
        YEAR
    FROM
        order_date
    ) YEAR,
    SUM( quantity * unit_price ) amount
FROM
    orders
INNER JOIN order_items
        USING(order_id)
INNER JOIN products
        USING(product_id)
WHERE
    status = 'Pending'
GROUP BY
    EXTRACT(
        YEAR
    FROM
        order_date
    ),
    product_name;


SELECT * FROM BACKLOGS;