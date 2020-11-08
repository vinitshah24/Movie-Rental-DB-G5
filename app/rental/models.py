from config import MYSQL_DATABASE_DB
from app.users.models import USER_TABLE, PERSON_TABLE

GENRE_TABLE = "genre"
MOVIE_TABLE = "movie"
MOVIE_GENRE_TABLE = "movie_genre"
ACTOR_TABLE = "actor"
MOVIE_ACTOR_TABLE = "movie_actor"
DIRECTOR_TABLE = "director"
MOVIE_DIRECTOR_TABLE = "movie_director"
RATINGS_TABLE = "ratings"
MOVIE_RATINGS_TABLE = "movie_ratings"
RENTAL_TABLE = "rental"

SELECT_MOVIE_DETAILS = """SELECT m.movie_title, m.movie_release_date, m.movie_details,
a.actor_first_name, a.actor_last_name,
d.director_first_name, d.director_last_name
FROM {database}.{movie_table} m
JOIN {database}.{movie_actor_table} ma
ON m.movie_id = ma.movie_id
JOIN {database}.{actor_table} a
ON ma.actor_id = a.actor_id
JOIN {database}.{movie_direcor_table} md
ON m.movie_id = md.movie_id
JOIN {database}.{director_table} d
ON d.director_id = md.director_id
ORDER BY m.movie_title DESC
""".format(database=MYSQL_DATABASE_DB,
           movie_table=MOVIE_TABLE,
           movie_actor_table=MOVIE_ACTOR_TABLE,
           actor_table=ACTOR_TABLE,
           movie_direcor_table=MOVIE_DIRECTOR_TABLE,
           director_table=DIRECTOR_TABLE
           ).replace('\n', ' ')

SELECT_MOVIE_RETURNED_DETAILS = """
SELECT p.first_name, p.last_name, m.movie_title,
r.borrowed_date, r.return_date, r.due_date
FROM {database}.{user_table} u
JOIN {database}.{rental_table} r
ON u.user_id = r.user_id
JOIN {database}.{person_table} p
ON u.person_id = p.person_id
JOIN {database}.{movie_table} m
ON r.movie_id = m.movie_id
WHERE r.return_date = "2020-07-10";
""".format(database=MYSQL_DATABASE_DB,
           user_table=USER_TABLE,
           person_table=PERSON_TABLE,
           movie_table=MOVIE_TABLE,
           rental_table=RENTAL_TABLE).replace('\n', ' ')

SELECT_DELETEMOVIEACTOR = """DELETE FROM {database}.{movie_actor_table} WHERE movie_id = %s""".format(database=MYSQL_DATABASE_DB,
movie_actor_table=MOVIE_ACTOR_TABLE).replace('\n', ' ')

SELECT_DELETEMOVIEDIRECTOR = """DELETE FROM {database}.{movie_director_table} WHERE movie_id = %s""".format(database=MYSQL_DATABASE_DB,
movie_director_table=MOVIE_DIRECTOR_TABLE).replace('\n', ' ')

SELECT_DELETEMOVIEGENRE = """DELETE FROM {database}.{movie_genre_table} WHERE movie_id = %s""".format(database=MYSQL_DATABASE_DB,
movie_genre_table=MOVIE_GENRE_TABLE).replace('\n', ' ')

SELECT_DELETEMOVIERATINGS = """DELETE FROM {database}.{movie_ratings_table} WHERE movie_id = %s""".format(database=MYSQL_DATABASE_DB,
movie_ratings_table=MOVIE_RATINGS_TABLE).replace('\n', ' ')

SELECT_DELETEMOVIERENTAL = """DELETE FROM {database}.{rental_table} WHERE movie_id = %s""".format(database=MYSQL_DATABASE_DB,
rental_table=RENTAL_TABLE).replace('\n', ' ')

SELECT_DELETEMOVIE = """DELETE FROM {database}.{movie} WHERE movie_id = %s""".format(database=MYSQL_DATABASE_DB,
movie=MOVIE_TABLE).replace('\n', ' ')

INSERT_MOVIE = """INSERT INTO {database}.{movie} (movie_title, movie_release_date, movie_details) VALUES (%s, %s, %s)""".format(database=MYSQL_DATABASE_DB,
movie=MOVIE_TABLE).replace('\n', ' ')

SELECT_FILTER_MOVIES = """SELECT * FROM {database}.{movie_table} WHERE movie_title =  %s)
""".format(database=MYSQL_DATABASE_DB,
           movie_table=MOVIE_TABLE).replace('\n', ' ')