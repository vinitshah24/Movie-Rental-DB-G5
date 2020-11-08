import pymysql
from datetime import datetime
from flask import (render_template, Blueprint, flash, redirect, url_for,
                   request, session)

from app.db import mysql
import app.users.models as queries
from app.users.forms import SignUpForm, LoginForm

users = Blueprint('users', __name__)


@users.route('/users')
def user_details():
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    cursor.execute(queries.SELECT_USER_DETAILS)
    data = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('admin/user_details.html', title='User Details', resultset=data)


@users.route("/signup", methods=['GET', 'POST'])
def signup():
    if session.get("logged_user") is not None:
        return redirect(url_for('general.home'))
    form = SignUpForm()
    if form.validate_on_submit():
        (username, user_pass, first_name, last_name, birthdate, street, city,
         state, zipcode, phone, email, date_joined) = (
            form.username.data, form.password.data,
            form.first_name.data, form.last_name.data,
            form.birthdate.data, form.street.data,
            form.city.data, form.state.data, form.zipcode.data,
            form.phone.data, form.email.data,
            datetime.now().strftime("%Y-%m-%d"))
        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.execute(queries.INSERT_PERSON, (
            username, user_pass, first_name, last_name, birthdate, street,
            city, state, zipcode, phone, email, date_joined))
        # TODO: Select userID, Insert USER (general/premium)
        # TODO: Verify the user record before showing success message
        conn.commit()
        flash('Account created successfully!', 'success')
        return redirect(url_for('users.login'))
    return render_template('users/signup.html', title='Signup', form=form)


@users.route("/login", methods=['GET', 'POST'])
def login():
    if session.get("logged_user") is not None:
        return redirect(url_for('general.home'))
    form = LoginForm()
    if form.validate_on_submit():
        (username, user_pass) = (form.username.data, form.password.data)
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.execute(queries.SELECT_LOGIN, (username, user_pass))
        verify_count = cursor.fetchone()
        if int(verify_count['output']) == 0:
            flash('Login Unsuccessful. Check Username and Password!', 'danger')
            return redirect(url_for('users.login'))
        else:
            # TODO: GET THE USER ID FOR USER SESSION
            session["logged_user"] = username
            next_page = request.args.get('next')
            return redirect(next_page) if next_page else redirect(url_for('general.home'))
    return render_template('users/login.html', title='Login', form=form)



@users.route("/logout", methods=['GET'])
def logout():
    session.clear()
    return redirect(url_for('users.login'))
