import datetime
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import DateTime

db = SQLAlchemy()

class User(db.Model):
    __tablename__ = 'users'
    
    u_id = db.Column(db.Integer, primary_key=True)
    u_name = db.Column(db.String(255), nullable=False)
    u_age = db.Column(db.Integer, nullable=False)
    u_gender = db.Column(db.String(1), nullable=False)  
    u_height = db.Column(db.Float, nullable=False)
    u_weight = db.Column(db.Float, nullable=False)
    u_region = db.Column(db.Integer, db.ForeignKey('region.region_id'), nullable=False)
    goal = db.Column(db.Integer, db.ForeignKey('goals.goal_id'), nullable=False)
    u_allergies = db.Column(db.Integer, db.ForeignKey('allergies.allergy_id'), nullable = True)
    region = db.relationship('Region', backref='users')
    goal_relation = db.relationship('Goal', backref='users')
    password = db.Column(db.String(255), nullable=False) 

class Region(db.Model):
    __tablename__ = 'region'
    region_id = db.Column(db.Integer, primary_key=True)
    region_name = db.Column(db.String(100), nullable=False)

class Goal(db.Model):
    __tablename__ = 'goals'
    goal_id = db.Column(db.Integer, primary_key=True)
    goal_name = db.Column(db.String(100), nullable=False)

class Allergy(db.Model):
    __tablename__ = 'allergies'
    allergy_id = db.Column(db.Integer, primary_key=True)
    allergy_name = db.Column(db.String(100), nullable=False)


class UserCalories(db.Model):
    __tablename__ = 'user_calories'
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.u_id'), nullable=False)
    calories_needed = db.Column(db.Numeric(6, 2), nullable=False)
    date_calculated = db.Column(db.Date, nullable=False, default=datetime)  

class UserReminder(db.Model):
    __tablename__ = 'user_reminder'
    
    r_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    r_user_id = db.Column(db.Integer, db.ForeignKey('users.u_id'), primary_key=True)
    frequency_minutes = db.Column(db.Integer, nullable=False)
    last_reminder = db.Column(db.TIMESTAMP, default=datetime.datetime.utcnow)

    # Relationship with User table
    user = db.relationship('User', backref=db.backref('user_reminder', uselist=False))

    def __repr__(self):
        return f"<UserReminder(user_id={self.r_user_id}, frequency_minutes={self.frequency_minutes}, last_reminder={self.last_reminder})>"

class ReminderLogs(db.Model):
    __tablename__ = 'reminder_logs'
    
    log_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    rl_user_id = db.Column(db.Integer, db.ForeignKey('users.u_id'), nullable=False)
    message = db.Column(db.String(255), nullable=False)
    created_at = db.Column(db.TIMESTAMP, default=datetime.datetime.utcnow)

    # Relationship with User table
    user = db.relationship('User', backref=db.backref('reminder_logs', uselist=False))

    def __repr__(self):
        return f"<ReminderLogs(user_id={self.rl_user_id}, message={self.message}, created_at={self.created_at})>"

class Admin(db.Model):
    __tablename__ = 'admin_fittrack'
    
    admin_id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(50), unique=True, nullable=False)
    email = db.Column(db.String(100), unique=True, nullable=False)
    admin_password = db.Column(db.String(128), nullable=False)

    def __repr__(self):
        return f'<Admin {self.username}>'
    
class FoodPlanner(db.Model):
    __tablename__ = 'food_planner'
    food_region_id = db.Column(db.Integer, db.ForeignKey('region.region_id'), primary_key=True)
    food_id = db.Column(db.Integer, primary_key=True)
    food_name = db.Column(db.String(100), nullable=False)
    food_description = db.Column(db.String(255), nullable=False)
    nutrient_value = db.Column(db.String(255), nullable=False)
    calories = db.Column(db.Integer, nullable=False)
    prevent_if_allergy = db.Column(db.JSON)
    image_url = db.Column(db.String(255), nullable=False)

class Exercises(db.Model):
    __tablename__ = 'exercises'
    workout_id = db.Column(db.Integer, primary_key=True)
    workout_name = db.Column(db.String(100), nullable=False)
    workout_desc = db.Column(db.String(255), nullable=False)
    cal_burned_per_hour = db.Column(db.Integer, nullable=False)
    video = db.Column(db.String(255), nullable=False)

from sqlalchemy import Date

class WeeklyReport(db.Model):
    __tablename__ = 'weekly_report'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.u_id'))
    start_date = db.Column(Date)  # Start date of the week
    end_date = db.Column(Date)    # End date of the week
    food_recommendations = db.Column(db.Text)  # JSON format or comma-separated food items
    exercise_recommendations = db.Column(db.Text)  # JSON format or comma-separated exercise items

    # Relationship to link back to the user
    user = db.relationship("User", backref="weekly_reports")

# user = User.query.get(1)
# user.weekly_reports