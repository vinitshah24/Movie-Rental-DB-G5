from flask.helpers import flash, url_for
import pymysql

from flask import (render_template, Blueprint, flash, redirect, url_for,
                   session)
from werkzeug.utils import redirect

from app.db import mysql
import app.rental.models as queries
from app.rental.forms import AddMovieForm, DeleteMovieForm, FilterForm
from app.rental.models import INSERT_MOVIE
rental = Blueprint('rental', __name__)


@rental.route('/movie_details')
def movie_details():
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    cursor.execute(queries.SELECT_MOVIE_DETAILS)
    data = cursor.fetchall()
    cursor.close()
    conn.close()
    print(data)
    return render_template('rental/movie_details.html',
                           title='Movie Details',
                           resultset=data)


@rental.route('/movie_returned')
def movie_returned():
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    cursor.execute(queries.SELECT_MOVIE_RETURNED_DETAILS)
    data = cursor.fetchall()
    cursor.close()
    conn.close()
    print(data)
    return render_template('admin/movies_returned.html',
                           title='Movies Returned',
                           resultset=data)


@rental.route("/delete_movie", methods=['GET', 'POST'])
def delete_movie():
    form = DeleteMovieForm()
    if form.validate_on_submit():
        movie_id = form.movie_id.data
        print(movie_id)
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.execute(queries.SELECT_DELETEMOVIEACTOR, (movie_id))
        cursor.execute(queries.SELECT_DELETEMOVIEDIRECTOR, (movie_id))
        cursor.execute(queries.SELECT_DELETEMOVIEGENRE, (movie_id))
        cursor.execute(queries.SELECT_DELETEMOVIERATINGS, (movie_id))
        cursor.execute(queries.SELECT_DELETEMOVIERENTAL, (movie_id))
        cursor.execute(queries.SELECT_DELETEMOVIE, (movie_id))
        conn.commit()
    return render_template('rental/delete_movie.html', form=form)


@rental.route("/add_movie", methods=['GET', 'POST'])
def add_movie():
    form = AddMovieForm()
    if form.validate_on_submit():
        movie_title = form.movie_title.data
        movie_release_date = form.movie_release_date.data
        movie_details = form.movie_details.data
        print(movie_title)
        print(movie_release_date)
        print(movie_details)
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.execute(INSERT_MOVIE, (movie_title, movie_release_date, movie_details))
        conn.commit()
    return render_template('rental/add_movie.html', form=form)


@rental.route('/filter_movies', methods=['GET', 'POST'])
def filter_movies():
    form = FilterForm()
    if form.validate_on_submit():
        movie_name = form.filter_text.data
        print(movie_name)
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.execute(queries.SELECT_FILTER_MOVIE_DETAILS, movie_name)
        data = cursor.fetchall()
        cursor.close()
        conn.close()
        print(data)
        return render_template('rental/filtered_movie.html', resultset=data)
    return render_template('rental/filter_movies.html',
                           title='Filter Movies', form=form)
