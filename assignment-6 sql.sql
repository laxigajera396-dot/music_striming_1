-- 1.Create a table called Orders with columns: order_id, user_id, payment_method, and amount. Insert at least 8 sample records representing different users and payment methods (like UPI, Card, Wallet, COD).
use music_streaming_app;

create table Orders1 (
    order_id int primary key,
    user_id int,
    payment_method varchar(20),
    amount int
);

insert into Orders1 (order_id, user_id, payment_method, amount)
values
(1, 101, 'UPI', 250),
(2, 102, 'Card', 500),
(3, 103, 'Wallet', 300),
(4, 101, 'UPI', 450),
(5, 104, 'COD', 600),
(6, 102, 'Card', 350),
(7, 105, 'Wallet', 200),
(8, 103, 'UPI', 700);

select * from Orders1;

-- 2.Write an SQL query to count how many orders were placed using each payment_method in the Orders table, similar to how Zomato shows payment breakdown in analytics.

select payment_method , count(payment_method) as total_orders
from Orders1
group by payment_method;

-- 3.Write an SQL query to find the total amount spent by each user_id in the Orders table. Display user_id and their total spend.

select user_id , sum(amount) as total_spand
from Orders1
group by user_id;

-- 4.Write an SQL query to show only those payment methods where the average order amount is greater than 300, using GROUP BY and HAVING.<br><br><em><strong>Hint:</strong> Use AVG(amount) in your HAVING clause.</em>

select payment_method , avg(amount) as avg_amount
from Orders1 
group by payment_method
having avg(amount) > 300;

-- 5.Explain the difference between WHERE and HAVING by giving one example query for each, using the Orders table. Your examples should show a scenario where WHERE and HAVING filter different things.

-- where:-
-- WHERE is used to filter individual rows before grouping.

select *
FROM Orders1
where amount > 300;

-- HAVING :-
-- HAVING is used to filter groups after GROUP BY.

select payment_method, avg(amount) as average_amount
from Orders1
group by payment_method
having avg(amount) > 300;
