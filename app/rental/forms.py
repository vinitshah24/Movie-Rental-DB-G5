from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, DateField
from wtforms.fields.core import IntegerField
from wtforms.validators import DataRequired, Length, Email, EqualTo
from flask_admin.form import DateTimeField, DatePickerWidget, DateTimePickerWidget


class DeleteMovieForm(FlaskForm):
    movie_id = IntegerField('Movie ID')
    submit = SubmitField('Delete Movie!')

class AddMovieForm(FlaskForm):
    movie_title = StringField('Movie Title')
    movie_release_date = DateField('DatePicker', format='%Y-%m-%d', render_kw={'type': 'date'})
    movie_details = StringField('Movie Details')
    submit = SubmitField('Add Movie!')