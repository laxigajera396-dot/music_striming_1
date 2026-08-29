-- 1.Create a table called Orders with columns: order_id, user_name, total_amount, and order_date. Insert 5 sample rows with different users and order amounts, including at least one NULL value for total_amount.

use music_streaming_app;

create table orders(
order_id int primary key,
user_name varchar(100),
total_amount int,
order_date int  
);

insert into orders (order_id,user_name,total_amount,order_date)
values
(1,"laxi",null,23),
(2,"jash",200,26),
(3,"kavy",800,28),
(4,"lavy",600,12),
(5,"jeni",500,8);

select * from orders;

-- 2.Write a SQL query to count how many orders were placed by each user in the Orders table, displaying user_name and the number of orders as order_count.

select user_name,count(user_name) as order_count
from orders
group by user_name;

-- 3.Write a SQL query to calculate the average total_amount of all orders in the Orders table, making sure to ignore any NULL values.

select avg(total_amount) from orders;

-- 4. Suppose you are building a Flipkart-style dashboard: Write a SQL query to find the highest and lowest order amounts (MAX and MIN) from the Orders table, and display both values in a single result row.

select max(total_amount) as 'highst amount',min(total_amount) as 'lowesr amount' from orders;

-- 5.Write a SQL query to calculate the total sales (SUM of total_amount) for all orders, but only include orders where total_amount is not NULL.<br><br><em><strong>Hint:</strong> Use a WHERE clause to filter out NULL values before applying the SUM function.</em>

select sum(total_amount) from orders;