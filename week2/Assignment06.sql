#######################################################################################################
--ASSIGNMENT : 06
--Oracle DROP VIEW
#######################################################################################################    
--create a view as salesman
CREATE VIEW salesman AS 
SELECT
    *
FROM
    employees
WHERE
    job_title = 'Sales Representative';

SELECT * FROM salesman;

--create another view which is depended on salsmen view
CREATE VIEW salesman_contacts AS 
SELECT
    first_name,
    last_name,
    email,
    phone
FROM
    salesman;

SELECT * FROM salesman_contacts;

--drop a view salesman
DROP VIEW salesman;

--You can check the status of a view by querying data from the user_objects view.
--Note that the object name must be in uppercase.
SELECT
    object_name,
    status
FROM
    user_objects
WHERE
    object_type = 'VIEW'
    AND object_name = 'SALESMAN_CONTACTS';
--This query will show error becouse we deleted his parent view.so we need to drop this view
SELECT * FROM salesman_contacts;
DROP VIEW salesman_contacts;
