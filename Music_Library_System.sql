create database music_library_management;
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    country VARCHAR(50),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Artists (
    artist_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    genre VARCHAR(50),
    debut_year INT,
    bio TEXT
);

CREATE TABLE Albums (
    album_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    artist_id INT,
    release_date DATE,
    genre VARCHAR(50),
    label VARCHAR(100),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);

CREATE TABLE Genres (
    genre_id INT PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    created_by VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Songs (
    song_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    duration TIME,
    artist_id INT,
    album_id INT,
    genre_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
    FOREIGN KEY (album_id) REFERENCES Albums(album_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

CREATE TABLE Playlists (
    playlist_id INT PRIMARY KEY,
    user_id INT,
    name VARCHAR(100),
    description TEXT,
    is_public BOOLEAN DEFAULT FALSE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Playlist_Songs (
    playlist_id INT,
    song_id INT,
    added_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    position INT,
    PRIMARY KEY (playlist_id, song_id),
    FOREIGN KEY (playlist_id) REFERENCES Playlists(playlist_id),
    FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);

CREATE TABLE Ratings (
    rating_id INT PRIMARY KEY,
    user_id INT,
    song_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review TEXT,
    rated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);


-- 1. Users (30 rows)
INSERT INTO Users (user_id, username, email, password, country, created_at) VALUES
(1,  'user1',  'user1@example.com',  'password1',  'Country1',  '2025-01-01 10:00:00'),
(2,  'user2',  'user2@example.com',  'password2',  'Country2',  '2025-01-02 10:00:00'),
(3,  'user3',  'user3@example.com',  'password3',  'Country3',  '2025-01-03 10:00:00'),
(4,  'user4',  'user4@example.com',  'password4',  'Country4',  '2025-01-04 10:00:00'),
(5,  'user5',  'user5@example.com',  'password5',  'Country5',  '2025-01-05 10:00:00'),
(6,  'user6',  'user6@example.com',  'password6',  'Country6',  '2025-01-06 10:00:00'),
(7,  'user7',  'user7@example.com',  'password7',  'Country7',  '2025-01-07 10:00:00'),
(8,  'user8',  'user8@example.com',  'password8',  'Country8',  '2025-01-08 10:00:00'),
(9,  'user9',  'user9@example.com',  'password9',  'Country9',  '2025-01-09 10:00:00'),
(10, 'user10', 'user10@example.com', 'password10', 'Country10', '2025-01-10 10:00:00'),
(11, 'user11', 'user11@example.com', 'password11', 'Country11', '2025-01-11 10:00:00'),
(12, 'user12', 'user12@example.com', 'password12', 'Country12', '2025-01-12 10:00:00'),
(13, 'user13', 'user13@example.com', 'password13', 'Country13', '2025-01-13 10:00:00'),
(14, 'user14', 'user14@example.com', 'password14', 'Country14', '2025-01-14 10:00:00'),
(15, 'user15', 'user15@example.com', 'password15', 'Country15', '2025-01-15 10:00:00'),
(16, 'user16', 'user16@example.com', 'password16', 'Country16', '2025-01-16 10:00:00'),
(17, 'user17', 'user17@example.com', 'password17', 'Country17', '2025-01-17 10:00:00'),
(18, 'user18', 'user18@example.com', 'password18', 'Country18', '2025-01-18 10:00:00'),
(19, 'user19', 'user19@example.com', 'password19', 'Country19', '2025-01-19 10:00:00'),
(20, 'user20', 'user20@example.com', 'password20', 'Country20', '2025-01-20 10:00:00'),
(21, 'user21', 'user21@example.com', 'password21', 'Country21', '2025-01-21 10:00:00'),
(22, 'user22', 'user22@example.com', 'password22', 'Country22', '2025-01-22 10:00:00'),
(23, 'user23', 'user23@example.com', 'password23', 'Country23', '2025-01-23 10:00:00'),
(24, 'user24', 'user24@example.com', 'password24', 'Country24', '2025-01-24 10:00:00'),
(25, 'user25', 'user25@example.com', 'password25', 'Country25', '2025-01-25 10:00:00'),
(26, 'user26', 'user26@example.com', 'password26', 'Country26', '2025-01-26 10:00:00'),
(27, 'user27', 'user27@example.com', 'password27', 'Country27', '2025-01-27 10:00:00'),
(28, 'user28', 'user28@example.com', 'password28', 'Country28', '2025-01-28 10:00:00'),
(29, 'user29', 'user29@example.com', 'password29', 'Country29', '2025-01-29 10:00:00'),
(30, 'user30', 'user30@example.com', 'password30', 'Country30', '2025-01-30 10:00:00');

-- 2. Artists (30 rows)
INSERT INTO Artists (artist_id, name, country, genre, debut_year, bio) VALUES
(1,  'Artist1',  'Country1',  'Genre1', 2001, 'Bio for Artist1'),
(2,  'Artist2',  'Country2',  'Genre2', 2002, 'Bio for Artist2'),
(3,  'Artist3',  'Country3',  'Genre3', 2003, 'Bio for Artist3'),
(4,  'Artist4',  'Country4',  'Genre4', 2004, 'Bio for Artist4'),
(5,  'Artist5',  'Country5',  'Genre5', 2005, 'Bio for Artist5'),
(6,  'Artist6',  'Country6',  'Genre6', 2006, 'Bio for Artist6'),
(7,  'Artist7',  'Country7',  'Genre7', 2007, 'Bio for Artist7'),
(8,  'Artist8',  'Country8',  'Genre8', 2008, 'Bio for Artist8'),
(9,  'Artist9',  'Country9',  'Genre9', 2009, 'Bio for Artist9'),
(10, 'Artist10', 'Country10', 'Genre10',2010, 'Bio for Artist10'),
(11, 'Artist11', 'Country11', 'Genre11',2011, 'Bio for Artist11'),
(12, 'Artist12', 'Country12', 'Genre12',2012, 'Bio for Artist12'),
(13, 'Artist13', 'Country13', 'Genre13',2013, 'Bio for Artist13'),
(14, 'Artist14', 'Country14', 'Genre14',2014, 'Bio for Artist14'),
(15, 'Artist15', 'Country15', 'Genre15',2015, 'Bio for Artist15'),
(16, 'Artist16', 'Country16', 'Genre16',2016, 'Bio for Artist16'),
(17, 'Artist17', 'Country17', 'Genre17',2017, 'Bio for Artist17'),
(18, 'Artist18', 'Country18', 'Genre18',2018, 'Bio for Artist18'),
(19, 'Artist19', 'Country19', 'Genre19',2019, 'Bio for Artist19'),
(20, 'Artist20', 'Country20', 'Genre20',2020, 'Bio for Artist20'),
(21, 'Artist21', 'Country21', 'Genre21',2005, 'Bio for Artist21'),
(22, 'Artist22', 'Country22', 'Genre22',2006, 'Bio for Artist22'),
(23, 'Artist23', 'Country23', 'Genre23',2007, 'Bio for Artist23'),
(24, 'Artist24', 'Country24', 'Genre24',2008, 'Bio for Artist24'),
(25, 'Artist25', 'Country25', 'Genre25',2009, 'Bio for Artist25'),
(26, 'Artist26', 'Country26', 'Genre26',2010, 'Bio for Artist26'),
(27, 'Artist27', 'Country27', 'Genre27',2011, 'Bio for Artist27'),
(28, 'Artist28', 'Country28', 'Genre28',2012, 'Bio for Artist28'),
(29, 'Artist29', 'Country29', 'Genre29',2013, 'Bio for Artist29'),
(30, 'Artist30', 'Country30', 'Genre30',2014, 'Bio for Artist30');



-- 3. Genres (30 rows)
INSERT INTO Genres (genre_id, name, description, created_by, created_at) VALUES
(1,  'Genre1',  'Description for Genre1',  'Admin', '2025-01-01 10:00:00'),
(2,  'Genre2',  'Description for Genre2',  'Admin', '2025-01-02 10:00:00'),
(3,  'Genre3',  'Description for Genre3',  'Admin', '2025-01-03 10:00:00'),
(4,  'Genre4',  'Description for Genre4',  'Admin', '2025-01-04 10:00:00'),
(5,  'Genre5',  'Description for Genre5',  'Admin', '2025-01-05 10:00:00'),
(6,  'Genre6',  'Description for Genre6',  'Admin', '2025-01-06 10:00:00'),
(7,  'Genre7',  'Description for Genre7',  'Admin', '2025-01-07 10:00:00'),
(8,  'Genre8',  'Description for Genre8',  'Admin', '2025-01-08 10:00:00'),
(9,  'Genre9',  'Description for Genre9',  'Admin', '2025-01-09 10:00:00'),
(10, 'Genre10', 'Description for Genre10', 'Admin', '2025-01-10 10:00:00'),
(11, 'Genre11', 'Description for Genre11', 'Admin', '2025-01-11 10:00:00'),
(12, 'Genre12', 'Description for Genre12', 'Admin', '2025-01-12 10:00:00'),
(13, 'Genre13', 'Description for Genre13', 'Admin', '2025-01-13 10:00:00'),
(14, 'Genre14', 'Description for Genre14', 'Admin', '2025-01-14 10:00:00'),
(15, 'Genre15', 'Description for Genre15', 'Admin', '2025-01-15 10:00:00'),
(16, 'Genre16', 'Description for Genre16', 'Admin', '2025-01-16 10:00:00'),
(17, 'Genre17', 'Description for Genre17', 'Admin', '2025-01-17 10:00:00'),
(18, 'Genre18', 'Description for Genre18', 'Admin', '2025-01-18 10:00:00'),
(19, 'Genre19', 'Description for Genre19', 'Admin', '2025-01-19 10:00:00'),
(20, 'Genre20', 'Description for Genre20', 'Admin', '2025-01-20 10:00:00'),
(21, 'Genre21', 'Description for Genre21', 'Admin', '2025-01-21 10:00:00'),
(22, 'Genre22', 'Description for Genre22', 'Admin', '2025-01-22 10:00:00'),
(23, 'Genre23', 'Description for Genre23', 'Admin', '2025-01-23 10:00:00'),
(24, 'Genre24', 'Description for Genre24', 'Admin', '2025-01-24 10:00:00'),
(25, 'Genre25', 'Description for Genre25', 'Admin', '2025-01-25 10:00:00'),
(26, 'Genre26', 'Description for Genre26', 'Admin', '2025-01-26 10:00:00'),
(27, 'Genre27', 'Description for Genre27', 'Admin', '2025-01-27 10:00:00'),
(28, 'Genre28', 'Description for Genre28', 'Admin', '2025-01-28 10:00:00'),
(29, 'Genre29', 'Description for Genre29', 'Admin', '2025-01-29 10:00:00'),
(30, 'Genre30', 'Description for Genre30', 'Admin', '2025-01-30 10:00:00');


-- 4. Albums (30 rows)
INSERT INTO Albums (album_id, title, artist_id, release_date, genre, label) VALUES
(1,  'Album1',  1,  '2022-01-01', 'Genre1',  'Label1'),
(2,  'Album2',  2,  '2022-01-02', 'Genre2',  'Label2'),
(3,  'Album3',  3,  '2022-01-03', 'Genre3',  'Label3'),
(4,  'Album4',  4,  '2022-01-04', 'Genre4',  'Label4'),
(5,  'Album5',  5,  '2022-01-05', 'Genre5',  'Label5'),
(6,  'Album6',  6,  '2022-01-06', 'Genre6',  'Label6'),
(7,  'Album7',  7,  '2022-01-07', 'Genre7',  'Label7'),
(8,  'Album8',  8,  '2022-01-08', 'Genre8',  'Label8'),
(9,  'Album9',  9,  '2022-01-09', 'Genre9',  'Label9'),
(10, 'Album10', 10, '2022-01-10', 'Genre10', 'Label10'),
(11, 'Album11', 11, '2022-01-11', 'Genre11', 'Label11'),
(12, 'Album12', 12, '2022-01-12', 'Genre12', 'Label12'),
(13, 'Album13', 13, '2022-01-13', 'Genre13', 'Label13'),
(14, 'Album14', 14, '2022-01-14', 'Genre14', 'Label14'),
(15, 'Album15', 15, '2022-01-15', 'Genre15', 'Label15'),
(16, 'Album16', 16, '2022-01-16', 'Genre16', 'Label16'),
(17, 'Album17', 17, '2022-01-17', 'Genre17', 'Label17'),
(18, 'Album18', 18, '2022-01-18', 'Genre18', 'Label18'),
(19, 'Album19', 19, '2022-01-19', 'Genre19', 'Label19'),
(20, 'Album20', 20, '2022-01-20', 'Genre20', 'Label20'),
(21, 'Album21', 21, '2022-01-21', 'Genre21', 'Label21'),
(22, 'Album22', 22, '2022-01-22', 'Genre22', 'Label22'),
(23, 'Album23', 23, '2022-01-23', 'Genre23', 'Label23'),
(24, 'Album24', 24, '2022-01-24', 'Genre24', 'Label24'),
(25, 'Album25', 25, '2022-01-25', 'Genre25', 'Label25'),
(26, 'Album26', 26, '2022-01-26', 'Genre26', 'Label26'),
(27, 'Album27', 27, '2022-01-27', 'Genre27', 'Label27'),
(28, 'Album28', 28, '2022-01-28', 'Genre28', 'Label28'),
(29, 'Album29', 29, '2022-01-29', 'Genre29', 'Label29'),
(30, 'Album30', 30, '2022-01-30', 'Genre30', 'Label30');


-- 5. Songs (30 rows)
INSERT INTO Songs (song_id, title, duration, artist_id, album_id, genre_id) VALUES
(1,  'Song1',  '00:03:01',  1,  1,  1),
(2,  'Song2',  '00:03:02',  2,  2,  2),
(3,  'Song3',  '00:03:03',  3,  3,  3),
(4,  'Song4',  '00:03:04',  4,  4,  4),
(5,  'Song5',  '00:03:05',  5,  5,  5),
(6,  'Song6',  '00:03:06',  6,  6,  6),
(7,  'Song7',  '00:03:07',  7,  7,  7),
(8,  'Song8',  '00:03:08',  8,  8,  8),
(9,  'Song9',  '00:03:09',  9,  9,  9),
(10, 'Song10', '00:03:10', 10, 10, 10),
(11, 'Song11', '00:03:11', 11, 11, 11),
(12, 'Song12', '00:03:12', 12, 12, 12),
(13, 'Song13', '00:03:13', 13, 13, 13),
(14, 'Song14', '00:03:14', 14, 14, 14),
(15, 'Song15', '00:03:15', 15, 15, 15),
(16, 'Song16', '00:03:16', 16, 16, 16),
(17, 'Song17', '00:03:17', 17, 17, 17),
(18, 'Song18', '00:03:18', 18, 18, 18),
(19, 'Song19', '00:03:19', 19, 19, 19),
(20, 'Song20', '00:03:20', 20, 20, 20),
(21, 'Song21', '00:03:21', 21, 21, 21),
(22, 'Song22', '00:03:22', 22, 22, 22),
(23, 'Song23', '00:03:23', 23, 23, 23),
(24, 'Song24', '00:03:24', 24, 24, 24),
(25, 'Song25', '00:03:25', 25, 25, 25),
(26, 'Song26', '00:03:26', 26, 26, 26),
(27, 'Song27', '00:03:27', 27, 27, 27),
(28, 'Song28', '00:03:28', 28, 28, 28),
(29, 'Song29', '00:03:29', 29, 29, 29),
(30, 'Song30', '00:03:30', 30, 30, 30);



-- 6. Playlists (30 rows)
INSERT INTO Playlists (playlist_id, user_id, name, description, is_public, created_at) VALUES
(1,  1,  'Playlist1',  'Description for Playlist1',  TRUE,  '2025-02-01 10:00:00'),
(2,  2,  'Playlist2',  'Description for Playlist2',  FALSE, '2025-02-01 10:00:00'),
(3,  3,  'Playlist3',  'Description for Playlist3',  TRUE,  '2025-02-01 10:00:00'),
(4,  4,  'Playlist4',  'Description for Playlist4',  FALSE, '2025-02-01 10:00:00'),
(5,  5,  'Playlist5',  'Description for Playlist5',  TRUE,  '2025-02-01 10:00:00'),
(6,  6,  'Playlist6',  'Description for Playlist6',  FALSE, '2025-02-01 10:00:00'),
(7,  7,  'Playlist7',  'Description for Playlist7',  TRUE,  '2025-02-01 10:00:00'),
(8,  8,  'Playlist8',  'Description for Playlist8',  FALSE, '2025-02-01 10:00:00'),
(9,  9,  'Playlist9',  'Description for Playlist9',  TRUE,  '2025-02-01 10:00:00'),
(10, 10, 'Playlist10', 'Description for Playlist10', FALSE, '2025-02-01 10:00:00'),
(11, 11, 'Playlist11', 'Description for Playlist11', TRUE,  '2025-02-01 10:00:00'),
(12, 12, 'Playlist12', 'Description for Playlist12', FALSE, '2025-02-01 10:00:00'),
(13, 13, 'Playlist13', 'Description for Playlist13', TRUE,  '2025-02-01 10:00:00'),
(14, 14, 'Playlist14', 'Description for Playlist14', FALSE, '2025-02-01 10:00:00'),
(15, 15, 'Playlist15', 'Description for Playlist15', TRUE,  '2025-02-01 10:00:00'),
(16, 16, 'Playlist16', 'Description for Playlist16', FALSE, '2025-02-01 10:00:00'),
(17, 17, 'Playlist17', 'Description for Playlist17', TRUE,  '2025-02-01 10:00:00'),
(18, 18, 'Playlist18', 'Description for Playlist18', FALSE, '2025-02-01 10:00:00'),
(19, 19, 'Playlist19', 'Description for Playlist19', TRUE,  '2025-02-01 10:00:00'),
(20, 20, 'Playlist20', 'Description for Playlist20', FALSE, '2025-02-01 10:00:00'),
(21, 21, 'Playlist21', 'Description for Playlist21', TRUE,  '2025-02-01 10:00:00'),
(22, 22, 'Playlist22', 'Description for Playlist22', FALSE, '2025-02-01 10:00:00'),
(23, 23, 'Playlist23', 'Description for Playlist23', TRUE,  '2025-02-01 10:00:00'),
(24, 24, 'Playlist24', 'Description for Playlist24', FALSE, '2025-02-01 10:00:00'),
(25, 25, 'Playlist25', 'Description for Playlist25', TRUE,  '2025-02-01 10:00:00'),
(26, 26, 'Playlist26', 'Description for Playlist26', FALSE, '2025-02-01 10:00:00'),
(27, 27, 'Playlist27', 'Description for Playlist27', TRUE,  '2025-02-01 10:00:00'),
(28, 28, 'Playlist28', 'Description for Playlist28', FALSE, '2025-02-01 10:00:00'),
(29, 29, 'Playlist29', 'Description for Playlist29', TRUE,  '2025-02-01 10:00:00'),
(30, 30, 'Playlist30', 'Description for Playlist30', FALSE, '2025-02-01 10:00:00');



-- 7. Playlist_Songs (30 rows)
INSERT INTO Playlist_Songs (playlist_id, song_id, added_at, position) VALUES
(1,  1,  '2025-02-01 11:00:00',  1),
(2,  2,  '2025-02-01 11:01:00',  2),
(3,  3,  '2025-02-01 11:02:00',  3),
(4,  4,  '2025-02-01 11:03:00',  4),
(5,  5,  '2025-02-01 11:04:00',  5),
(6,  6,  '2025-02-01 11:05:00',  6),
(7,  7,  '2025-02-01 11:06:00',  7),
(8,  8,  '2025-02-01 11:07:00',  8),
(9,  9,  '2025-02-01 11:08:00',  9),
(10, 10, '2025-02-01 11:09:00', 10),
(11, 11, '2025-02-01 11:10:00', 11),
(12, 12, '2025-02-01 11:11:00', 12),
(13, 13, '2025-02-01 11:12:00', 13),
(14, 14, '2025-02-01 11:13:00', 14),
(15, 15, '2025-02-01 11:14:00', 15),
(16, 16, '2025-02-01 11:15:00', 16),
(17, 17, '2025-02-01 11:16:00', 17),
(18, 18, '2025-02-01 11:17:00', 18),
(19, 19, '2025-02-01 11:18:00', 19),
(20, 20, '2025-02-01 11:19:00', 20),
(21, 21, '2025-02-01 11:20:00', 21),
(22, 22, '2025-02-01 11:21:00', 22),
(23, 23, '2025-02-01 11:22:00', 23),
(24, 24, '2025-02-01 11:23:00', 24),
(25, 25, '2025-02-01 11:24:00', 25),
(26, 26, '2025-02-01 11:25:00', 26),
(27, 27, '2025-02-01 11:26:00', 27),
(28, 28, '2025-02-01 11:27:00', 28),
(29, 29, '2025-02-01 11:28:00', 29),
(30, 30, '2025-02-01 11:29:00', 30);



-- Modified Ratings Data Format
INSERT INTO Ratings (rating_id, user_id, song_id, rating, review, rated_at) VALUES
(1, 1, 1, 4, 'Great song, loved the rhythm!', '2025-04-10 14:30:00'),
(2, 2, 2, 5, 'Perfect track for a workout!', '2025-04-11 15:00:00'),
(3, 3, 3, 3, 'Nice beat but could be more catchy.', '2025-04-12 16:00:00'),
(4, 4, 4, 2, 'Not my type of music, found it too slow.', '2025-04-13 17:00:00'),
(5, 5, 5, 5, 'Absolutely amazing! The vocals are on point.', '2025-04-14 18:00:00'),
(6, 6, 6, 4, 'Good song, but I expected more from the artist.', '2025-04-15 19:00:00'),
(7, 7, 7, 3, 'Decent track but lacks energy.', '2025-04-16 20:00:00'),
(8, 8, 8, 5, 'One of my favorite songs, can’t stop listening to it!', '2025-04-17 21:00:00'),
(9, 9, 9, 4, 'Nice tempo, enjoyed the melody.', '2025-04-18 22:00:00'),
(10, 10, 10, 1, 'Didn’t like it at all, the arrangement was poor.', '2025-04-19 23:00:00'),
(11, 11, 11, 4, 'Good track, but the chorus could be better.', '2025-04-20 10:00:00'),
(12, 12, 12, 3, 'It’s alright, not the best song by this artist.', '2025-04-21 11:00:00'),
(13, 13, 13, 5, 'Phenomenal! The lyrics are deep and touching.', '2025-04-22 12:00:00'),
(14, 14, 14, 4, 'Nice song, the beat was infectious!', '2025-04-23 13:00:00'),
(15, 15, 15, 2, 'Not my kind of music, very slow.', '2025-04-24 14:00:00'),
(16, 16, 16, 5, 'Such an upbeat and fun song, I can listen to it all day!', '2025-04-25 15:00:00'),
(17, 17, 17, 3, 'The song is okay, but didn’t stand out to me.', '2025-04-26 16:00:00'),
(18, 18, 18, 4, 'Good song, a bit repetitive though.', '2025-04-27 17:00:00'),
(19, 19, 19, 5, 'Incredible vocals and production, a masterpiece!', '2025-04-28 18:00:00'),
(20, 20, 20, 1, 'Horrible song, didn’t like it at all.', '2025-04-29 19:00:00'),
(21, 21, 21, 4, 'Great energy, nice build-up to the chorus.', '2025-04-30 20:00:00'),
(22, 22, 22, 2, 'The song didn’t capture my attention.', '2025-05-01 21:00:00'),
(23, 23, 23, 5, 'Can’t stop playing this, it’s so good!', '2025-05-02 22:00:00'),
(24, 24, 24, 3, 'It’s fine, just not my preferred style.', '2025-05-03 23:00:00'),
(25, 25, 25, 4, 'Very catchy, the lyrics are meaningful.', '2025-05-04 10:00:00'),
(26, 26, 26, 2, 'Was expecting more from this artist.', '2025-05-05 11:00:00'),
(27, 27, 27, 5, 'Amazing song, the production is top-notch!', '2025-05-06 12:00:00'),
(28, 28, 28, 1, 'Did not like the song at all, very disappointed.', '2025-05-07 13:00:00'),
(29, 29, 29, 4, 'Nice track, the rhythm is perfect for dancing.', '2025-05-08 14:00:00'),
(30, 30, 30, 5, 'I love this track, it never gets old!', '2025-05-09 15:00:00');



DELIMITER //
CREATE PROCEDURE GetSongsByArtist(IN artist_name VARCHAR(100))
BEGIN
    SELECT s.title, s.duration, a.name AS artist_name, al.title AS album_title, g.name AS genre
    FROM Songs s
    JOIN Artists a ON s.artist_id = a.artist_id
    JOIN Albums al ON s.album_id = al.album_id
    JOIN Genres g ON s.genre_id = g.genre_id
    WHERE a.name = artist_name;
END //
DELIMITER ;

CALL GetSongsByArtist('Adele');

DELIMITER //
CREATE PROCEDURE GetPlaylistsByUser(IN user_id INT)
BEGIN
    SELECT p.playlist_id, p.name, p.description, p.is_public
    FROM Playlists p
    WHERE p.user_id = user_id;
END //
DELIMITER ;

CALL GetPlaylistsByUser(1);

DELIMITER //
CREATE PROCEDURE AddNewSong(IN title VARCHAR(100), IN duration TIME, IN artist_id INT, IN album_id INT, IN genre_id INT)
BEGIN
    INSERT INTO Songs (title, duration, artist_id, album_id, genre_id)
    VALUES (title, duration, artist_id, album_id, genre_id);
END //
DELIMITER ;

CALL AddNewSong('New Song Title', '00:03:45', 1, 1, 2);

DELIMITER //
CREATE PROCEDURE UpdateSongRating(IN rating_id INT, IN rating INT, IN review TEXT)
BEGIN
    UPDATE Ratings
    SET rating = rating, review = review
    WHERE rating_id = rating_id;
END //
DELIMITER ;

CALL UpdateSongRating(1, 5, 'Amazing song with great lyrics!');



DELIMITER //
CREATE PROCEDURE GetSongsFromPlaylist(IN playlist_id INT)
BEGIN
    SELECT ps.position, s.title, s.duration
    FROM Playlist_Songs ps
    JOIN Songs s ON ps.song_id = s.song_id
    WHERE ps.playlist_id = playlist_id
    ORDER BY ps.position;
END //
DELIMITER ;

CALL GetSongsFromPlaylist(1);

DELIMITER //
CREATE PROCEDURE AddSongToPlaylist(IN playlist_id INT, IN song_id INT, IN position INT)
BEGIN
    INSERT INTO Playlist_Songs (playlist_id, song_id, position)
    VALUES (playlist_id, song_id, position);
END //
DELIMITER ;



CALL AddSongToPlaylist(1, 3, 1);



DELIMITER //
CREATE PROCEDURE GetSongRatings(IN song_id INT)
BEGIN
    SELECT r.rating, r.review, u.username
    FROM Ratings r
    JOIN Users u ON r.user_id = u.user_id
    WHERE r.song_id = song_id;
END //
DELIMITER ;
CALL GetSongRatings(1);

DELIMITER //
CREATE PROCEDURE GetUserInfo(IN user_id INT)
BEGIN
    SELECT username, email, country, created_at
    FROM Users
    WHERE user_id = user_id;
END //
DELIMITER ;

CALL GetUserInfo(1);



DELIMITER //
CREATE PROCEDURE GetSongsByGenre(IN genre_name VARCHAR(50))
BEGIN
    SELECT s.title, s.duration, g.name AS genre_name
    FROM Songs s
    JOIN Genres g ON s.genre_id = g.genre_id
    WHERE g.name = genre_name;
END //
DELIMITER ;

CALL GetSongsByGenre('Pop');

DELIMITER //
CREATE PROCEDURE GetAlbumsByArtist(IN artist_name VARCHAR(100))
BEGIN
    SELECT a.title AS album_title, a.release_date, a.genre, a.label
    FROM Albums a
    JOIN Artists ar ON a.artist_id = ar.artist_id
    WHERE ar.name = artist_name;
END //
DELIMITER ;

CALL GetAlbumsByArtist('Adele');
