-- 1. Install MySQL or PostgreSQL on your system and create a new database named 'music_streaming_app' using the command line or GUI tool of your choice.

CREATE DATABASE music_streaming_app;

-- 2. Inside the 'music_streaming_app' database, create a table called 'playlists' with columns: playlist_id (integer, primary key), name (varchar), and created_by (varchar).

use music_streaming_app;

create table playlists (
playlist_id int primary key,
name varchar(100),
 created_by varchar(100));
 
-- 3. Insert three sample rows into the 'playlists' table representing playlists like 'Bollywood Hits', 'Chill Vibes', and 'Workout Mix', each created by a different user. 

insert into playlists (playlist_id,name,created_by) values(1,"Bollywood Hits","laxi");
insert into playlists (playlist_id,name,created_by) values(2,"chill vibes","jash");
insert into playlists (playlist_id,name,created_by) values(3,"workout mix","richa");
insert into playlists (playlist_id,name,created_by) values(4,"chill vibes","amit");

select * from playlists;

-- 4.Write an SQL SELECT query to display all playlists created by the user 'Amit' from the 'playlists' table.<br><br><em><strong>Hint:</strong> Use the WHERE clause to filter by the 'created_by' column.</em>

select * from playlists where created_by = "amit";

-- 5.Open ChatGPT or Copilot and ask it to explain the difference between a table, a row, and a column in SQL using an example from a food delivery app like Zomato. Paste the explanation you receive into your assignment.

In SQL, a table is used to store related data in an organized way. For example, in a food delivery app like Zomato, a table called restaurants can store information about different restaurants.

A column represents a specific type of information in the table, such as restaurant_id, restaurant_name, location, or rating.

A row represents one complete record in the table. For example, one row could contain information about a restaurant named “The Food Hub,” its location, and its rating.

For example:

restaurant_id	restaurant_name		location	rating
1				The Food Hub		Surat		4.5
2				Pizza Corner		Ahmedabad	4.2
