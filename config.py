""" Configuration Variables """
from datetime import timedelta
from dotenv import load_dotenv
import os

# Loading the environment variables
load_dotenv()

DEBUG = os.getenv("DEBUG").lower() == 'true'
PORT = os.getenv("PORT")
HOST = os.getenv('HOST')
SECRET_KEY = os.getenv('SECRET_KEY')

MYSQL_DATABASE_HOST = os.getenv('MYSQL_HOST')
MYSQL_DATABASE_PORT = 3306
MYSQL_DATABASE_USER = os.getenv('MYSQL_USER')
MYSQL_DATABASE_PASSWORD = os.getenv('MYSQL_PASS')
MYSQL_DATABASE_DB = os.getenv('MYSQL_DB')
