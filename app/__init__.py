""" Register Blueprints """

from flask import Flask
from app.db import mysql


def create_app(config_filename):
    app = Flask(__name__)
    app.config.from_object(config_filename)
    mysql.init_app(app)
    # Blueprints
    from app.general.routes import general
    from app.users.routes import users
    from app.rental.routes import rental
    app.register_blueprint(general)
    app.register_blueprint(users)
    app.register_blueprint(rental)
    return app
