-- 1. Create two tables in your database: 'restaurants' (id, name, city) and 'dishes' (id, restaurant_id, dish_name, price). Insert at least 3 restaurants and 2-3 dishes for each restaurant.

use music_streaming_app;

create table restaurant (
    id int,
    name varchar(100),
    city varchar (100)
);

create table  dishes (
    id int ,
    restaurant_id int,
    dish_name varchar(100),
    price int 
);

insert into  restaurant (id, name, city)
values
(1, 'The Food Hub', 'Surat'),
(2, 'Spice Villa', 'Ahmedabad'),
(3, 'Pizza Point', 'Vadodara');

insert into dishes (id, restaurant_id, dish_name, price)
values
(1, 1, 'Paneer Tikka', 220),
(2, 1, 'Veg Biryani', 180),
(3, 1, 'Masala Dosa', 150),
(4, 2, 'Butter Paneer', 250),
(5, 2, 'Garlic Naan', 80),
(6, 2, 'Veg Thali', 200),
(7, 3, 'Margherita Pizza', 300),
(8, 3, 'Farmhouse Pizza', 350),
(9, 3, 'Garlic Bread', 150);

select * from restaurant;
select * from dishes;

-- 2. Write an SQL INNER JOIN query to display each dish along with its restaurant name and city, similar to how Zomato shows dish details with the restaurant info.

select d.dish_name,r.name,r.city
from restaurant r
inner join dishes d
on d.restaurant_id =r.id;

-- 3.Write an SQL LEFT JOIN query to list all restaurants and their dishes, showing restaurants even if they currently have no dishes on the menu.<br><br><em><strong>Hint:</strong> Use LEFT JOIN so restaurants without dishes still appear in the results with NULL for dish columns.</em>

select r.name,d.dish_name
from restaurant r 
left join dishes d
on r.id= d.restaurant_id ;

-- 4.Write an SQL RIGHT JOIN query to display all dishes and their restaurant names, including any dishes that might not be linked to a restaurant (simulate a data error where a dish has a restaurant_id that doesn't match any restaurant).

select r.name , d.dish_name 
from restaurant r
right join dishes d
on d.restaurant_id = r.id 
where r.id is  null;

-- 5.Given this scenario: You want to show a list of all playlists and the songs inside them, like Spotify. Explain which JOIN type (INNER, LEFT, or RIGHT) you would use to show all playlists, even if some are empty, and write the SQL query for it.


select p.playlist_name,s.song_name
from playlists p
left join songs s
on p.playlist_id = s.playlist_id;

