-- =====================================================================
-- Unit 4 — Build and Fill Your Database
-- Client: Music
-- Database Applications Development · MCCC
--
-- Rename this file unit4_lastname.sql before you start.
-- Use unit4_Music_Data.xlsx for the columns, keys, and data rows.
--
-- Name: Gavin Waibel
-- =====================================================================


-- =====================================================================
-- PART 1 — DROP the tables (last table first)
-- Order: playlist_songs, songs, playlists, albums, artists
-- =====================================================================
DROP TABLE IF EXISTS playlist_songs;
DROP TABLE IF EXISTS songs;
DROP TABLE IF EXISTS playlists;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;



-- =====================================================================
-- PART 2 — CREATE the tables (in this order)
-- Put a comment above each table:  -- tablename: one row = ...
-- Add at least two CHECK rules of your own.
-- =====================================================================

-- artists: one row = one musical artist
CREATE TABLE artists (
	artist_id INTEGER PRIMARY KEY,
	artist_name TEXT NOT NULL,
	home_country TEXT NOT NULL
);

-- albums: one row = one music album
CREATE TABLE albums (
	album_id TEXT PRIMARY KEY,
	album_name TEXT NOT NULL,
	release_date TEXT CHECK (release_date LIKE '____-__-__' AND date(release_date) IS NOT NULL)
);

-- playlists: one row = one curated playlist
CREATE TABLE playlists (
	playlist_id TEXT PRIMARY KEY,
	playlist_name TEXT NOT NULL,
	playlist_genre TEXT NOT NULL
);

-- songs: one row = one individual song track
CREATE TABLE songs (
    track_id TEXT PRIMARY KEY,
    song_name TEXT NOT NULL,
    artist_id INTEGER,
	album_id TEXT NOT NULL,
    popularity INTEGER CHECK (popularity >= 1 AND popularity <= 100),
    duration_ms INTEGER,
    danceability REAL CHECK (danceability >= 0.00 AND danceability <= 1.00),
    energy REAL CHECK (energy >= 0.00 AND energy <= 1.00),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
	FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

-- playlist_songs: one row = one song entry on a specific playlist
CREATE TABLE playlist_songs (
	track_id TEXT NOT NULL,
	playlist_id TEXT NOT NULL,
	PRIMARY KEY (track_id, playlist_id),
	FOREIGN KEY (track_id) REFERENCES songs(track_id),
	FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id)
);



-- =====================================================================
-- PART 3 — INSERT the four rows for each table (same order as Part 2)
-- =====================================================================

-- artists
INSERT INTO artists (artist_id, artist_name, home_country)
VALUES
	(1, 'Ariana Grande', 'USA'),
	(2, 'Bad Bunny', 'Puerto Rico'),
	(3, 'Billie Eilish', 'USA'),
	(4, 'Camila Cabello', 'USA');

-- albums
INSERT INTO albums (album_id, album_name, release_date)
VALUES
	('5KOu62BJwwCJTfyyAaEbZk', 'Sweetener', '2018-08-17'),
	('3tx8gQqWbGwqIGZHqDNrGe', 'Sweetener', '2018-08-17'),
	('684W6NpKllEexqQlGqetCi', 'thank u, next', '2018-11-03'),
	('61c5zqfBCSPO1tb3DFbbFB', 'imagine', '2018-12-14');

-- playlists
INSERT INTO playlists (playlist_id, playlist_name, playlist_genre)
VALUES
	('2Aud8PXoTGcyY5esHu4Aaz', 'Post Teen Pop', 'pop'),
	('4Bi8VLtaSu0JILliif8IH6', 'Electropop 2019', 'pop'),
	('4JkkvMpVl4lSioqQjeAL0q', '2020 Hits & 2019 Hits – Top Global Tracks', 'latin'),
	('1fqkbjEACMlekdddm5aobE', 'Most Popular 2020 TOP 50', 'r&b');

-- songs
INSERT INTO songs (track_id, song_name, artist_id, popularity, duration_ms, danceability, energy, album_id)
VALUES
	('1ChPiAIS5RGNUQY4ohyfXG', 'God is a woman', 1, 46, 197547, 0.602, 0.658, '5KOu62BJwwCJTfyyAaEbZk'),
	('1xWH8zYtDeS9mW1JJG23VZ', 'R.E.M', 1, 69, 245667, 0.831, 0.485, '3tx8gQqWbGwqIGZHqDNrGe'),
	('5F66aRuoZMrrvc7U7eTR1y', 'R.E.M', 1, 39, 245667, 0.831, 0.485, '5KOu62BJwwCJTfyyAaEbZk'),
	('4OafepJy2teCjYJbvFE60J', 'breathin', 1, 78, 198160, 0.568, 0.656, '3tx8gQqWbGwqIGZHqDNrGe');

-- playlist_songs
INSERT INTO playlist_songs (playlist_id, track_id)
VALUES
	('2Aud8PXoTGcyY5esHu4Aaz', '1ChPiAIS5RGNUQY4ohyfXG'),
	('2Aud8PXoTGcyY5esHu4Aaz', '1xWH8zYtDeS9mW1JJG23VZ'),
	('2Aud8PXoTGcyY5esHu4Aaz', '5F66aRuoZMrrvc7U7eTR1y'),
	('4Bi8VLtaSu0JILliif8IH6', '4OafepJy2teCjYJbvFE60J');

-- =====================================================================
-- PART 4 — CHECK YOUR WORK: SELECT * FROM each table
-- =====================================================================
SELECT * FROM artists;
SELECT * FROM albums;
SELECT * FROM playlists;
SELECT * FROM songs;
SELECT * FROM playlist_songs;
