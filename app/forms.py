from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, BooleanField, SubmitField,SelectField,IntegerField,TextAreaField
from wtforms.validators import ValidationError, DataRequired, Email, EqualTo, NumberRange
from app.models import User,Specijalizacija,Bolnica
from wtforms.ext.sqlalchemy.fields import QuerySelectField

class LoginForm(FlaskForm):
    username = StringField('Username', validators=[DataRequired()])
    password = PasswordField('Password', validators=[DataRequired()])
    remember_me = BooleanField('Zapamti')
    submit = SubmitField('Prijava')

class RegistrationForm(FlaskForm):
    username = StringField('Username', validators=[DataRequired()])
    email = StringField('Email', validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired()])
    password2 = PasswordField(
        'Ponovi Password', validators=[DataRequired(), EqualTo('password')])
    submit = SubmitField('Registriraj se')

    def validate_username(self, username):
        user = User.query.filter_by(username=username.data).first()
        if user is not None:
            raise ValidationError('Please use a different username.')

    def validate_email(self, email):
        user = User.query.filter_by(email=email.data).first()
        if user is not None:
            raise ValidationError('Please use a different email address.')

class Dodaj_doktoraForm(FlaskForm):
    ime = StringField('Ime', validators=[DataRequired()])
    prezime = StringField('Prezime', validators=[DataRequired()])
    specijalizacija_id = SelectField('specijalizacija',choices=[])
    specijalizacija_id = SelectField(coerce=int)
    bolnica_id = SelectField('bolnica',choices=[])
    bolnica_id = SelectField(coerce=int)
    submit = SubmitField('Dodaj doktora')

class Search(FlaskForm):
    search = StringField('Pretraga', validators=[DataRequired()])
    submit = SubmitField('Pretraži')

class Ocjeni_doktoraForm(FlaskForm):
    ocjena = IntegerField('Ocjena (1-5)', validators=[DataRequired(),NumberRange(min=1, max=5, message='Unesi ocjenu(1-5)')])
    opis = TextAreaField('Opis', validators=[DataRequired()])
    submit = SubmitField('Dodaj')