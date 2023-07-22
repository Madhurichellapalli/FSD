/*Movies table*/
CREATE TABLE Movies(movieId int(10) PRIMARY KEY, title varchar(20), release_year varchar(20), director_Id int(10));
INSERT INTO Movies VALUES (101, "Orange", '2008', 2101),(102, "Dhruva", '2017', 2102),(103, "Nayak", '2013', 1103),(104, "RRR", '2022', 1104);

/*Directors table*/
CREATE TABLE Directors (director_Id int(10) PRIMARY KEY, director_name varchar(20));
INSERT INTO Directors VALUES (2101, "Bhaskar"),(2102, "Surender Reddy"),(1103, "V.V Vinayak"),(1105, "Rajamouli");

/*Genres table*/
CREATE TABLE Genres (genre_Id int(10) PRIMARY KEY, genre_name varchar(20));
INSERT INTO Genres VALUES (991,"Romance"),(992, "Thriller"),(993, "Action"),(994, "Drama");

/*Movie_Genres*/
CREATE TABLE Movie_Genres (movie_Id int(10) PRIMARY KEY, genre_Id int(10));
INSERT INTO Movie_Genres VALUES (101, 991),(102, 992),(103, 993);


/*Query to retrieve the movie title and the corresponding director name for all movies.*/
SELECT m.title, d.director_name FROM Movies m, Directors d where m.director_Id = d.director_Id;

/*Query to retrieve the movie title, release year, and the corresponding director name (if available) for all movies.*/
SELECT m.title, m.release_year, d.director_name FROM Movies m left join Directors d on m.director_Id = d.director_Id;

/*Query to retrieve the director name and the titles of the movies they have directed (if available) for all directors.*/
SELECT  d.director_name, m.title FROM Directors d left join Movies m on m.director_Id = d.director_Id;

/*Query to retrieve the movie title, release year, and the corresponding director name (if available) for all movies and directors.*/
SELECT m.title, m.release_year, d.director_name FROM Movies m left join Directors d on m.director_Id = d.director_Id
UNION
SELECT m.title, m.release_year, d.director_name from Movies m right join Directors d on m.director_Id = d.director_Id;

/*Write a query to retrieve the movie title and genre name for all combinations of movies and genres.*/
SELECT m.title, g.genre_name FROM Movies m join Movie_Genres mg on m.movieId = mg.movie_Id join Genres g 
on mg.genre_Id = g.genre_Id;
