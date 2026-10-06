-- 1.Create a table named Playlists with columns: id, user_id, playlist_name, and total_likes. Insert at least 8 sample rows with different users and playlists, making sure some playlists have the same user_id.
use music_streaming_app;

CREATE TABLE Playlists1 (
    id INT,
    user_id INT,
    playlist_name VARCHAR(100),
    total_likes INT
);

INSERT INTO Playlists1
(id, user_id, playlist_name, total_likes)
VALUES
(1, 101, 'Bollywood Hits', 500),
(2, 102, 'Workout Songs', 300),
(3, 101, 'Romantic Songs', 450),
(4, 103, 'Chill Vibes', 250),
(5, 104, 'Party Songs', 700),
(6, 102, 'Punjabi Hits', 600),
(7, 105, 'Lo-fi Music', 200),
(8, 101, 'Gujarati Songs', 350),
(9, 105, 'Lo-fi Music', 200)
;

select * from playlists1;

-- 2.Write a SQL query using ROW_NUMBER() and the OVER() clause to assign a unique row number to each playlist, ordered by total_likes in descending order.

select * , row_number() over(order by total_likes asc) as row_num
from playlists1;

-- 3.Use the RANK() function with the OVER() clause to rank all playlists by total_likes, and display the playlist_name, user_id, total_likes, and their rank.

select * , rank() over(order by total_likes asc) as playlist_rank
from playlists1;


-- 4.Write a SQL query using DENSE_RANK() and PARTITION BY user_id to rank each user's playlists by total_likes, showing playlist_name, user_id, total_likes, and dense rank.<br><br><em><strong>Hint:</strong> This will show how popular each playlist is within each user's account, similar to how Spotify might rank your top playlists.</em>

select * , dense_rank() over(partition by user_id order by total_likes asc) 
from playlists1; 

-- 5.Imagine you want to show the top 2 playlists per user based on total_likes, like Spotify's 'Your Top Playlists' feature. Write a query using a window function to select only the top 2 playlists for each user.

select * from playlists1;
select * from(
select * , row_number() over(partition by user_id order by total_likes desc ) as rn from playlists1) x where rn=2 ;