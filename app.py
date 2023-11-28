from flask import Flask, render_template, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:root@localhost/Hackathon'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False  # Suppress a warning
db = SQLAlchemy(app)

# Define your models
class Qtable(db.Model):
    __tablename__ = 'qtable'
    idq = db.Column(db.Integer, primary_key=True, autoincrement=True)
    punctajq = db.Column(db.Integer)
    intrebare = db.Column(db.String(250))

class Result(db.Model):
    __tablename__ = 'result'
    idr= db.Column(db.Integer, primary_key=True, autoincrement=True)
    idq = db.Column(db.Integer, db.ForeignKey('qtable.idq'))  # Corrected to lowercase
    rezultat = db.Column(db.String(255))
    latency = db.Column(db.Boolean)

class Survey(db.Model):
    __tablename__ = 'survey'
    ids = db.Column(db.Integer, primary_key=True, autoincrement=True)
    idr = db.Column(db.Integer, db.ForeignKey('result.idr'))  # Corrected to lowercase
    obosit = db.Column(db.Boolean)

# Create the tables
try:
    with app.app_context():
        db.create_all()


    @app.route('/')
    def index():
        qtable_entries = Qtable.query.all()
        return render_template('index.html', qtable_entries=qtable_entries)



    if __name__ == '__main__':
        app.run(debug=True)

except Exception as e:
    print(f"Error: {e}")
