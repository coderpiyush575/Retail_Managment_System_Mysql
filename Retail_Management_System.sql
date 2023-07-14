create database Akshar_Mart;
use Akshar_Mart;
/*creating tablee for product */
create table product(p_code int auto_increment, p_name varchar(255), price bigint, stock int, category varchar(100), primary key(p_code));
/*creating tablee for customer */
create table customer(P_ID int auto_increment,C_ID int, C_Name varchar(255), c_location varchar(50), c_phoneno bigint, primary key(C_ID), foreign key(P_ID) references product(p_code));
/*creating table for sales*/
drop table sales;
create table sales(S_ID int auto_increment,Order_Date varchar(50), Order_No varchar(10) unique,c_id int,c_name varchar(100),s_code int, p_name varchar(255), quantity int, price bigint, foreign key(s_id) references customer(p_ID));
describe customer;
select * from customer;
/* inserting the valuies in the respective tables */
insert into product(p_name, price, stock, category) values('Tulip',198,5,'Perfume'),
("Cornoto", 50, 21, "Ice-Cream"),
("Pen", 10, 52, "Stationary"),
("Lays", 10, 20, "Snacks"),
("Mayanoice", 90, 10, "Dip"),
('Jam',105,10,"Spread"),
('shampoo',5,90,'hair product'),
('axe', 210,4,'Perfume'),
('park avenue',901,2,'Perfume'),
('wattagirl',201,3,'Perfume'),
('Pencil',4,10, 'Stationary'),
('sharpner', 5,90, 'Stationary'),
('Sketch Pen',30,10,"Stationary"),
('Tape',15,30, "Stationary"),
('Paint',60,12,"Stationary"),
('chocolate',25,50,'Snacks'),
('biscuit',60,26,'Snacks'),
('mango',100,21,'fruits'),
('apple',120,9,'fruits'),
('kiwi',140,4,'fruits'),
('carrot',35,12,'vegetables'),
("onion",22,38,'vegetables'),
('tomato',21,15,'vegetables'),
('serum',90,4,'hair product'),
('conditioner',200,5,'hari product'),
('oil bottle',40, 2, 'kitchen utensil');
select * from product;
insert into customer(C_ID,C_Name, c_location, c_phoneno) values
(1111,"Nisha","Kerela",8392320),
(1212, 'Oliver','Kerela',4353891),
(1216,'Nila','Delhi',3323242),
(1246,"Vignesh",'Chennai', 1111212),
(1313, 'shiny','Maharashtra',5454543),
(1910,'Mohan','Mumbai',9023941),
(2123,'Piyush','Bombay',1253358),
(3452, "Alexander", "West Bengal", 1212134),
(3921,'Mukesh', "Manipur",4232321),
(5334,'Christy','Pakistan',2311111),
(9021,'Rithika','Kashmir',1121344),
(9212, "Jessica", "Banglore",1233435),
(9835,'Stephen','Chennai',1212133);
select * from customer;
insert into sales(Order_Date, Order_No, c_id, c_name,s_code, p_name, quantity, price) values
('24-07-2016','HM06',9212,'Jessica',11,'pencil',3,30),
('19-10-2016','HM09',3921,'Mukesh',17,'biscuits',	10,	600),
('30-10-2016','HM10',9875,'Stephen',2,'cornoto',	10,	500),
('12-4-2018',	'HM03',1212,'Oliver',20,'kiwi',	3,420),
('2-5-2018',	'HM05',1910,	'Mohan',20,'kiwi',	2,	280),
('20-09-2018','HM08',5334,'Chirsty',16,'chocolate',2,50),
('11-1-2019',	'HM07',1246,'Vignesh',19,'apple',5,600),
('15-03-2019','HM01',1910,'Mohan',5,'mayanoise',4,360),
('10-2-2021',	'HM04',1111,'Nisha',25,'conditioner',5,1000),
('12-2-2021','HM02',2123,'Piyush',3,'Pen',2,20);
select * from sales;
/*•	Write a query to add two new columns such as S_no and categories to the sales table.*/
ALTER TABLE sales
ADD COLUMN S_no INT,
ADD COLUMN categories VARCHAR(50);
/*•	Write a query to change the column type of stock in the product table to varchar*/
ALTER TABLE product
MODIFY COLUMN stock VARCHAR(50);
/*•	Write a query to change the table name from customer-to-customer details.*/
RENAME TABLE customer TO customer_details;
/*•	Write a query to drop the columns S_no and categories from the sales table.*/
ALTER TABLE sales
DROP COLUMN S_no,
DROP COLUMN categories;
/*•	Write a query to display order id, order date, price, and quantity from the sales table.*/
SELECT Order_No, s_code, Order_Date, price, quantity
FROM sales;
/*•	Write a query to display all the details in the product table if the category is stationary.*/
SELECT *
FROM product
WHERE category = 'stationary';
/*•	Write a query to display a unique category from the product table.*/
select distinct category from product;
/*Write a query to display the sales details if quantity is greater than 2 and price is lesser than 500 from the sales table.*/
select * from sales where quantity>2 AND quantity <500;
/*Write a query to display the customer’s name if the name ends with a.*/
SELECT C_Name FROM customer
WHERE C_Name LIKE '%a';
/*•	Write a query to display the product details in descending order of the price.*/
select * from product
order by price desc;
/*•	Write a query to display the product code and category from similar categories that are greater than or equal to 2.*/
SELECT p_code, category
FROM product
WHERE category IN (
    SELECT category
    FROM product
    GROUP BY category
    HAVING COUNT(*) >= 2
);

/*Write a query to display the mean of sales*/
select AVG(price) from sales;
/*•	Write a query to display the order number and the customer name to combine the results of the order and the customer tables including duplicate rows.*/
SELECT order_no,f_name
FROM sales
JOIN customer ON sales.s_id = customer.p_id;
ALTER TABLE sales
CHANGE c_name f_name varchar(20);


select * from product;
select* from customer;
select * from sales;
ALTER TABLE sales
ADD COLUMN c_id int;



