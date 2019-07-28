from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, BooleanField, SubmitField,SelectField,IntegerField
from wtforms.validators import ValidationError, DataRequired, Email, EqualTo, NumberRange
from app.models import User,Specijalizacija,Bolnica
from wtforms.ext.sqlalchemy.fields import QuerySelectField

class LoginForm(FlaskForm):
    username = StringField('Username', validators=[DataRequired()])
    password = PasswordField('Password', validators=[DataRequired()])
    remember_me = BooleanField('Remember Me')
    submit = SubmitField('Sign In')

class RegistrationForm(FlaskForm):
    username = StringField('Username', validators=[DataRequired()])
    email = StringField('Email', validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired()])
    password2 = PasswordField(
        'Repeat Password', validators=[DataRequired(), EqualTo('password')])
    submit = SubmitField('Register')

    def validate_username(self, username):
        user = User.query.filter_by(username=username.data).first()
        if user is not None:
            raise ValidationError('Please use a different username.')

    def validate_email(self, email):
        user = User.query.filter_by(email=email.data).first()
        if user is not None:
            raise ValidationError('Please use a different email address.')

class Dodaj_doktoraForm(FlaskForm):
    ime = StringField('ime', validators=[DataRequired()])
    prezime = StringField('prezime', validators=[DataRequired()])
    specijalizacija_id = SelectField('specijalizacija',choices=[])
    bolnica_id = SelectField('bolnica',choices=[])
    submit = SubmitField('Dodaj doktora')

class Search(FlaskForm):
    search = StringField('Pretraga', validators=[DataRequired()])
    submit = SubmitField('Pretraži')

class Ocjeni_doktoraForm(FlaskForm):
    ocjena = IntegerField('ocjena', validators=[DataRequired(),NumberRange(min=1, max=5, message='Unesi ocjenu(1-5)')])
    submit = SubmitField('Dodaj ocjenu')