use music_streaming_app;


-- 1.Create two tables: Influencers (id, name) and Collaborations (id, influencer1_id, influencer2_id, collab_date). Write a SQL FULL JOIN query to list all influencers and show their collaboration partner names if any, including influencers with no collaborations.

create table  influencers (
    id int,
    name varchar(100)
);

insert into influencers (id, name)
values
(1, 'Aarav'),
(2, 'Riya'),
(3, 'Karan'),
(4, 'Meera'),
(5, 'Dev');

create table collaborations (
    id int ,
    influencer1_id int,
    influencer2_id int,
    collab_date date
);

insert into collaborations (id, influencer1_id, influencer2_id, collab_date)
values
(1, 1, 2, '2026-01-15'),
(2, 2, 3, '2026-02-10'),
(3, 1, 4, '2026-03-05'),
(4, 3, 5, '2026-04-20');

select *  from influencers;
select * from collaborations;

select i.name  as influencer_name,p.name as partner_name 
from influencers i 
left join collaborations c
on  c.influencer1_id = i.id 
left join influencers p 
on c.influencer2_id = p.id 
union 
select i.name  as influencer_name,p.name as partner_name 
from influencers i 
right  join collaborations c
on  c.influencer1_id = i.id 
left join influencers p 
on c.influencer2_id = p.id ;


-- 2.Using a SELF JOIN, write a query on a table called Playlists (id, user_id, playlist_name, parent_playlist_id) to display each playlist alongside its parent playlist name, similar to how Spotify shows nested playlists.<br><br><em><strong>Hint:</strong> Join Playlists with itself on parent_playlist_id = id.</em>

create table  playlists2 (
    id int,
    user_id int,
    playlist_name varchar(100),
    parent_playlist_id int
);

INSERT INTO playlists2 (id, user_id, playlist_name, parent_playlist_id)
values
(1, 101, 'My Music', NULL),
(2, 101, 'Workout', 1),
(3, 101, 'Morning Workout', 2),
(4, 102, 'Favorites', NULL),
(5, 102, 'Romantic Songs', 4),
(6, 103, 'Travel Songs', NULL);


select * from playlists2;

select p.playlist_name as playlist_name , p1.playlist_name as parent_playlist_name
from playlists2 p
inner join playlists2 p1
on p1.parent_playlist_id = p.id;


-- 3.Given three tables: Users (id, username), Orders (id, user_id, order_date), and Payments (id, order_id, amount), write a SQL query using multiple JOINs to display each username, their order date, and payment amount, showing all users even if they have no orders or payments.

create table users (
    id int,
    username varchar(100)
);


insert into users (id, username)
values
(1, 'laxi'),
(2, 'riya'),
(3, 'karan'),
(4, 'meera'),
(5, 'dev');

create table orders2 (
    id int,
    user_id int,
    order_date date 
);

insert into orders2 (id, user_id, order_date)
values
(101, 1, '2026-01-10'),
(102, 1, '2026-02-15'),
(103, 2, '2026-03-05'),
(104, 3, '2026-03-20');


create table payments (
    id int,
    order_id int,
    amount int
);

insert into  payments (id, order_id, amount)
values
(1, 101, 500.00),
(2, 102, 750.00),
(3, 103, 1200.00);

select * from users;
select * from orders2;
select * from payments;

select u.username, o.order_date,p.amount
from users u 
left join orders2 o
on u.id = o.user_id
left  join payments p
on o.id = p.order_id;

-- 4.You notice that your JOIN query between Zomato's Restaurants and Reviews tables is returning duplicate rows for some restaurants. Modify your query to eliminate duplicates and explain in one line why the duplicates were happening.<br><br><em><strong>Hint:</strong> Use DISTINCT or GROUP BY and consider the relationship between restaurants and reviews.</em>

create table  restaurants1 (
    id int,
    name varchar(100),
    city varchar(100)
);

insert into restaurants1 (id, name, city)
values
(1, 'Food Hub', 'Surat'),
(2, 'Spice Villa', 'Ahmedabad'),
(3, 'Pizza Point', 'Vadodara'),
(4, 'Taste House', 'Surat');

create table reviews (
    id int primary key,
    restaurant_id int,
    username varchar(100),
    rating int,
    review_text varchar(255)
);

insert into reviews (id, restaurant_id, username, rating, review_text)
values
(1, 1, 'rahul', 5, 'excellent food'),
(2, 1, 'riya', 4, 'good food'),
(3, 1, 'karan', 5, 'amazing'),
(4, 2, 'meera', 4, 'nice restaurant'),
(5, 3, 'dev', 5, 'great pizza');

select * from restaurants1;
select * from   reviews ;

select distinct r.name
from restaurants1 r
inner join reviews r1
on r.id = r1.restaurant_id;

-- 5.Write two different JOIN queries on a Products and Categories table (like Flipkart) to list all products with their category names, but use different join conditions in each. Briefly explain which join condition is more efficient and why.

create table categories (
    id int primary key,
    category_name varchar(100)
);

insert into categories (id, category_name)
values
(1, 'electronics'),
(2, 'clothing'),
(3, 'shoes'),
(4, 'books');

create table products1 (
    id int primary key,
    product_name varchar(100),
    category_id int,
    price decimal(10,2)
);

insert into products1 (id, product_name, category_id, price)
values
(1, 'laptop', 1, 55000),
(2, 't-shirt', 2, 799),
(3, 'running shoes', 3, 2499),
(4, 'python book', 4, 599),
(5, 'headphones', 1, 1999);

select * from categories;
select * from products1 ;

SELECT c.category_name, p.product_name
FROM categories c
INNER JOIN products1 p
ON p.category_id = c.id;

SELECT c.category_name,p.product_name
FROM categories c
left join products1 p
on c.id = p.category_id ;

-- Both queries use the same relationship but different JOIN types. INNER JOIN returns only matching products, while LEFT JOIN returns all products, including products without a matching category.