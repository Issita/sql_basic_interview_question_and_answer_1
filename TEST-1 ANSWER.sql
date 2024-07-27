CREATE TABLE MYNTRA_ORDER(
ORDER_ID  INT,
ORDER_DATE DATE,
PRODUCT_NAME VARCHAR(20),
TOTAL_PRICE INT,
PAYMENT_METHOD VARCHAR(30)
);

SELECT * FROM MYNTRA_ORDER;

INSERT INTO MYNTRA_ORDER VALUES (1, '06-15-2024', 'LAPTOP', 200, 'CREDIT CARD');
INSERT INTO MYNTRA_ORDER VALUES (2, '07-16-2024', 'TABLET', 174, 'DEBIT CARD');
INSERT INTO MYNTRA_ORDER VALUES (3, '07-17-2024', 'MOUSE', 111, 'UPI');
INSERT INTO MYNTRA_ORDER VALUES (4, '07-18-2024', 'JEANS', 158, 'DEBIT CARD');
INSERT INTO MYNTRA_ORDER VALUES (5, '07-19-2024', 'SHIRTS', 173, 'CREDIT CARD');
INSERT INTO MYNTRA_ORDER VALUES (6, '07-20-2024', 'MOUSE', 146, 'UPI');
INSERT INTO MYNTRA_ORDER VALUES (7, '07-21-2024', 'LAPTOP', 160, 'DEBIT CARD');
INSERT INTO MYNTRA_ORDER VALUES (8, '07-22-2024', 'TABLET', 188, 'CREDIT CARD');
INSERT INTO MYNTRA_ORDER VALUES (9, '07-23-2024', 'JEANS', 135, 'UPI');
INSERT INTO MYNTRA_ORDER VALUES (10,'07-24-2024', 'SHIRTS', 200, 'DEBIT CARD');

SELECT * FROM MYNTRA_ORDER;


--Write a program to change data type order_date column to datetime data type?
ALTER TABLE MYNTRA_ORDER ALTER COLUMN ORDER_DATE DATETIME;

SELECT * FROM MYNTRA_ORDER;

--What is the difference between CHAR AND VARCHAR?

--Char datatype is used to store character strings of fixed length. 
--Varchar datatype is used to store character strings of variable length

--Why we use ALTER command?
--we used alter command to add, drop and change the datatype of the column

----What is the difference between DROP, DELETE and TRUNCATE?

--DROP: IT WILL DELETE THE TABLE PERMANENTELY FROM THE DATABASE
--DELETE: IT WILL DELETE ALL THE RECORDS OF THE TABLE BUT THE TABLE HEADERS REMAIN PRESENT IN THE TABLE
--		WE CAN DELETE THE RECORDS BASEED ON CRITERIA
--TRUNCATE: IT WILL DELETE THE RECORDES, BUT IT CANNOT DELETE THE RECORDS BASED CRITERIA


--What is constraints and what are constraints available and also write down difference between primary key and unique key?

--Constraints are the rules that we can apply on the type of data in a table
--CONSTRAINTS - NOT NULL, FOREIGN KEY, PRIMARY KEY, UNIQUE KEY, CHECK, DEFAULT

--DIFFERENCE BETWEEN PRIMARY KEY AND UNIQUE KEY
--PRIMARY KEY: IT IS UNIQUE IN NATURE
--			IT CANTOT CONTAIN ANY NULL VALUE
--			WE CAN ADD MULTIPLE PRIMARY KEY BY USING COMBINATION COLUMN
--UNIQUE KEY: IT IS UNIQUE IN NATURE
--			IT CAN CONTAIN ONLY ONE NULL VALUE


--Write a program to use primary key is the combination of (order_id and product_name)

CREATE TABLE MYNTRA_ORDER_1(
ORDER_ID INT ,
ORDER_DATE DATE,
PRODUCT_NAME VARCHAR(15),
TOTAL_PRICE DECIMAL(6,2),
PAYMENT_METHOD VARCHAR(20)
PRIMARY KEY (ORDER_ID, PRODUCT_NAME));


--How to get 5 random records from MYNTRA_ORDER table?
SELECT TOP 5 * FROM MYNTRA_ORDER ORDER BY NEWID();

--How to get bottom 5 records?
SELECT TOP 5 * FROM MYNTRA_ORDER ORDER BY ORDER_ID DESC;

--How to describe a database?
SELECT * FROM INFORMATION_SCHEMA.COLUMNS;

--How to get top 10% of records from MYNTRA_ORDER table?
SELECT TOP 10 PERCENT * FROM MYNTRA_ORDER;

--How update the values of CREDITCARD TO CC_CARD FROM PAYMENT_METHOD COLUMN?
UPDATE MYNTRA_ORDER
SET PAYMENT_METHOD = 'CC_CARD'
WHERE PAYMENT_METHOD = 'CREDIT CARD';

SELECT * FROM MYNTRA_ORDER;

--How to delete records from MYNTRA_ORDER where PRODUCT_NAME=Laptop?
DELETE FROM MYNTRA_ORDER
WHERE PRODUCT_NAME='LAPTOP';

SELECT * FROM MYNTRA_ORDER;

--Write a program to delete MYNTRA_ORDER?
DROP TABLE MYNTRA_ORDER;

--Write a program to get unique values of PRODUCT_NAME?
SELECT DISTINCT PRODUCT_NAME FROM MYNTRA_ORDER;

--HOW TO SEE THE NUMBER OF FIELDS/COLUMNS IN A TABLE?
SELECT COUNT (*) FROM INFORMATION_SCHEMA.COLUMNS;

--HOW TO SELECT RECORDS FROM THE ROW NUMBER 3 TO 5 FROM A TABLE?
SELECT * FROM MYNTRA_ORDER
WHERE ORDER_ID BETWEEN 3 AND 5;


SELECT * FROM MED_ALL;

--write a SQL query to find all records in the med_all table where the town starts with any letter from 'B' to 'H'?
SELECT * FROM MED_ALL WHERE TOWN LIKE '[B-H]%';

--write a SQL query to find all records in the MED_ALL table where the SPENT AMOUNT starts with '2' and ends with '6'?
SELECT * FROM MED_ALL WHERE [SPENT AMOUNT] LIKE '2%6';


--what is the difference between where and having?
--WHERE CLAUSE CAN BE USED WITH SELECT,INSERT AND UPDATE STATEMENT BUT HAVING CLAUSE IS USED ONLY USED WITH SELECT
--WHERE CLAUSE IS USED BEFORE AGGREATION AND HAVING CLAUSE IS USED AFTER AGGREATION

--What is the order of execution of SQL clause?
--FROM
--WHERE
--GROUP BY
--HAVING
--SELECT 
--DISTINCT
--ORDER BY
--LIMIT

--Write a program to get all records where town starts with any vowel?
SELECT * FROM MED_ALL where TOWN LIKE '[A,E,I,O,U,a,e,i,o,u]%';
select * from med_all;


--Find state_code with more than 3 customers?

select STATE_CODE,count(CUSTOMER_ID) as cust_more_3
from MED_ALL
group by STATE_CODE
having count(CUSTOMER_ID)>3
order by 1;

SELECT STATE_CODE
FROM MED_ALL
GROUP BY STATE_CODE
HAVING COUNT(*)>3;

SELECT * FROM MED_ALL;

--Find companies with an average age of customers greater than 40?

SELECT COMPANY,CUSTOMER_ID
FROM MED_ALL
GROUP BY Company,CUSTOMER_ID
HAVING AVG(AGE)>40;

--Find towns with a total number of trips greater than 20?
SELECT TOWN
FROM MED_ALL
GROUP BY TOWN
HAVING SUM(NO_OF_TRIPS)>20;


--Find companies where the average spent amount is greater than 100 and the total number of trips is greater
--than 10?

SELECT CUSTOMER_ID, COMPANY,NO_OF_TRIPS
FROM MED_ALL
GROUP BY CUSTOMER_ID, COMPANY,NO_OF_TRIPS
HAVING AVG([Spent amount])>100
AND SUM(NO_OF_TRIPS)>10;

SELECT * FROM MED_ALL;


--Find towns where the minimum spent amount is less than 50 and the average age of customers is greater than 30?

SELECT TOWN,[SPENT AMOUNT], AGE
FROM MED_ALL
GROUP BY TOWN,[SPENT AMOUNT], AGE
HAVING MIN([SPENT AMOUNT])<50
AND AVG(AGE)>30;



--Find genders where the total spent amount is greater than 500 and the count of customers is greater than 5?

SELECT GENDER,[SPENT AMOUNT],NO_OF_TRIPS
FROM MED_ALL
GROUP BY GENDER,[SPENT AMOUNT],NO_OF_TRIPS
HAVING SUM([Spent amount])>500
AND COUNT(NO_OF_TRIPS)>5;


SELECT * FROM MED_ALL;


--Find states where the total spent amount is greater than 200 and the maximum number of trips is greater than 10?
SELECT STATE_CODE, [SPENT AMOUNT], NO_OF_TRIPS
FROM MED_ALL
GROUP BY STATE_CODE, [SPENT AMOUNT], NO_OF_TRIPS
HAVING SUM([Spent amount])>200
AND MAX(NO_OF_TRIPS)>10;


--Find the total spent amount for each company, classifying them as 
--'High Spending' if the average spent amount is greater than 200 and 
--'Low Spending' otherwise. 
--Only include companies where the total number of trips is greater than 10?

SELECT 
COMPANY,
SUM([SPENT AMOUNT]) AS TOTAL_SPENT,
COUNT(*) AS TOTAL_TRIPS,
CASE
	WHEN SUM([SPENT AMOUNT])/COUNT(*) >200 THEN 'High Spending'
	ELSE 'Low Spending'
END AS AVG_SPENT_AMOUNT
FROM MED_ALL
GROUP BY COMPANY
HAVING COUNT(*)> 10;



--Find the average age of customers for each state, 
--categorizing them as 'Senior' if the average age is greater than 50 and 'Junior' otherwise. 
--Only include states where the total spent amount is greater than 300?

SELECT
STATE_CODE,
AVG(AGE) AS AVG_AGE,
SUM([SPENT AMOUNT]) AS TOTAL_SPENT,
CASE
	WHEN AVG(AGE) > 50 THEN 'SENIOR'
	ELSE 'JUNIOR'
END AS AGE_CATAGORY
FROM MED_ALL
GROUP BY STATE_CODE
HAVING SUM([SPENT AMOUNT]) > 300;