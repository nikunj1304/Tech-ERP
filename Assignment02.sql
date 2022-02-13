#######################################################################################################
--ASSIGNMENT : 02
--JOINS
#######################################################################################################
CREATE TABLE books
( id number(10) NOT NULL,  
  title varchar2(50) NOT NULL,  
  type varchar2(50) NOT NULL,
  author_id number(10) NOT NULL,
  editor_id number(10) NOT NULL,
  translator_id number(10) NOT NULL,
  CONSTRAINT books_id PRIMARY KEY (id)  
);  

CREATE TABLE authors
( id number(10) NOT NULL,  
  first_name varchar2(50) NOT NULL,
  last_name varchar2(50) NOT NULL,
  CONSTRAINT authors_id PRIMARY KEY (id)  
);  

CREATE TABLE editors
( id number(10) NOT NULL,  
  first_name varchar2(50) NOT NULL,
  last_name varchar2(50) NOT NULL,
  CONSTRAINT editors_id PRIMARY KEY (id)  
);  

CREATE TABLE translators
( id number(10) NOT NULL,  
  first_name varchar2(50) NOT NULL,
  last_name varchar2(50) NOT NULL,
  CONSTRAINT translators_id PRIMARY KEY (id)  
);  

ALTER TABLE books MODIFY ( translator_id NULL);
--Inserting values into book tables
INSERT INTO books values(1,'Time to Grow Up!','original',11,21,NULL);
INSERT INTO books values(2,'Your Trip','translated',15,22,32);
INSERT INTO books VALUES(3,'Lovely Love','original',14,24,NULL);
INSERT INTO books VALUES(4,'Dreamy Your Life','original',11,24,NULL);
INSERT INTO books VALUES(5,'Oranges','translated',12,25,31);
INSERT INTO books VALUES(6,'Your Happy Life','translated',15,22,33);
INSERT INTO books VALUES(7,'Applied AI','translated',13,23,34);
INSERT INTO books VALUES(8,'My Last Book','original',11,28,NULL);

SELECT * FROM books;

INSERT INTO authors VALUES(11,'Ellen','Writer');
INSERT INTO authors VALUES(12,'Olga','Savelieva');
INSERT INTO authors VALUES(13,'Jack','Smart');
INSERT INTO authors VALUES(14,'Donald','Brain');
INSERT INTO authors VALUES(15,'Yao','Duo');

SELECT * FROM authors;

INSERT INTO editors VALUES(21,'Daniel','Brown');
INSERT INTO editors VALUES(22,'Mark','Jhonson');
INSERT INTO editors VALUES(23,'Maria','Evans');
INSERT INTO editors VALUES(24,'Cathrine','Roberts');
INSERT INTO editors VALUES(25,'Sebastian','Wright');
INSERT INTO editors VALUES(26,'Barbara','Jones');
INSERT INTO editors VALUES(27,'Matthew','Smith');

SELECT * FROM editors;

INSERT INTO translators VALUES(31,'Ira','Davies');
INSERT INTO translators VALUES(32,'Ling','Weng');
INSERT INTO translators VALUES(33,'Kristian','Green');
INSERT INTO translators VALUES(34,'Roman','Edwards');

SELECT * FROM translators;

--INNER JOIN
SELECT b.id, b.title, a.first_name, a.last_name
FROM books b INNER JOIN authors a
ON b.author_id=a.id
ORDER BY b.id;

SELECT b.id, b.title,b.type, t.last_name AS Translator_name
FROM books b INNER JOIN translators t
ON b.translator_id=t.id
ORDER BY b.id;

--LEFT OUTER JOIN 
SELECT b.id, b.title, b.type, a.last_name AS author, t.last_name AS translator
FROM books b LEFT OUTER JOIN authors a
ON b.author_id=a.id
LEFT JOIN translators t
ON b.translator_id=t.id
ORDER BY b.id;

SELECT b.id, b.title, e.last_name AS editor
FROM books b
LEFT JOIN editors e
ON b.editor_id = e.id
ORDER BY b.id;

SELECT b.id, b.title, e.last_name AS editor
FROM books b
RIGHT JOIN editors e
ON b.editor_id = e.id
ORDER BY b.id;

SELECT b.id, b.title, e.last_name AS editor
FROM books b
RIGHT JOIN editors e
ON b.editor_id = e.id
ORDER BY b.id;

SELECT b.id, b.title, a.last_name AS author, e.last_name AS editor, t.last_name AS translator
FROM books b 
FULL JOIN authors a ON b.author_id=a.id
FULL JOIN editors e ON b.editor_id=e.id
FULL JOIN translators t ON b.translator_id=t.id
ORDER BY b.id;