from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, DateField
from wtforms.fields.core import IntegerField
from wtforms.validators import DataRequired, Length, Email, EqualTo
from flask_admin.form import DateTimeField, DatePickerWidget, DateTimePickerWidget


class SignUpForm(FlaskForm):
    first_name = StringField('First Name',
                             validators=[DataRequired(), Length(min=2, max=20)],
                             render_kw={'placeholder': 'First name'})
    last_name = StringField('Last Name',
                            validators=[DataRequired(), Length(min=2, max=20)],
                            render_kw={'placeholder': 'Last name'})
    username = StringField('Username',
                           validators=[DataRequired(), Length(min=2, max=20)],
                           render_kw={'placeholder': 'Username'})
    email = StringField('Email', validators=[DataRequired(), Email()],
                        render_kw={'placeholder': 'Email'})

    birthdate = DateField('DatePicker', format='%Y-%m-%d', render_kw={'type': 'date'})

    street = StringField('Street',
                         validators=[DataRequired(), Length(min=2, max=20)],
                         render_kw={'placeholder': 'Street'})
    city = StringField('City',
                       validators=[DataRequired(), Length(min=2, max=20)],
                       render_kw={'placeholder': 'City'})
    state = StringField('State',
                        validators=[DataRequired(), Length(min=2, max=20)],
                        render_kw={'placeholder': 'State'})
    zipcode = StringField('Zip Code',
                          validators=[DataRequired(), Length(min=2, max=20)],
                          render_kw={'placeholder': 'Zip Code'})
    phone = StringField('Phone',
                        validators=[DataRequired(), Length(min=2, max=20)],
                        render_kw={'placeholder': 'Phone'})
    password = PasswordField('Password',
                             validators=[DataRequired()],
                             render_kw={'placeholder': 'Password'})
    confirm_password = PasswordField('Confirm Password',
                                     validators=[DataRequired(), EqualTo('password')],
                                     render_kw={'placeholder': 'Confirm Password'})
    submit = SubmitField('Sign Up')


class LoginForm(FlaskForm):
    username = StringField('Username',
                           validators=[DataRequired(), Length(min=2, max=20)],
                           render_kw={'placeholder': 'Username'})
    password = PasswordField('Password',
                             validators=[DataRequired()],
                             render_kw={'placeholder': 'Password'})
    submit = SubmitField('Log In')