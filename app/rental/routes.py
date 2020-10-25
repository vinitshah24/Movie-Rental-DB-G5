import pymysql

from flask import render_template, Blueprint

from app.db import mysql
import app.rental.models as queries

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
