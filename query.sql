USE movie_rental_db;
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
('user1', MD5(CONCAT("user1pass","secret02")),'Tom','Curran','1993-10-02','North Blvd',
'Charlotte', 'NC', 28242,'769-888-9898','tom.curran@gmail.com','2019-11-08'),
('user2', MD5(CONCAT("user2pass","secret02")),'Sam','Smth','1992-11-06','City Blvd',
'Charlotte','NC', 28242,'539-328-9898','sam@gmail.com','2019-12-09'),
('user3', MD5(CONCAT("user3pass","secret02")),'Jake','Jackson','1993-12-04','East Blvd',
'Charlotte','NC', 23462,'935-248-9898','jake@gmail.com','2019-07-10'),
('user4', MD5(CONCAT("user4pass","secret02")),'Logan','Jackson','1992-06-04','West Blvd',
'Charlotte','NC', 24521,'245-248-9898','logan@gmail.com','2019-08-11'),
('user5', MD5(CONCAT("user5pass","secret02")),'Tay','Jackson','1998-08-04','South Blvd',
'Charlotte','NC', 35324,'115-248-0018','tay@gmail.com','2019-09-12');

CREATE TABLE user(
user_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
person_id INT,
FOREIGN KEY (person_id) REFERENCES person(person_id)
);
 
ALTER TABLE user AUTO_INCREMENT = 100;

INSERT INTO user (person_id) 
VALUES (1), (2), (3);

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
VALUES
("Action"), 
("Adventure"), 
("Comedy"), 
("Crime"), 
("Drama"), 
("Fantasy"), 
("Historical"), 
("Historical fiction"), 
("Horror"), 
("Magical realism"), 
("Mystery"), 
("Paranoid fiction"), 
("Philosophical"), 
("Political"), 
("Romance"), 
("Saga"), 
("Satire"), 
("Science fiction"), 
("Social"), 
("Speculative"), 
("Thriller"), 
("Urban"), 
("Western");

CREATE TABLE movie (
movie_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
movie_title VARCHAR(100) NOT NULL,
movie_release_date  DATE NOT NULL,
movie_details VARCHAR(200) NOT NULL
);

INSERT INTO movie (movie_title, movie_release_date, movie_details) 
VALUES 
("Bad Girls Go To Hell", "2015-03-29", "augue a suscipit nulla elit"),
("Herr Lehmann", "2020-01-27", "vel lectus in quam fringilla"),
("Puff, Puff, Pass", "2020-07-27", "convallis nulla neque libero convallis"),
("12:01", "2015-03-24", "ultrices phasellus id sapien in"),
("Dandelion", "2017-08-31", "at vulputate vitae nisl aenean"),
("Easy Virtue", "2020-06-29", "donec dapibus duis at velit"),
("Scotland, Pa.", "2019-03-03", "dolor quis odio consequat varius"),
("Return of the Secaucus 7", "2018-11-15", "justo in blandit ultrices enim"),
("Confetti", "2020-05-29", "turpis donec posuere metus vitae"),
("Witchboard", "2018-04-17", "orci luctus et ultrices posuere"),
("Maidentrip", "2015-08-09", "est lacinia nisi venenatis tristique"),
("Intruder, The (Lintrus)", "2016-10-22", "euismod scelerisque quam turpis adipiscing"),
("Att stjäla en tjuv", "2019-08-20", "libero ut massa volutpat convallis"),
("Braddock: Missing in Action III", "2016-04-04", "blandit non interdum in ante"),
("Murder Over New York", "2016-11-12", "sapien varius ut blandit non"),
("Voices", "2018-08-24", "enim sit amet nunc viverra"),
("Duel in the Sun", "2015-11-09", "volutpat sapien arcu sed augue"),
("Hot Shots! Part Deux", "2014-01-08", "volutpat in congue etiam justo"),
("Man of the East", "2017-09-22", "augue vestibulum rutrum rutrum neque"),
("Symmetry (Symetria)", "2014-01-09", "auctor gravida sem praesent id"),
("Secret Glory, The", "2015-12-01", "nulla neque libero convallis eget"),
("Who Killed Bambi? (Qui a tué Bambi?)", "2015-07-11", "pellentesque at nulla suspendisse potenti"),
("Grease", "2015-01-04", "proin at turpis a pede"),
("Special 26", "2020-06-22", "neque aenean auctor gravida sem"),
("And God Created Woman", "2015-07-07", "lectus pellentesque at nulla suspendisse"),
("Snow Cake", "2015-03-20", "integer ac neque duis bibendum"),
("Shutter Island", "2018-04-27", "nibh quisque id justo sit"),
("Tür, Die (Door, The)", "2016-06-30", "potenti in eleifend quam a"),
("Lourdes", "2018-04-29", "etiam pretium iaculis justo in"),
("David Cross: Bigger & Blackerer", "2014-11-02", "sapien non mi integer ac"),
("Caliber 9", "2019-10-02", "faucibus orci luctus et ultrices"),
("Hero", "2016-09-26", "et ultrices posuere cubilia curae"),
("Extraterrestrial", "2015-11-07", "tortor id nulla ultrices aliquet"),
("Tinker Tailor Soldier Spy", "2020-03-06", "consectetuer adipiscing elit proin interdum"),
("Yanks", "2016-11-08", "nam nulla integer pede justo"),
("Fall", "2014-03-25", "sapien cursus vestibulum proin eu"),
("Sweet Land", "2018-03-05", "amet turpis elementum ligula vehicula"),
("When in Rome", "2015-06-18", "morbi quis tortor id nulla"),
("Rimini, Rimini: A Year Later", "2016-02-21", "tempus vivamus in felis eu"),
("Earth to Echo", "2015-06-05", "convallis nunc proin at turpis"),
("Out for Justice", "2016-10-20", "quisque arcu libero rutrum ac"),
("Vie en Rose, La (Môme, La)", "2017-01-13", "in lectus pellentesque at nulla"),
("Lady Vanishes, The", "2016-11-12", "in purus eu magna vulputate"),
("Metropolis", "2018-04-23", "leo maecenas pulvinar lobortis est"),
("Heaven Help Us", "2017-10-24", "sed interdum venenatis turpis enim"),
("Woman In Berlin, A (Anonyma - Eine Frau in Berlin)", "2016-04-01", "morbi vel lectus in quam"),
("Quiet as a Mouse (Muxmäuschenstill)", "2014-10-21", "eros viverra eget congue eget"),
("At Close Range", "2014-12-05", "ac consequat metus sapien ut"),
("Family Tree", "2017-11-10", "quis augue luctus tincidunt nulla"),
("Prince Avalanche", "2019-03-01", "vestibulum ante ipsum primis in"),
("Citadel", "2019-04-23", "id pretium iaculis diam erat"),
("Heartbreak Hotel", "2016-05-05", "lorem vitae mattis nibh ligula"),
("Attack of the 50 Foot Woman", "2016-10-24", "morbi sem mauris laoreet ut"),
("Raw Deal", "2018-12-12", "sapien urna pretium nisl ut"),
("Rent", "2019-02-28", "eros elementum pellentesque quisque porta"),
("Children of the Corn IV: The Gathering", "2015-06-12", "ac neque duis bibendum morbi"),
("Morning Patrol (Proini peripolos)", "2018-02-05", "sociis natoque penatibus et magnis"),
("Monster Club, The", "2014-10-15", "sem fusce consequat nulla nisl"),
("Liberty Heights", "2018-12-14", "velit eu est congue elementum"),
("Minority Report", "2020-04-23", "non pretium quis lectus suspendisse"),
("Jurassic Park III", "2016-10-13", "mus etiam vel augue vestibulum"),
("Normal", "2018-01-24", "vel nulla eget eros elementum"),
("The Beaver Trilogy", "2015-06-21", "nisl ut volutpat sapien arcu"),
("Double Trouble", "2020-08-18", "tempus vivamus in felis eu"),
("Ascension", "2018-01-23", "semper interdum mauris ullamcorper purus"),
("Climb, The", "2017-11-05", "sed vel enim sit amet"),
("Nothing in Common", "2015-09-04", "rutrum ac lobortis vel dapibus"),
("Watercolors", "2017-08-28", "elit sodales scelerisque mauris sit"),
("Brother 2 (Brat 2)", "2017-04-10", "diam vitae quam suspendisse potenti"),
("Nothing Personal", "2020-06-05", "id nulla ultrices aliquet maecenas"),
("Kids of Survival", "2016-05-22", "ante vel ipsum praesent blandit"),
("Panic", "2017-04-23", "erat tortor sollicitudin mi sit"),
("Brooklyn Bridge", "2018-01-18", "ornare imperdiet sapien urna pretium"),
("Once Were Warriors", "2017-09-12", "tincidunt nulla mollis molestie lorem"),
("They All Laughed", "2017-04-20", "id luctus nec molestie sed"),
("Boondock Saints, The", "2019-06-13", "condimentum id luctus nec molestie"),
("Fun is Beautiful", "2015-07-25", "pellentesque quisque porta volutpat erat"),
("Fatso", "2020-04-23", "sed augue aliquam erat volutpat"),
("Society", "2017-09-24", "in tempus sit amet sem"),
("Locked Out (Enfermés dehors)", "2014-07-29", "eget nunc donec quis orci"),
("Italian, The (Italianetz)", "2015-11-18", "nulla nisl nunc nisl duis"),
("El Dorado", "2020-10-26", "ante ipsum primis in faucibus"),
("Henry Fool", "2020-10-08", "in leo maecenas pulvinar lobortis"),
("King of Texas", "2020-01-08", "habitasse platea dictumst etiam faucibus"),
("Aint in It for My Health: A Film About Levon Helm", "2017-03-07", "proin risus praesent lectus vestibulum"),
("D.O.A.", "2016-05-03", "dapibus dolor vel est donec"),
("Dadetown", "2017-03-07", "morbi quis tortor id nulla"),
("First Family", "2018-06-02", "enim sit amet nunc viverra"),
("Red Chapel (Røde kapel)", "2016-08-26", "eros viverra eget congue eget"),
("White Palms (Fehér tenyér)", "2018-01-30", "platea dictumst aliquam augue quam"),
("Ragamuffin", "2019-02-17", "quam sapien varius ut blandit"),
("Whatever Lola Wants", "2016-08-18", "maecenas rhoncus aliquam lacus morbi"),
("Picnic at Hanging Rock", "2015-01-30", "integer non velit donec diam"),
("Fährmann Maria", "2019-01-17", "maecenas rhoncus aliquam lacus morbi"),
("Outfoxed: Rupert Murdochs War on Journalism", "2015-10-04", "eget eros elementum pellentesque quisque"),
("Women, The", "2016-06-10", "posuere cubilia curae duis faucibus"),
("Ip Man", "2018-03-01", "blandit ultrices enim lorem ipsum"),
("Codependent Lesbian Space Alien Seeks Same", "2015-08-25", "pellentesque at nulla suspendisse potenti"),
("Yellow Sea, The (a.k.a. The Murderer) (Hwanghae)", "2020-03-14", "accumsan odio curabitur convallis duis"),
("Long Dark Hall, The", "2015-06-05", "quam a odio in hac");

CREATE TABLE movie_genre(
movie_genre_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
movie_id INT,
FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
genre_id INT,
FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);

INSERT INTO movie_genre (movie_id, genre_id)
VALUES
(1, 15),(2, 7),(3, 1),(4, 3),(5, 5),(6, 8),(7, 19),(8, 1),(9, 13),(10, 19),(11, 16),
(12, 18),(13, 15),(14, 2),(15, 17),(16, 16),(17, 7),(18, 21),(19, 20),(20, 12),(21, 14),
(22, 3),(23, 10),(24, 21),(25, 18),(26, 3),(27, 10),(28, 11),(29, 17),(30, 6),(31, 19),
(32, 10),(33, 20),(34, 14),(35, 3),(36, 20),(37, 15),(38, 10),(39, 2),(40, 7),(41, 23),
(42, 1),(43, 6),(44, 14),(45, 2),(46, 6),(47, 9),(48, 15),(49, 10),(50, 23),(51, 11),
(52, 1),(53, 1),(54, 15),(55, 20),(56, 6),(57, 14),(58, 15),(59, 23),(60, 15),(61, 20),
(62, 11),(63, 8),(64, 4),(65, 23),(66, 14),(67, 8),(68, 8),(69, 17),(70, 21),(71, 14),
(72, 1),(73, 1),(74, 14),(75, 22),(76, 14),(77, 10),(78, 7),(79, 2),(80, 22),(81, 19),
(82, 12),(83, 5),(84, 13),(85, 3),(86, 2),(87, 21),(88, 19),(89, 23),(90, 13),(91, 22),
(92, 10), (93, 21),(94, 14),(95, 8),(96, 17),(97, 15),(98, 17),(99, 1),(100, 1);


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
('Towney', 'Langelay', '1981-04-25', 'USAraine', '2014-01-22'),
('Lane', 'Climer', '1991-06-21', 'Poland', '2016-12-18'),
('Bride', 'Mearing', '1990-08-22', 'USA', '2012-04-24'),
('Ivar', 'Sampey', '1982-06-27', 'Cuba', '2019-04-07'),
('Fonzie', 'Rewcassell', '1987-03-24', 'Brazil', '2011-03-09'),
('Aloise', 'Croix', '1984-05-05', 'UK', '2017-12-24'),
('Calhoun', 'Dowsing', '1999-07-21', 'Isle of Man', '2012-11-18'),
('Saudra', 'Sambiedge', '1990-07-15', 'Peru', '2012-08-25'),
('Sheila-kathryn', 'Crafts', '1995-03-31', 'Czech Republic', '2011-05-19'),
('Dewitt', 'Spillman', '1996-12-11', 'Peru', '2013-01-05'),
('Clive', 'Wase', '1987-09-01', 'Argentina', '2011-11-19'),
('Cahra', 'Vernham', '1993-02-12', 'Brazil', '2011-12-10'),
('Tandy', 'Temperton', '1983-05-05', 'Colombia', '2010-11-16'),
('Nataline', 'Asch', '1999-10-17', 'Jamaica', '2019-05-05'),
('Sully', 'Immins', '1994-06-30', 'Guatemala', '2011-07-20'),
('Sisely', 'Geraldo', '1989-04-10', 'Brazil', '2018-04-02'),
('Inna', 'Hulse', '1984-01-13', 'France', '2013-06-17'),
('Ursa', 'Issacson', '1990-05-03', 'Russia', '2011-01-02'),
('Rick', 'Denham', '1987-03-04', 'Vietnam', '2019-08-18'),
('Emlynne', 'Semered', '1985-08-07', 'Russia', '2019-11-16'),
('Rochella', 'Slowley', '1999-06-15', 'Indonesia', '2018-05-27'),
('Dorri', 'Peel', '1985-10-05', 'Czech Republic', '2010-01-04'),
('Sol', 'Zuenelli', '1981-04-04', 'Ghana', '2017-01-12'),
('Anders', 'Fooks', '1984-03-09', 'Tunisia', '2010-11-09'),
('Jennette', 'Lathleiffure', '1993-04-10', 'USA', '2018-02-21'),
('Arlen', 'de Mendoza', '1983-03-28', 'UK', '2019-09-24'),
('Babbie', 'Doddrell', '1982-06-27', 'Philippines', '2012-07-30'),
('Jeanna', 'Prose', '1981-10-04', 'Ethiopia', '2017-07-11'),
('Isiahi', 'Priddle', '1981-05-13', 'Indonesia', '2016-03-08'),
('Michelle', 'Dulanty', '1991-10-12', 'Albania', '2017-05-20'),
('Alastair', 'Pitts', '1984-02-12', 'Poland', '2019-08-19'),
('Bobbette', 'Kures', '1992-06-03', 'UK', '2014-01-21'),
('Tuckie', 'Topley', '1994-11-04', 'New Zealand', '2019-05-14'),
('Nelie', 'Ferrie', '1995-10-01', 'UK', '2015-07-29'),
('Dianne', 'Ruddin', '1985-03-30', 'USA', '2016-06-28'),
('Suellen', 'Eyam', '1986-03-23', 'Syria', '2013-06-16'),
('Glad', 'Patience', '1991-01-22', 'USA', '2016-01-14'),
('Antoinette', 'Wrangle', '1981-09-01', 'Indonesia', '2019-10-11'),
('Kathie', 'Kensy', '1982-12-17', 'USA', '2019-10-03'),
('Blithe', 'Hebbs', '1999-02-13', 'USA', '2015-02-04');

CREATE TABLE movie_actor (
movie_actor_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
movie_id INT,
FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
actor_id  INT,
FOREIGN KEY (actor_id) REFERENCES actor(actor_id)
);

INSERT INTO movie_actor (movie_id, actor_id) 
VALUES 
(1,3),(2,27),(3,20),(4,31),(5,13),(6,1),
(7,6),(8,22),(9,36),(10,7),(11,31),(12,13),(13,14),
(14,18),(15,17),(16,3),(17,31),(18,3),(19,2),(20,33),
(21,12),(22,25),(23,37),(24,17),(25,22),(26,34),(27,25),
(28,10),(29,38),(30,4),(31,23),(32,23),(33,12),(34,25),
(35,22),(36,20),(37,34),(38,33),(39,39),(40,29),(41,27),
(42,39),(43,26),(44,40),(45,20),(46,29),(47,10),(48,4),
(49,4),(50,40),(51,38),(52,6),(53,2),(54,40),(55,1),
(56,40),(57,23),(58,23),(59,2),(60,21),(61,35),(62,5),
(63,32),(64,36),(65,19),(66,8),(67,32),(68,27),(69,31),
(70,37),(71,13),(72,20),(73,8),(74,11),(75,31),(76,31),
(77,9),(78,18),(79,9),(80,35),(81,22),(82,26),(83,17),
(84,16),(85,6),(86,36),(87,15),(88,20),(89,7),
(90,9),(91,22),(92,32),(93,1),(94,27),(95,14),(96,37),
(97,3),(98,2),(99,37),(100,21);


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
('Myrilla', 'Kezar', '1970-12-27', 'Russia', '2013-09-22'),
('Rachelle', 'Brymner', '1980-03-31', 'UK', '2018-04-14'),
('Ranna', 'Menauteau', '1969-10-08', 'China', '2016-12-01'),
('Rad', 'O''Hannigan', '1967-12-13', 'Armenia', '2010-02-12'),
('Karoly', 'Persicke', '1979-12-18', 'Pakistan', '2010-05-12'),
('Chalmers', 'Bignell', '1975-02-06', 'Brazil', '2019-04-04'),
('Worth', 'Haining', '1979-07-14', 'Russia', '2014-05-07'),
('Osbourne', 'Sandwich', '1988-08-05', 'Russia', '2012-03-20'),
('Melonie', 'Boseley', '1969-03-08', 'Serbia', '2011-06-09'),
('Isidor', 'Clayworth', '1966-02-12', 'Peru', '2010-10-23'),
('Davida', 'Upham', '1987-04-29', 'China', '2011-11-24'),
('Rudiger', 'Chimes', '1968-01-20', 'Portugal', '2016-11-14'),
('Courtney', 'Sheraton', '1974-07-19', 'Luxembourg', '2013-07-14'),
('Agna', 'Drache', '1971-04-29', 'Greece', '2018-03-31'),
('Sara', 'Gunbie', '1973-02-18', 'Portugal', '2015-02-22'),
('Jo-ann', 'Swinglehurst', '1970-08-26', 'Tanzania', '2011-07-30'),
('Gladys', 'Izat', '1960-10-03', 'Yemen', '2012-06-18'),
('Windy', 'Devericks', '1980-11-23', 'Oman', '2019-01-30'),
('Rhys', 'Scase', '1966-12-24', 'Poland', '2018-05-01'),
('George', 'Cleminson', '1977-03-16', 'Russia', '2010-05-07'),
('Obediah', 'Cane', '1968-10-12', 'Malaysia', '2016-06-15'),
('Nicki', 'Sheffield', '1983-08-22', 'China', '2012-06-26'),
('Lay', 'Josling', '1982-12-28', 'Portugal', '2012-05-09'),
('Melinda', 'Dancer', '1973-06-04', 'Sweden', '2015-04-09'),
('Adrien', 'Ankrett', '1977-08-12', 'China', '2011-12-19'),
('Terrie', 'Kayne', '1976-11-29', 'Tanzania', '2011-07-30'),
('Merla', 'Peltz', '1982-04-25', 'Pakistan', '2011-04-17'),
('Edgar', 'Minshall', '1983-03-06', 'Colombia', '2014-07-01'),
('Chandler', 'Tweedell', '1983-06-02', 'Serbia', '2019-12-12'),
('Evaleen', 'Osmond', '1974-04-05', 'Macedonia', '2017-10-05');

CREATE TABLE movie_director (
movie_director_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
movie_id INT,
FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
director_id INT,
FOREIGN KEY (director_id) REFERENCES director(director_id)
);

INSERT INTO movie_director (movie_id, director_id) 
VALUES
(1, 27),(2, 11),(3, 30),(4, 23),(5, 7),(6, 29),(7, 7),(8, 28),
(9, 11),(10, 11),(11, 24),(12, 12),(13, 12),(14, 7),(15, 25),
(16, 8),(17, 20),(18, 29),(19, 27),(20, 2),(21, 8),(22, 27),
(23, 2),(24, 18),(25, 30),(26, 24),(27, 29),(28, 13),(29, 18),
(30, 26),(31, 11),(32, 9),(33, 5),(34, 16),(35, 28),(36, 3),
(37, 30),(38, 22),(39, 25),(40, 11),(41, 14),(42, 8),(43, 20),
(44, 8),(45, 23),(46, 17),(47, 12),(48, 23),(49, 30),(50, 28),
(51, 17),(52, 16),(53, 2),(54, 8),(55, 16),(56, 25),(57, 22),
(58, 15),(59, 21),(60, 7),(61, 7),(62, 9),(63, 9),(64, 5),
(65, 13),(66, 29),(67, 28),(68, 29),(69, 23),(70, 5),(71, 2),
(72, 16),(73, 25),(74, 14),(75, 9),(76, 13),(77, 22),(78, 21),
(79, 13),(80, 23),(81, 20),(82, 8),(83, 20),(84, 25),(85, 1),
(86, 6),(87, 10),(88, 29),(89, 2),(90, 5),(91, 5),(92, 24),
(93, 20),(94, 3),(95, 24),(96, 28),(97, 27),(98, 23),(99, 7),(100, 13);

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
VALUES
(1, 3),(2, 1),(3, 3),(4, 1),(5, 1),(6, 3),(7, 2),(8, 3),
(9, 1),(10, 3),(11, 1),(12, 3),(13, 3),(14, 3),(15, 2),
(16, 2),(17, 3),(18, 2),(19, 3),(20, 1),(21, 2),(22, 3),
(23, 2),(24, 2),(25, 3),(26, 2),(27, 1),(28, 3),(29, 3),
(30, 2),(31, 1),(32, 1),(33, 1),(34, 3),(35, 3),(36, 2),
(37, 2),(38, 3),(39, 1),(40, 3),(41, 3),(42, 1),(43, 3),
(44, 3),(45, 3),(46, 2),(47, 1),(48, 2),(49, 3),(50, 3),
(51, 3),(52, 1),(53, 1),(54, 1),(55, 1),(56, 2),(57, 3),
(58, 3),(59, 1),(60, 1),(61, 3),(62, 3),(63, 1),(64, 3),
(65, 2),(66, 3),(67, 3),(68, 1),(69, 3),(70, 1),(71, 2),
(72, 3),(73, 1),(74, 2),(75, 2),(76, 1),(77, 1),(78, 3),
(79, 3),(80, 1),(81, 2),(82, 3),(83, 1),(84, 2),(85, 1),
(86, 1),(87, 2),(88, 1),(89, 1),(90, 3),(91, 2),(92, 2),
(93, 2),(94, 1),(95, 3),(96, 2),(97, 3),(98, 1),(99, 1),(100, 1);

CREATE TABLE rental (
rental_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
user_id INT,
FOREIGN KEY (user_id) REFERENCES user(user_id),
movie_id INT,
FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
borrowed_date DATE NOT NULL,
due_date DATE NOT NULL
);

INSERT INTO rental (user_id, movie_id, borrowed_date, due_date) 
VALUES
(100, 1, '2019-06-10', '2020-06-12'),
(101, 2, '2020-05-11', '2020-07-16'),
(102, 3, '2020-03-09', '2020-07-10');


INSERT INTO rental (user_id, movie_id, borrowed_date, due_date) 
VALUES
(101, 3, CURRENT_DATE(), DATE_ADD(CURRENT_DATE(), INTERVAL 1 MONTH));

SELECT * 
    FROM movie
    WHERE movie.movie_id NOT IN (
        SELECT m.movie_id
        FROM movie m
        JOIN rental r 
        ON m.movie_id = r.movie_id
        WHERE user_id = 101 )
