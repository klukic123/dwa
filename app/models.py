from app import db
from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import UserMixin
from app import login
from datetime import datetime

class User(UserMixin,db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(64), index=True, unique=True)
    email = db.Column(db.String(120), index=True, unique=True)
    password_hash = db.Column(db.String(128))

    def __repr__(self):
        return '<User {}>'.format(self.username)    

    def set_password(self, password):
        self.password_hash = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password_hash, password)

@login.user_loader
def load_user(id):
    return User.query.get(int(id))

class Ocjena(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    ocjena = db.Column(db.Integer)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    doktor_id = db.Column(db.Integer, db.ForeignKey('doktor.id'))


class Bolnica(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    naziv = db.Column(db.String(140))
    def __repr__(self):
        return '{}'.format(self.naziv)    

class Specijalizacija(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    naziv = db.Column(db.String(140))
    def __repr__(self):
        return '{}'.format(self.naziv)    

class Doktor(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    ime = db.Column(db.String(120))
    prezime = db.Column(db.String(120))
    specijalizacija_id= db.Column(db.Integer, db.ForeignKey('specijalizacija.id'))
    bolnica_id = db.Column(db.Integer, db.ForeignKey('bolnica.id'))

  