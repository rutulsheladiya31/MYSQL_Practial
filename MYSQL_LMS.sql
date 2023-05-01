create database store;
use store;

-- user table
create table customer(
customer_id int primary Key,
customer_name varchar(33),
mobileno varchar(15),
city varchar(20),
state varchar(20),
country varchar(20)
);


insert into customer values
(1,"Rutul",8320803080,"Surat","Gujarat","india"),
(2,"Ravi",9090987890,"Ahmedabad","Gujarat","india"),
(3,"Purvish",6789009876,"Vadodara","Gujarat","india"),
(4,"Mayur",9009009876,"Valsad","Gujarat","india"),
(5,"Nikunj",7896543212,"Rajkot","Gujarat","india"),
(6,"Kapil",6554789009,"Navsari","Gujarat","india"),
(7,"Dhenish",9087654321,"Ahmedabad","Gujarat","india"),
(8,"Sakshi",7890098765,"Surat","Gujarat","india"),
(9,"Sumit",6547890987,"Vapi","Gujarat","india"),
(10,"Harshit",8999098765,"Surat","Gujarat","india");

select * from customer;




-- product table

create table product (
product_id int,
product_name varchar(100),
price float,
primary key (product_id)
);


insert into product values
(101,"Bag",100),
(102,"Rolex Watch",500),
(103,"Samsung A50",7000),
(104,"Shoes",300),
(105,"Shirt",50),
(106,"Laptop",15000),
(107,"Pc",15000),
(108,"Keyboard",300),
(109,"Mouse",250),
(110,"Camera",100);

select * from product;


-- order table
create table order_tbl(
order_id int primary key,
customer_id int,
order_status varchar(50),
order_date datetime,
delivery_date date,
constraint foreign key(customer_id) references customer(customer_id)
);

insert into order_tbl values
(1,1,"delivered",now(),adddate(current_date() , interval 7 day)),
(2,7,"Undelivered",now(),adddate(current_date() , interval 6 day)),
(3,8,"delivered",now(),adddate(current_date() , interval 5 day)),
(4,4,"delivered",now(),adddate(current_date() , interval 2 day)),
(5,5,"Undelivered",now(),adddate(current_date() , interval 2 day)),
(6,4,"delivered",now(),adddate(current_date() , interval 2 day)),
(7,1,"Undelivered",now(),adddate(current_date() , interval 3 day)),
(8,1,"Undelivered",now(),adddate(current_date() , interval 4 day)),
(9,4,"delivered",now(),adddate(current_date() , interval 5 day));

select * from order_tbl;





-- order detail table
create table order_detail(
order_detail_id int primary key,
order_id int,
product_id int,
qty int,
price float(8,2),
constraint foreign key(product_id) references product(product_id),
constraint foreign key(order_id) references order_tbl(order_id)
);



-- create procedure for insert data & calculate price in order_details table.
DELIMITER //
create procedure order_detail(in order_detail_id int,in order_id int,in p_product_id int,in qty int)
BEGIN
  declare v_productPrice float;
 select price into v_productPrice from product where product_id=p_product_id;
 
 insert into order_detail values(order_detail_id,order_id,p_product_id,qty,qty*v_productPrice);
END //
DELIMITER ;
drop procedure order_detail;

call order_detail(18,3,101,2);

-- end procedure




















-- *Queries*
-- 1) Fetch all the User order list and include atleast following details in that.
select c.customer_id,c.customer_name,p.product_name,o.order_date,o.delivery_date
from customer c 
inner join order_tbl o ON c.customer_id = o.customer_id
inner join order_detail od ON o.order_id = od.order_id
inner join product p on od.product_id = p.product_id 
order by customer_id;



-- 2) Create summary report which provide information about

-- 1) All undelivered Orders.
select c.customer_id,c.customer_name,p.product_name,o.order_status
from customer c
inner join order_tbl o on c.customer_id = o.customer_id
inner join order_detail od on o.order_id = od.order_id
inner join product p on od.product_id = p.product_id
where order_status = "Undelivered" order by customer_id;

-- 2) 5 Most recent orders
-- select order_id,price from order_detail order by order_detail_id desc limit 5;

select c.customer_name,p.product_name,p.price from 
customer c 
inner join order_tbl o ON c.customer_id = o.customer_id
inner join order_detail od ON o.order_id = od.order_id
inner join product p ON od.product_id = p.product_id
order by order_detail_id desc limit 5;

-- 3)  Top 5 active users (Users having most number of orders)
-- select customer_id,count(customer_id) from order_tbl group by customer_id order by count(customer_id) desc limit 5;

select c.customer_name,count(o.customer_id) AS "Total Order"
from customer c
inner join order_tbl o on c.customer_id = o.customer_id
group by o.customer_id 
order by count(o.customer_id) desc
limit 5;


-- 4) Inactive users (Users who hasn’t done any order)

select c.customer_name
from customer c 
LEFT JOIN order_tbl o on c.customer_id = o.customer_id 
where o.customer_id IS NULL;

-- 5) Top 5 Most purchased products
select product_id,count(product_id) from order_detail group by product_id  order by count(product_id) desc limit 5;

select p.product_name , count(od.product_id) AS "Most Sold Product"
from product p
inner join order_detail od ON p.product_id = od.product_id
group by od.product_id
order by count(od.product_id) desc
limit 5;

-- 6) Most expensive and most chepest orders.
-- most expensive order
select od.order_id,c.customer_name,p.product_name,od.price
from order_detail od
JOIN customer c on od.order_id = c.customer_id
JOIN product p on od.product_id = p.product_id
where (od.order_id, od.price) IN 
(select order_id,max(price) from order_detail group by order_id)
order by od.order_id;

-- most chepest orders 
select od.order_id,c.customer_name,p.product_name,od.price
from order_detail od
JOIN customer c on od.order_id = c.customer_id
JOIN product p on od.product_id = p.product_id
where (od.order_id, od.price) IN 
(select order_id,min(price) from order_detail group by order_id)
order by od.order_id;

