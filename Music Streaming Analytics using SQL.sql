CREATE DATABASE spotify_analysis;
USE spotify_analysis;
CREATE TABLE spotify_songs(
track_name VARCHAR(200),
artist_name VARCHAR(200),
artist_count INT,
released_year INT,
released_month INT,
released_day INT,
spotify_playlists INT,
spotify_charts INT,
streams BIGINT,
apple_playlists INT,
apple_charts INT,
deezer_playlists INT,
deezer_charts INT,
shazam_charts INT,
bpm INT,
music_key VARCHAR(10),
mode VARCHAR(10),
danceability INT,
valence INT,
energy INT,
acousticness INT,
instrumentalness INT,
liveness INT,
speechiness INT
);
SELECT * FROM spotify_songs;

SELECT COUNT(*) FROM spotify_songs;
SELECT SUM(streams) FROM spotify_songs;
SELECT AVG(streams) FROM spotify_songs;
SELECT MAX(streams) FROM spotify_songs;
SELECT MIN(streams) FROM spotify_songs;
SELECT * FROM spotify_songs
WHERE released_year = 2023;
SELECT track_name, streams
FROM spotify_songs
WHERE streams > 1000000000;
SELECT track_name, released_year
FROM spotify_songs
WHERE released_year > 2020;
SELECT track_name, streams
FROM spotify_songs
ORDER BY streams DESC
LIMIT 10;
SELECT track_name, streams
FROM spotify_songs
ORDER BY streams ASC
LIMIT 10;
SELECT track_name, bpm
FROM spotify_songs
ORDER BY bpm DESC
LIMIT 10;
SELECT track_name, bpm
FROM spotify_songs
ORDER BY bpm ASC
LIMIT 10;
SELECT track_name, `danceability_%`
FROM spotify_songs
WHERE `danceability_%` > 80;
SELECT track_name, `energy_%`
FROM spotify_songs
WHERE `energy_%` > 80;
SELECT released_year, COUNT(*)
FROM spotify_songs
GROUP BY released_year;
SELECT released_year, SUM(streams)
FROM spotify_songs
GROUP BY released_year;
SELECT released_year, AVG(streams)
FROM spotify_songs
GROUP BY released_year;
SELECT `artist(s)_name`, COUNT(*)
FROM spotify_songs
GROUP BY `artist(s)_name`;
SELECT `artist(s)_name`, SUM(streams)
FROM spotify_songs
GROUP BY `artist(s)_name`
ORDER BY SUM(streams) DESC;
SELECT released_year, AVG(`danceability_%`)
FROM spotify_songs
GROUP BY released_year;
SELECT released_year, AVG(`energy_%`)
FROM spotify_songs
GROUP BY released_year;
SELECT released_year, AVG(bpm)
FROM spotify_songs
GROUP BY released_year;
SELECT `key` , COUNT(*)
FROM spotify_songs
GROUP BY `key` ;
SELECT mode, COUNT(*)
FROM spotify_songs
GROUP BY mode;
SELECT track_name, `in_spotify_playlists`
FROM spotify_songs
ORDER BY `in_spotify_playlists` DESC
LIMIT 10;
SELECT track_name, `in_apple_playlists`
FROM spotify_songs
ORDER BY `in_apple_playlists` DESC
LIMIT 10;
SELECT track_name, `in_deezer_playlists`
FROM spotify_songs
ORDER BY `in_deezer_playlists` DESC
LIMIT 10;
SELECT mode, AVG(streams)
FROM spotify_songs
GROUP BY mode;
SELECT `key`, AVG(streams)
FROM spotify_songs
GROUP BY `key`;
SELECT `artist(s)_name`, COUNT(*)
FROM spotify_songs
GROUP BY `artist(s)_name`
HAVING COUNT(*) > 5;
SELECT released_year, COUNT(*)
FROM spotify_songs
GROUP BY released_year
HAVING COUNT(*) > 50;
SELECT `artist(s)_name`, SUM(streams)
FROM spotify_songs
GROUP BY `artist(s)_name`
HAVING SUM(streams) > 5000000000;
SELECT track_name
FROM spotify_songs
WHERE `danceability_%` > 80 AND `energy_%` > 80;
SELECT track_name, `acousticness_%`
FROM spotify_songs
WHERE `acousticness_%` > 80;
SELECT track_name, `speechiness_%`
FROM spotify_songs
WHERE `speechiness_%` < 10;
SELECT track_name, `liveness_%`
FROM spotify_songs
WHERE `liveness_%` > 80;
SELECT track_name, artist_count
FROM spotify_songs
WHERE artist_count > 1;
SELECT track_name
FROM spotify_songs
WHERE released_month = 1;
SELECT track_name
FROM spotify_songs
WHERE released_month = 12;
SELECT track_name, `energy_%`
FROM spotify_songs
ORDER BY `energy_%` DESC
LIMIT 5;
SELECT track_name, `acousticness_%`
FROM spotify_songs
ORDER BY  `acousticness_%` DESC
LIMIT 5;
SELECT track_name
FROM spotify_songs
WHERE `instrumentalness_%` > 50;
SELECT track_name
FROM spotify_songs
WHERE `danceability_%` < 30;
SELECT track_name, streams
FROM spotify_songs
WHERE streams BETWEEN 100000000 AND 500000000;
SELECT track_name, streams,
RANK() OVER (ORDER BY streams DESC) AS rank_no
FROM spotify_songs;
SELECT track_name, streams,
DENSE_RANK() OVER (ORDER BY streams DESC)
FROM spotify_songs;
SELECT track_name, streams,
ROW_NUMBER() OVER (ORDER BY streams DESC)
FROM spotify_songs;
SELECT track_name,
SUM(streams) OVER (ORDER BY streams DESC)
FROM spotify_songs;
SELECT track_name,
streams / SUM(streams) OVER() * 100 AS percentage
FROM spotify_songs;
SELECT released_year, MAX(streams)
FROM spotify_songs
GROUP BY released_year;
SELECT `artist(s)_name`, AVG(streams)
FROM spotify_songs
GROUP BY `artist(s)_name`;
SELECT track_name, streams
FROM spotify_songs
WHERE streams >
(SELECT AVG(streams) FROM spotify_songs);
SELECT `artist(s)_name`
FROM spotify_songs
WHERE streams =
(SELECT MAX(streams) FROM spotify_songs);
SELECT track_name
FROM spotify_songs
WHERE bpm =
(SELECT MAX(bpm) FROM spotify_songs);
SELECT track_name
FROM spotify_songs
WHERE `energy_%` =
(SELECT MIN(`energy_%`) FROM spotify_songs);
SELECT *
FROM (
SELECT track_name, released_year, streams,
ROW_NUMBER() OVER (PARTITION BY released_year ORDER BY streams DESC) AS rn
FROM spotify_songs
) t
WHERE rn <= 3;
SELECT `artist(s)_name`, AVG(`danceability_%`)
FROM spotify_songs
GROUP BY `artist(s)_name`;
SELECT track_name, streams
FROM spotify_songs s
WHERE streams >
(SELECT AVG(streams)
FROM spotify_songs
WHERE  `artist(s)_name` = s. `artist(s)_name`);
SELECT  `artist(s)_name`,
AVG(streams) AS avg_streams
FROM spotify_songs
GROUP BY  `artist(s)_name`
ORDER BY avg_streams DESC
LIMIT 10;