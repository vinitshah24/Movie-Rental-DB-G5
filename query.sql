DROP DATABASE IF EXISTS movie_rental_db;
CREATE DATABASE IF NOT EXISTS movie_rental_db;
USE movie_rental_db;

CREATE TABLE person(
person_id  INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
username VARCHAR(60) NOT NULL UNIQUE,
user_pass VARCHAR(50) NOT NULL,
first_name VARCHAR(80) NOT NULL,
last_name VARCHAR(80) NOT NULL,
birthdate DATE NULL,
street VARCHAR(100) NOT NULL,
city VARCHAR(65)NOT NULL,
state VARCHAR(50)NOT NULL,
zip INT,
phone VARCHAR(16) NOT NULL,
email  VARCHAR(70) NOT NULL,
data_joined DATE NOT NULL
);

INSERT INTO person (username, user_pass, first_name, last_name, birthdate, street, city, 
state, zip, phone, email, data_joined) 
VALUES 
('user01', MD5(CONCAT("user01pass","secret02")),'Tom','Curran','1993-10-02','North Blvd',
'Charlotte', 'NC', 28242,'769-888-9898','tom.curran@gmail.com','2019-11-08'),
('user02', MD5(CONCAT("user02pass","secret02")),'Sam','Smth','1992-11-06','City Blvd',
'Charlotte','NC', 28242,'539-328-9898','sam@gmail.com','2019-12-09'),
('user03', MD5(CONCAT("user03pass","secret02")),'Jake','Jackson','1993-12-04','East Blvd',
'Charlotte','NC', 23462,'935-248-9898','jake@gmail.com','2019-07-10'),
('user04', MD5(CONCAT("user04pass","secret02")),'Logan','Jackson','1992-06-04','West Blvd',
'Charlotte','NC', 24521,'245-248-9898','logan@gmail.com','2019-08-11'),
('user05', MD5(CONCAT("user05pass","secret02")),'Tay','Jackson','1998-08-04','South Blvd',
'Charlotte','NC', 35324,'115-248-0018','tay@gmail.com','2019-09-12');

CREATE TABLE user(
user_id INT PRIMARY KEY NOT NULL,
person_id INT,
FOREIGN KEY (person_id) REFERENCES person(person_id)
);

INSERT INTO user (user_id, person_id) 
VALUES (101,1), (102,2), (103,3);

CREATE TABLE admin (
admin_id  INT PRIMARY KEY NOT NULL,
person_id INT,
FOREIGN KEY (person_id) REFERENCES person(person_id)
);

INSERT INTO admin (admin_id,person_id) 
VALUES (201,4), (202, 5);

CREATE TABLE genre (
genre_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
genre_name VARCHAR(30) NOT NULL
);

INSERT INTO genre (genre_name) 
VALUES ('Comedy'), ('Horror'), ('Drama');

CREATE TABLE movie (
movie_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
movie_title VARCHAR(40) NOT NULL,
movie_release_date  DATE NOT NULL,
movie_details VARCHAR(200) NOT NULL
);

INSERT INTO movie (movie_title, movie_release_date, movie_details) 
VALUES 
('3 Idiots','2000-08-01',
'Student based comedy entertainer movie'),
('Conjuring','2008-01-08',
'Based on real life incident and horror packed entertainer'),
('Over the Moon', '2020-02-08', 
'An adventurous girl builds a rocket ship to meet a mythical goddess on moon');

CREATE TABLE movie_genre(
movie_genre_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
movie_id INT,
FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
genre_id INT,
FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);

INSERT INTO movie_genre (movie_id, genre_id)
VALUES (1,1), (2,2), (3,3);

CREATE TABLE actor (
actor_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
actor_first_name VARCHAR(80) NOT NULL,
actor_last_name VARCHAR(80) NOT NULL,
actor_born_date DATE NOT NULL,
actor_born_country VARCHAR(60) NOT NULL,
actor_death_date DATE NULL
);

INSERT INTO actor (actor_first_name, actor_last_name, actor_born_date, 
actor_born_country, actor_death_date) 
VALUES 
('Aamir','Khan','1993-04-05','India', NULL), 
('John','Carry','1987-03-03','USA', NULL), 
('Sam','Hugh','1949-02-01','UK', NULL);

CREATE TABLE movie_actor (
movie_actor_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
movie_id INT,
FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
actor_id  INT,
FOREIGN KEY (actor_id) REFERENCES actor(actor_id)
);

INSERT INTO movie_actor (movie_id, actor_id) 
VALUES (1,1), (2,2),(3,3);

CREATE TABLE director (
director_id  INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
director_first_name VARCHAR(80) NOT NULL,
director_last_name VARCHAR(80) NOT NULL,
director_born_date DATE NOT NULL,
director_born_country VARCHAR(60) NOT NULL,
director_death_date DATE NULL
);

INSERT INTO director 
(director_first_name, director_last_name, director_born_date, 
director_born_country, director_death_date) 
VALUES 
('Derek','Francis','1983-01-09','India','2009-02-07'),
('Steven','Spielberg','1999-06-01','USA', NULL),
('Susanna','White','1999-06-01','UK', NULL);

CREATE TABLE movie_director (
movie_director_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
movie_id INT,
FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
director_id INT,
FOREIGN KEY (director_id) REFERENCES director(director_id)
);

INSERT INTO movie_director (movie_id, director_id) 
VALUES (1,1), (2,2), (3,3);

-- SELECT * FROM movie_director;

CREATE TABLE ratings (
rating_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
rating_name VARCHAR(25) NOT NULL UNIQUE
);

INSERT INTO ratings (rating_name) 
VALUES ('Hit'), ('Average'), ('Flop');

CREATE TABLE movie_ratings (
movie_ratings_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
movie_id INT,
FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
rating_id INT,
FOREIGN KEY (rating_id) REFERENCES ratings(rating_id)
);

INSERT INTO movie_ratings (movie_id, rating_id) 
VALUES (1,1), (2,3), (3,2);

CREATE TABLE rental (
rental_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
user_id INT,
FOREIGN KEY (user_id) REFERENCES user(user_id),
movie_id INT,
FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
borrowed_date DATE NOT NULL,
return_date DATE NULL,
due_date DATE NOT NULL
);

INSERT INTO rental (user_id, movie_id, borrowed_date, return_date, due_date) 
VALUES
(101, 1, '2019-06-10', '2019-06-10', '2020-06-12'),
(102, 2, '2020-05-11', '2020-07-06', '2020-07-16'),
(103, 3, '2020-03-09', '2020-07-10', '2020-07-10');