-- 1. Create a table called Playlist with columns: id (INT, primary key), song_name (VARCHAR), artist (VARCHAR), and duration (INT, seconds). Insert a single row for your current favorite song.
use foodie_app;

CREATE TABLE Playlist (
    id INT PRIMARY KEY,
    song_name VARCHAR(100),
    artist VARCHAR(100),
    duration INT
);

INSERT INTO Playlist (id, song_name, artist, duration)
VALUES (1, 'Tum Hi Ho', 'Arijit Singh', 262);

select * from playlist;

-- 2. Insert 3 new rows into the Playlist table for songs you recently listened to on Spotify, including their song_name, artist, and duration.

INSERT INTO Playlist (id, song_name, artist, duration)
VALUES
(2, 'Excuses', 'AP Dhillon', 150),
(3, 'With You', 'AP Dhillon', 155),
(4, 'Kesariya', 'Arijit Singh', 268);


INSERT INTO Playlist (id, song_name, artist, duration)
VALUES (6, 'Tum Hi Ho', 'Arijit Singh', 110);


INSERT INTO Playlist (id, song_name, artist, duration)
VALUES (7, 'Tum Hi Ho', 'AP Dhillon', 220);

select * from playlist;

-- 3. Update the artist name for one of your Playlist entries to fix a typo (for example, change 'Arjit Singh' to 'Arijit Singh') using the UPDATE statement with a WHERE clause.

UPDATE Playlist
SET artist = 'Arjit Singh'
WHERE id = 4
AND artist = 'Arijit singh';

SELECT * 
FROM Playlist
WHERE id = 4;


-- 4. Delete a song from the Playlist table where the duration is less than 120 seconds using the DELETE statement and a WHERE clause.<br><br><em><strong>Hint:</strong> Make sure your WHERE clause is specific so you don’t accidentally delete all rows.</em>

DELETE FROM Playlist
WHERE duration < 120;

select * from playlist;


-- 5. Write an SQL statement that would update the song_name for all songs by 'AP Dhillon' in your Playlist to add '(Remix)' at the end of the name, but only if the duration is more than 180 seconds.<br><br><em><strong>Constraint:</strong> Combine UPDATE with WHERE to target only the correct rows.</em>

UPDATE Playlist
SET song_name = CONCAT(song_name, ' (Remix)')
WHERE artist = 'AP Dhillon'
AND duration > 180;

select * from playlist;
