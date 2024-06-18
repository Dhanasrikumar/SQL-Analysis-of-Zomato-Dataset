create database Zomato;
use Zomato;

Drop tables if they exist
 DROP TABLE goldusers_signup; -- Comment about dropping goldusers_signup table
DROP TABLE users; -- Comment about dropping users table
 DROP TABLE sales; -- Comment about dropping sales table
DROP TABLE product; -- Comment about dropping product table
CREATE TABLE goldusers_signup (
 userid integer,
gold_signup_date date
);
CREATE TABLE goldusers_signup (
 userid integer,
 gold_signup_date date
 );

CREATE TABLE users (
userid integer,
signup_date date
 );
CREATE TABLE sales (
 userid integer,
created_date date,
 pro CREATE TABLE product (
-> product_id integer,
-> product_name text,
-> price integer
-> );
duct_id integer
 );
mysql> INSERT INTO goldusers_signup (userid, gold_signup_date)
-> VALUES
-> (1, '2017-09-22'),
-> (3, '2017-04-21'); I
NSERT INTO users (userid, signup_date)
-> VALUES
-> (1, '2014-09-02'),
-> (2, '2015-01-15'),
-> (3, '2014-04-11');
INSERT INTO sales (userid, created_date, product_id)
-> VALUES
-> (1, '2017-04-19', 2),
-> (3, '2019-12-18', 1),
-> (2, '2020-07-20', 3),
-> (1, '2019-10-23', 2),
-> (1, '2018-03-19', 3),
-> (3, '2016-12-20', 2),
-> (1, '2016-11-09', 1),
-> (1, '2016-05-20', 3),
-> (2, '2017-09-24', 1),
-> (1, '2017-03-11', 2),
-> (1, '2016-03-11', 1),
-> (3, '2016-11-10', 1),
-> (3, '2017-12-07', 2),
-> (3, '2016-12-15', 2),
-> (2, '2017-11-08', 2),
-> (2, '2018-09-10', 3);

INSERT INTO product (product_id, product_name, price)
-> VALUES
-> (1, 'p1', 980),
-> (2, 'p2', 870),
-> (3, 'p3', 330);
SELECT * FROM sales;

select * from product;
select * from sales;
select * from users;
1.what is the toatl amout of the customer spend on zomato?
select sales.userid,sum(product.price) from sales join product on sales.product_id=product.product_id group by userid;

2.how many days customer visted?

select userid,count(created_date) from sales group by userid;

3.what was the first product purchased by each customer?


select * from(select *,rank() over(partition by userid order by created_date)visited_1st from sales)sales where visited_1st=1;

4.
SELECT product.product_id, product.product_name, COUNT(sales.product_id) AS product_count
    -> FROM sales 
    -> JOIN product 
    -> ON product.product_id = sales.product_id 
    -> GROUP BY product.product_id, product.product_name;
5.count of the max sales product?
 select count(sales.product_id),product.product_name from sales join produ
ct on product.product_id=sales.product_id group by product.product_id ,product.product_name;
6.most popular item saled?
 SELECT *,
    ->        RANK() OVER (PARTITION BY userid ORDER BY count_product DESC) AS rank_product
    -> FROM (
    ->     SELECT userid, product_id, COUNT(product_id) AS count_product
    ->     FROM sales
    ->     GROUP BY userid, product_id
    -> ) AS subquery_alias;
  7.1st product purchased after getting goldsignup?
  select goldusers_signup.userid,goldusers_signup.gold_signup_date ,sales.product_id from sales join goldusers_signup on goldusers_signup.userid=sales.userid and sales.created_date>goldusers_signup.gold_signup_date order by userid;
8.1st product purchased before getting goldsignup?
 select goldusers_signup.userid,goldusers_signup.gold_signup_date ,sales.product_id from sales join goldusers_signup on goldusers_signup.userid=sales.userid and sales.created_date<=goldusers_signup.gold_signup_date order by userid;
9.total number users and their buying times and price?
select sales.userid,count(sales.product_id)count_of_pid,sum(product.price)price from sales join product on sales.product_id = product.product_id group by sales.product_id,product.price,sales.userid order by sales.product_id;
10.rank the transaction of the customer?
 select *,rank() over(partition by userid order by created_date)rnk_transaction from sales;















