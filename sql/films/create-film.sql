CREATE TABLE IF NOT EXISTS Films(
    Id serial PRIMARY KEY,
    Name VARCHAR(255) NOT NULL UNIQUE,
    Genre VARCHAR(50) NOT NULL,
    ReleaseYear INT NOT NULL CHECK (1800 <= releaseYear AND releaseYear <= 9999),
    Score INT NOT NULL CHECK (0 <= score AND score <= 10)
)

INSERT INTO Films (Name, Genre, ReleaseYear, Score)
VALUES
('The Shawshank Redemption', 'Drama', 1994, 9),
('The Godfather', 'Crime', 1972, 9),
('The Dark Knight', 'Action', 2008, 9)
('Alien', 'SciFi', 1979, 9),
('Total Recall', 'SciFi', 1990, 8),
('The Matrix', 'SciFi', 1999, 8),
('The Matrix Resurrections', 'SciFi', 2021, 5),
('The Matrix Reloaded', 'SciFi', 2003, 6),
('The Hunt for Red October', 'Thriller', 1990, 7),
('Misery', 'Thriller', 1990, 7),
('The Power Of The Dog', 'Western', 2021, 6),
('Hell or High Water', 'Western', 2016, 8),
('The Good the Bad and the Ugly', 'Western', 1966, 9),
('Unforgiven', 'Western', 1992, 7);

SELECT * from Films;
SELECT * FROM Films ORDER BY Films.Score DESC;
SELECT * FROM Films ORDER BY Films.ReleaseYear ASC;
SELECT * FROM Films WHERE 8 <= Films.Rating;
SELECT * FROM Films WHERE Films.Score <= 7;
SELECT * FROM Films WHERE Films.ReleaseYear = 1990;
SELECT * FROM Films WHERE Films.ReleaseYear < 2000;
SELECT * FROM Films WHERE 1990 < Films.ReleaseYear AND Films.ReleaseYear < 1999;
SELECT * FROM Films WHERE Films.Genre = 'SciFi';
SELECT * FROM Films WHERE Films.Genre = 'SciFi' OR  Films.Genre = 'Western';
SELECT * FROM Films WHERE Films.Genre != 'SciFi';
SELECT * FROM Films WHERE Films.Genre = 'Western' AND Films.ReleaseYear < 2000;
SELECT * FROM Films WHERE Films.Name LIKE '%Matrix%';

-- Extension 1 --
SELECT AVG(Score) FROM Films;
SELECT COUNT(*) FROM Films;
SELECT Films.Genre, AVG(Score) FROM Films GROUP BY Films.Genre;

-- Extension 2 --
CREATE TABLE IF NOT EXISTS Directors(
    Id SERIAL PRIMARY KEY,
    Name VARCHAR(50)
)

CREATE TABLE IF NOT EXISTS Films(
    Id serial PRIMARY KEY,
    Name VARCHAR(100) NOT NULL UNIQUE,
    Genre VARCHAR(50) NOT NULL,
    ReleaseYear INT NOT NULL CHECK (1800 <= releaseYear AND releaseYear <= 9999),
    Score INT NOT NULL CHECK (0 <= score AND score <= 10),
    DirectorId INT REFERENCES Directors(Id) NOT NULL
)

INSERT INTO Directors(Name)
values
('Dave'),
('Herman'),
('Nigel');

INSERT INTO Films(Name, Genre, ReleaseYear, Score, DirectorId)
values
('The Life of Loops', 'Documentary', 2024, 9, 1),
('Teaching Java to cats', 'Educational', 2008, 8, 1),
('The English Summer', 'Drama', 2014, 7, 1),
('It Depends', 'Adventure', 2024, 8, 1),
('How Streams Changed My Life', 'Biography', 2024, 9, 2),
('Revenge of the Exceptions', 'Adventure', 2019, 8, 2),
('How I Fell In Love With Records', 'Documentary', 2010, 5, 2),
('Repercussions of Learning the Wrong Language', 'Drama', 2010, 7, 3),
('The fall of .NET', 'Documentary', 2000, 8, 3);

SELECT Directors.Name, Films.Name, Films.Genre, Films.ReleaseYear, Films.Score
FROM Directors
INNER JOIN Films ON Directors.Id = Films.DirectorId;

-- Extension 3 --
SELECT Directors.Name, COUNT(*)
FROM Directors
INNER JOIN Films ON Films.Directorid = Directors.Id
GROUP BY Directors.Name;




