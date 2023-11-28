from flask import Flask, render_template, jsonify
from flask_sqlalchemy import SQLAlchemy
import random
from flask import request

app = Flask(__name__)
app.config.from_pyfile('config.py')

db = SQLAlchemy(app)

# Define your models
class Qtable(db.Model):
    __tablename__ = 'qtable'
    idq = db.Column(db.Integer, primary_key=True, autoincrement=True)
    punctajq = db.Column(db.Integer)
    intrebare = db.Column(db.String(250))

class Result(db.Model):
    __tablename__ = 'result'
    idr = db.Column(db.Integer, primary_key=True, autoincrement=True)
    idq = db.Column(db.Integer, db.ForeignKey('qtable.idq'))  # Corrected to lowercase
    rezultat = db.Column(db.String(255))
    latency = db.Column(db.Boolean)

class Survey(db.Model):
    __tablename__ = 'survey'
    ids = db.Column(db.Integer, primary_key=True, autoincrement=True)
    idr = db.Column(db.Integer, db.ForeignKey('result.idr'))  # Corrected to lowercase
    obosit = db.Column(db.Boolean)

def extract_questions(target_points=10):
    selected_questions = []
    current_points = 0
    all_questions = Qtable.query.all()
    shuffled_questions = all_questions.copy()
    random.shuffle(shuffled_questions)

    for question in shuffled_questions:
        if current_points + question.punctajq <= target_points:
            selected_questions.append(question)
            current_points += question.punctajq

        if current_points == target_points:
            break

    return selected_questions, current_points

# Create the tables
try:
    with app.app_context():
        db.create_all()


    @app.route('/')
    def index():
        # Use the extract_questions function to get a set of questions and points
        selected_questions, total_points = extract_questions()

        # Pass the selected_questions and total_points variables to the index.html template
        return render_template('index.html', selected_questions=selected_questions, total_points=total_points)

    if __name__ == '__main__':
        app.run(debug=True)

except Exception as e:
    print(f"Error: {e}")
