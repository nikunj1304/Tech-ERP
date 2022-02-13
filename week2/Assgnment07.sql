#######################################################################################################
--ASSIGNMENT : 07
--Oracle UPDATE VIEW
#######################################################################################################    

CREATE VIEW cars_master AS 
SELECT
    car_id,
    car_name
FROM
    cars;
    
SELECT * FROM cars_master;

DELETE
FROM
    cars_master
WHERE
    car_id = 1;
    
--as we deleted a row from view, hence those changes will be reflectes in our real table also
UPDATE
    cars_master
SET
    car_name = 'Audi RS7 Sportback'
WHERE
    car_id = 2;
--the change above will be reflected in both view and table
SELECT * FROM cars_master;
Select * from cars;

--oracle updatable join view
CREATE VIEW all_cars AS
SELECT car_id, car_name, brand_id, brand_name
FROM cars INNER JOIN brands USING(brand_id);

--inserting value into our table cars via view "all_cars"
INSERT INTO all_cars(car_name, brand_id )
VALUES('Audi A5 Cabriolet', 1);--it will shows an error, because its a restriction,"cannot modify more than one base table through a join view" 

SELECT DISTINCT(BRAND_ID) from all_cars;

--To find which column can be updated, inserted, or deleted, you use the user_updatable_columns view. 
--The following example shows which column of the all_cars view is updatable, insertable, and deletable:
SELECT
    *
FROM
    USER_UPDATABLE_COLUMNS
WHERE
    TABLE_NAME = 'ALL_CARS';
