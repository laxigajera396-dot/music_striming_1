-- 1.Create a table called Restaurants with columns: id, name, cuisine, rating, and city. Insert at least 5 sample records representing real or fictional restaurants you might find on Zomato.

use music_streaming_app;

create  table restaurants(
id int,
name varchar(100),
cuisine varchar(100),
rating int,
city varchar(100)
);

insert into restaurants (id,name,cuisine,rating,city)values
(1,"swad","indian",3,"surat"),
(2,"sawd point","thai",4,"delhi"),
(3,"Pizza House","indian",2,"ahemdabad"),
(4,"Spice Garden","thai",4,"delhi"),
(5,"sawami restorent","indian",1,"mumbai"),
(6,"falafal house","chineses",5,"surat");

insert into restaurants (id,name,cuisine,rating,city)values(1,"lapinoz",'Chinese',2,"surta");

select * from restaurants;

-- 2.Write a SQL query to find all restaurants in the Restaurants table that have a rating greater than 4.0 and are located in either 'Ahmedabad' or 'Surat'.

select * from restaurants where rating > 4 and city in ("ahemdabad","surat");

-- 3.Using the LIKE operator, write a query to select all restaurants whose names start with 'Swa' (for example, 'Swagat', 'Swadisht') from the Restaurants table.<br><br><em><strong>Hint:</strong> Use LIKE 'Swa%'.</em>

select * from restaurants where name like "swa%"; 

-- 4.Write a SQL query using the BETWEEN keyword to find all restaurants in the Restaurants table with a rating between 3.5 and 4.5 (inclusive).

select * from restaurants 
where rating between 3.5 and 4.5;

-- 5.Write a query to find all restaurants whose cuisine is either 'Chinese', 'Italian', or 'South Indian' using the IN operator.

SELECT *
FROM Restaurants
WHERE cuisine IN ('Chinese', 'Italian', 'South Indian');