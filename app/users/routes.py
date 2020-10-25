
import pymysql

from flask import render_template, Blueprint

from app.db import mysql
import app.users.models as queries

users = Blueprint('users', __name__)


@users.route('/users')
def user_details():
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    cursor.execute(queries.SELECT_USER_DETAILS)
    data = cursor.fetchall()
    cursor.close()
    conn.close()
    print(data)
    return render_template('admin/user_details.html',
                           title='User Details',
                           resultset=data)
