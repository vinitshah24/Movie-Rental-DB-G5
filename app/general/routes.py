from flask import render_template, Blueprint, flash, redirect, url_for, request

general = Blueprint('general', __name__)


@general.route('/', methods=['GET'])
def home():
    return render_template('general/home.html')
