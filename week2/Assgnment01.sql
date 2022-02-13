#######################################################################################################
--ASSIGNMENT : 01
--JOINS
#######################################################################################################

CREATE TABLE orders1
(
orderid NUMBER(10) not null,
CustomerID NUMBER(10) not null,
OrederDate date
);

CREATE TABLE customers1
(
CustomerID NUMBER(10) not null,
CustomerName VARCHAR(20) not null,
ContactName VARCHAR(20),
Country VARCHAR(10)
);

ALTER TABLE customers1 MODIFY CustomerName VARCHAR(50);
ALTER TABLE customers1 MODIFY ContactName VARCHAR(50);


INSERT INTO orders1 VALUES(10308,2,'18/09/96');
INSERT INTO orders1 VALUES(10309,37,'19/09/96');
INSERT INTO orders1 VALUES(10310,77,'20/09/96');

INSERT INTO customers1 VALUES(1, 'Alfreds Futterkiste','Maria Anders','Germany');
INSERT INTO customers1 VALUES(2, 'Ana Trujillo Emparedados y helados','Ana Trujillo','Mexico');
INSERT INTO customers1 VALUES(3, 'Antonio Moreno Taquería','	Antonio Moreno','Mexico');


SELECT * FROM orders1;
SELECT * FROM customers1;

SELECT orders1.OrderId, Customers1.CustomerName,orders1.OrederDate FROM orders1
INNER JOIN customers1 ON orders1. CustomerID=Customers1.CustomerID;

SELECT orders1.OrderId, Customers1.CustomerName,orders1.OrederDate FROM orders1
LEFT OUTER JOIN customers1 ON orders1. CustomerID=Customers1.CustomerID;

SELECT orders1.OrderId, Customers1.CustomerName,orders1.OrederDate FROM orders1
RIGHT OUTER JOIN customers1 ON orders1. CustomerID=Customers1.CustomerID;

SELECT orders1.OrderId, Customers1.CustomerName,orders1.OrederDate FROM orders1
FULL OUTER JOIN customers1 ON orders1. CustomerID=Customers1.CustomerID;