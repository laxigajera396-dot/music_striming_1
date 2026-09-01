-- 1.Write an SQL query to display all products from a 'products' table and sort them by price in ascending order, similar to how Flipkart lists items from lowest to highest price.

use music_streaming_app;

create table products(
name varchar(100),
price int
); 

insert into products(name,price) values
("car",1200),
("barbie",1300),
("bear",2500),
("smart phone",2000),
("leptop",3000),
("head phone",4050),
("bed",3550),
("ring",5000),
("lipstick",4000);

select * from products;

select * from products order by price asc;

-- 2.Modify your previous query to show the top 5 most expensive products using ORDER BY with DESC and LIMIT.

select * from products order by price desc limit 5;

-- 3.Given a 'movies' table with columns 'title', 'release\_year', and 'rating', write an SQL query to list all movies sorted first by release\_year in descending order (latest first), then by rating in descending order (highest rated first).

create table movies(
tital varchar(100),
release_year int,
rating int
);

insert into movies (tital, release_year, rating)
values
('Avengers', 2024, 9),
('Dunki', 2023, 7),
('Jawan', 2023, 8),
('Animal', 2023, 6),
('Kalki', 2024, 8),
('Pathaan', 2023, 7);

select * from movies;

select * from movies 
order by release_year desc ,
rating desc; 

-- 4.Write an SQL query to display the first 10 restaurants from a 'restaurants' table, sorted alphabetically by name, just like Zomato's A-Z listing.\<br>\<br>\<em>\<strong>Hint:\</strong> Use ORDER BY with LIMIT.\</em>

select * from restaurants 
order by name asc
limit 10 ;

-- 5.Suppose you want to display the top 3 trending songs from a 'songs' table based on play\_count, but if two songs have the same play\_count, the more recently added song should come first. Write the SQL query to achieve this.\<br>\<br>\<em>\<strong>Hint:\</strong> Use ORDER BY with multiple columns.\</em>

CREATE TABLE songs (
    song_id INT PRIMARY KEY,
    title VARCHAR(100),
    play_count INT,
    added_date DATE
);

INSERT INTO songs (song_id, title, play_count, added_date)
VALUES
(1, 'Tum Hi Ho', 50000, '2025-01-15'),
(2, 'Kesariya', 75000, '2025-06-20'),
(3, 'Apna Bana Le', 75000, '2026-02-10'),
(4, 'Chaleya', 60000, '2026-04-05'),
(5, 'Heeriye', 90000, '2026-05-15'),
(6, 'O Maahi', 60000, '2026-07-20');

select * from songs order by play_count desc, added_date desc
limit 3;