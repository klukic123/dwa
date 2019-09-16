from flask import render_template
from app import app
from app.forms import RegistrationForm, LoginForm,Ocjeni_doktoraForm
from flask import render_template, flash, redirect
from flask_login import current_user, login_user
from app.models import User,Doktor,Specijalizacija,Bolnica
from flask_login import logout_user
from flask_login import login_required
from flask import request,url_for
from werkzeug.urls import url_parse
from app import db
from sqlalchemy import text


@app.route('/')
@app.route('/index')
def index():
    return render_template('index.html', title='Home')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if current_user.is_authenticated:
        return redirect(url_for('index'))
    form = LoginForm()
    if form.validate_on_submit():
        user = User.query.filter_by(username=form.username.data).first()
        if user is None or not user.check_password(form.password.data):
            flash('Krivi username ili lozinka')
            return redirect(url_for('login'))
        login_user(user, remember=form.remember_me.data)
        next_page = request.args.get('next')
        if not next_page or url_parse(next_page).netloc != '':
            next_page = url_for('index')
        return redirect(next_page)
    return render_template('login.html', title='Sign In', form=form)

@app.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('index'))

@app.route('/register', methods=['GET', 'POST'])
def register():
    if current_user.is_authenticated:
        return redirect(url_for('index'))
    form = RegistrationForm()
    if form.validate_on_submit():
        user = User(username=form.username.data, email=form.email.data)
        user.set_password(form.password.data)
        db.session.add(user)
        db.session.commit()
        flash('Registrirali ste se!')
        return redirect(url_for('login'))
    return render_template('register.html', title='Register', form=form)


@app.route('/doktori')
def doktori():
    doktor = db.engine.execute(text("select doktor.id,doktor.ime,doktor.prezime,specijalizacija.naziv as specijalizacija,bolnica.naziv as bolnica from doktor join specijalizacija on doktor.specijalizacija_id=specijalizacija.id join bolnica on bolnica.id=doktor.bolnica_id").execution_options(autocommit=True))
    return render_template("doktori.html", doktor=doktor)
