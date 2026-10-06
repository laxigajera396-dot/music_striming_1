-- 1.
-- Create a SQL query using a subquery in the WHERE clause to find all restaurants from a 'Restaurants' table whose average rating is higher than the average rating of all restaurants in the city.

create table restaurants2 (
    id int primary key,
    name varchar(100),
    city varchar(100),
    rating int
);

insert into restaurants2 (id, name, city, rating)
values
(1, 'food hub', 'surat', 4.5),
(2, 'spice villa', 'surat', 4.2),
(3, 'pizza point', 'ahmedabad', 4.7),
(4, 'taste house', 'ahmedabad', 4.1),
(5, 'royal cafe', 'vadodara', 4.3),
(6, 'green kitchen', 'vadodara', 4.0);

select * from restaurants2;

select name,rating from restaurants2
where  rating > (select avg(rating) from restaurants2);


-- 2.
-- Write a SQL query that uses a subquery in the SELECT statement to display each user's name from a 'Users' table along with the total number of orders they have placed from an 'Orders' table, like a summary you might see in a Zomato user profile.

create table users1 (
    id int primary key,
    name varchar(100)
);

insert into users1 (id, name)
values
(1, 'laxi'),
(2, 'riya'),
(3, 'karan'),
(4, 'meera'),
(5, 'dev');

create table orders3 (
    id int primary key,
    user_id int,
    order_date date,
    total_amount int
);

insert into orders3 (id, user_id, order_date, total_amount)
values
(101, 1, '2026-01-10', 500),
(102, 1, '2026-02-15', 750),
(103, 1, '2026-03-20', 300),
(104, 2, '2026-01-25', 1200),
(105, 2, '2026-03-05', 800),
(106, 3, '2026-02-10', 450),
(107, 4, '2026-03-15', 900);

select * from orders3;
select  * from users1;

select u.name, (select count(o.user_id)from orders3 o
where u.id = o.user_id )
from users1 u;


-- 3.
-- Given a 'Movies' table and a 'Reviews' table, write a SQL query using IN with a subquery to list all movies that have at least one review with a rating of 5 stars, as seen in BookMyShow's top-rated section.

create table movies2 (
    id int primary key,
    title varchar(100),
    genre varchar(50)
);

insert into movies2 (id, title, genre)
values
(1, 'inception', 'sci-fi'),
(2, 'interstellar', 'sci-fi'),
(3, 'dangal', 'drama'),
(4, '3 idiots', 'comedy'),
(5, 'kgf', 'action'),
(6, 'pathaan', 'action');

create table reviews1 (
    id int primary key,
    movie_id int,
    username varchar(100),
    rating int
);

insert into reviews1 (id, movie_id, username, rating)
values
(1, 1, 'rahul', 5),
(2, 1, 'riya', 4),
(3, 2, 'karan', 5),
(4, 3, 'meera', 5),
(5, 4, 'dev', 4),
(6, 5, 'laxi', 3),
(7, 6, 'riya', 5),
(8, 2, 'dev', 4);


select * from movies2;
select * from reviews1;




SELECT title
FROM Movies2
WHERE id IN (
    SELECT id
    FROM Reviews
    WHERE rating = 5
);

-- 4.
-- Write a nested SQL query to find the names of all sellers from a 'Sellers' table on a Flipkart-style platform who have sold products in every category listed in a 'Categories' table.<br><br><em><strong>Hint:</strong> Use nested subqueries to compare seller's categories with the complete list of categories.</em>

create table sellers (
    id int primary key,
    name varchar(100)
);

insert into sellers (id, name)
values
(1, 'tech world'),
(2, 'fashion hub'),
(3, 'mega store'),
(4, 'smart sellers');


create table categories1 (
    id int primary key,
    category_name varchar(100)
);

insert into categories1 (id, category_name)
values
(1, 'electronics'),
(2, 'clothing'),
(3, 'shoes'),
(4, 'books');


create table products2 (
    id int primary key,
    seller_id int,
    category_id int,
    product_name varchar(100),
    price decimal(10,2)
);

insert into products2 (id, seller_id, category_id, product_name, price)
values
(1, 1, 1, 'laptop', 55000),
(2, 1, 2, 't-shirt', 799),

(3, 2, 2, 'shirt', 999),
(4, 2, 3, 'running shoes', 2499),

(5, 3, 1, 'mobile', 25000),
(6, 3, 2, 'jeans', 1800),
(7, 3, 3, 'sports shoes', 3000),
(8, 3, 4, 'python book', 599),

(9, 4, 1, 'headphones', 1999),
(10, 4, 2, 'hoodie', 1500),
(11, 4, 3, 'formal shoes', 2200);



select * from sellers;
select * from categories1;
select * from products2;



SELECT s.name
FROM Sellers s
JOIN Products2 p
    ON s.id = p.seller_id
GROUP BY s.id, s.name
HAVING COUNT(DISTINCT p.category_id) = (
    SELECT COUNT(*)
    FROM Categories
);