from flask import Flask, jsonify, render_template, request, redirect, url_for, session, flash, current_app
from flask_sqlalchemy import SQLAlchemy
import mysql
from models import Admin, FoodPlanner, Exercises, ReminderLogs, UserCalories, UserReminder, WeeklyReport, db, User, Region, Goal, Allergy
from werkzeug.security import generate_password_hash, check_password_hash
import datetime
from sqlalchemy import text
import json
app = Flask(__name__)
app.secret_key = 'dbms_miniproject'
# Database configuration
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://test_user_trial:test_user_trial@localhost/miniproject_trial'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Initialize SQLAlchemy

db.init_app(app)

# @app.before_first_request
# def create_tables():
#     db.create_all()  # Create tables if they don't exist

@app.route('/')
def index():
    return render_template('index.html')

# Login route
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        # Fetch user from database (assuming 'username' and 'password' fields exist)
        user = User.query.filter_by(u_name=username).first()
        if user and check_password_hash(user.password, password):  
            session['user_id'] = user.u_id
            session['username'] = user.u_name
            flash('Login successful!')
            return redirect(url_for('home'))
        else:
            flash('Invalid username or password')
            return redirect(url_for('login'))

    return render_template('login.html')

# Logout route
@app.route('/logout')
def logout():
    session.clear()
    flash('You have been logged out')
    return redirect(url_for('index'))



@app.route('/calculate_calories', methods=['GET'])
def calculate_calories():
    user_id = session.get('user_id')  

    # Fetch user information from the database
    user = User.query.get(user_id)

    if user:
        age = user.u_age
        height = user.u_height
        weight = user.u_weight
        gender = user.u_gender

        # Call the SQL function to calculate calories
        result = db.session.execute(
            text("SELECT calculate_calories(:age, :height, :weight, :gender) AS calories"),
            {"age": age, "height": height, "weight": weight, "gender": gender}
        ).fetchone()

        # Extract the calculated calories from the result
        calories_needed = result.calories if result else None

        if calories_needed is not None:
            # Check if a record already exists for this user
            existing_record = UserCalories.query.filter_by(user_id=user_id).first()

            if existing_record:
                # Update the existing record
                existing_record.calories_needed = calories_needed
                existing_record.date_calculated = datetime.date.today()
            else:
                # Create a new record
                new_calorie_record = UserCalories(user_id=user_id, calories_needed=calories_needed, date_calculated=datetime.date.today())
                db.session.add(new_calorie_record)

            # Commit the changes to the database
            db.session.commit()

        return render_template('calculate_calories.html', calculated_calories=calories_needed)
    
    return "User not found", 404

@app.route('/recommendations', methods=['GET'])
def recommendations():
    user_id = session.get('user_id')

    if user_id:
        try:
            conn = db.engine.raw_connection()
            cursor = conn.cursor()

            # Call the stored procedure
            cursor.callproc('GetRecommendations', [user_id])
            
            food_recommendations_list = []
            exercise_recommendations_list = []

            # Get all result sets
            results = list(cursor.stored_results())
            
            # First result set is food recommendations
            if results and len(results) > 0:
                food_results = results[0].fetchall()
                for row in food_results:
                    food_recommendations_list.append({
                        'food_name': row[0],
                        'food_description': row[1],
                        'calories': row[2],
                        'nutrient_value': row[3],
                        'image_url': row[4]
                    })

            # Second result set is exercise recommendations
            if results and len(results) > 1:
                exercise_results = results[1].fetchall()
                for row in exercise_results:
                    exercise_recommendations_list.append({
                        'workout_name': row[0],
                        'workout_desc': row[1],
                        'cal_burned_per_hour': row[2],
                        'video': row[3],  
                        'recommended_duration': row[4]
                    })

            
            print("Food Recommendations:", food_recommendations_list)
            print("Exercise Recommendations:", exercise_recommendations_list)

            cursor.close()
            conn.close()

            return render_template(
                'recommendation.html',
                food_recommendations=food_recommendations_list,
                exercise_recommendations=exercise_recommendations_list
            )

        except Exception as e:
            current_app.logger.error(f"Error fetching recommendations: {e}")
            print(f"Error: {str(e)}")  
            db.session.rollback()
            return "Error fetching recommendations", 500

    return "User not found", 404



@app.route('/check_user_calories/<int:user_id>', methods=['GET'])
def check_user_calories(user_id):
    try:
        cur = mysql.connection.cursor()
        
        # Check if we have today's calorie calculation
        cur.execute("""
            SELECT calories_needed 
            FROM user_calories 
            WHERE user_id = %s AND date_calculated = %s
        """, (user_id, datetime.date.today()))
        
        result = cur.fetchone()
        cur.close()
        
        if result:
            return jsonify({
                'status': 'success',
                'has_calories': True,
                'calories_needed': float(result[0])
            })
        else:
            return jsonify({
                'status': 'success',
                'has_calories': False
            })
            
    except Exception as e:
        return jsonify({
            'status': 'error',
            'message': str(e)
        }), 500



# Route to set or update water reminder frequency
@app.route('/set_reminder', methods=['GET', 'POST'])
def set_reminder():
    # Redirect to login if user is not authenticated
    if 'user_id' not in session:
        return redirect(url_for('login'))

    if request.method == 'POST':
        user_id = session['user_id']
        frequency = request.form.get('frequency_minutes', type=int)

        if not frequency or frequency <= 0:
            flash("Please provide a valid reminder frequency in minutes.")
            return redirect(url_for('set_reminder'))  # Redirect back to reminder page on invalid input

        # Check if a reminder already exists for the user
        reminder = UserReminder.query.filter_by(r_user_id=user_id).first()

        # Update existing reminder or create a new one
        if reminder:
            reminder.frequency_minutes = frequency
        else:
            reminder = UserReminder(r_user_id=user_id, frequency_minutes=frequency)
            db.session.add(reminder)

        db.session.commit()
        flash("Water reminder frequency set successfully.")
        return redirect(url_for('home'))  # Redirect to home on successful submission

    # Render the reminder page for GET request
    return render_template('reminder.html')


# Route to get the reminder message (for popup in HTML)
@app.route('/get_reminder', methods=['GET'])
def get_reminder():
    user_id = session.get('user_id')
    if not user_id:
        return jsonify({'status': 'no_user'}), 401

    try:
        result = db.session.execute(
            text("SELECT provide_reminder(:user_id) AS message"),
            {"user_id": user_id}
        ).fetchone()
        
        message = result.message if result else "No reminder needed."

        if "Reminder sent" in message:
            return jsonify({'status': 'reminder', 'message': message})
        else:
            return jsonify({'status': 'no_reminder', 'message': message})

    except Exception as e:
        app.logger.error(f"Error getting reminder: {e}")
        return jsonify({'status': 'error', 'message': 'Could not fetch reminder.'}), 500


# Route to get the current reminder frequency for the logged-in user
@app.route('/get_reminder_frequency')
def get_reminder_frequency():
    if 'user_id' not in session:
        return jsonify({"status": "error", "message": "Not authenticated"}), 403

    user_id = session['user_id']
    reminder = UserReminder.query.filter_by(r_user_id=user_id).first()

    if reminder:
        return jsonify({"status": "success", "frequency_minutes": reminder.frequency_minutes})
    else:
        return jsonify({"status": "no_reminder", "message": "Reminder not set"})



# Admin login route
@app.route('/admin_login', methods=['GET', 'POST'])
def admin_login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        # Query for admin with the given username
        admin = Admin.query.filter_by(username=username).first()

        # Check if admin exists and if the password matches
        if admin and admin.admin_password == password:  
            session['admin_id'] = admin.admin_id  
            flash('Login successful!')
            return redirect(url_for('admin_dashboard'))
        else:
            flash('Invalid credentials.')

    # Render the admin login page
    return render_template('admin_login.html')

@app.route('/admin_dashboard')
def admin_dashboard():
    # Query the view to get user statistics by region
    user_statistics = db.session.execute(text('SELECT * FROM user_region_statistics')).fetchall()
    # Fetch regions from the database
    regions = Region.query.all()

    # Fetch allergies from the database
    allergies = Allergy.query.all()

    # Fetch food items 
    food_items = FoodPlanner.query.all()

    workout_items = Exercises.query.all()

    return render_template('admin_dashboard.html', 
                           user_statistics=user_statistics, 
                           region=regions, 
                           allergies=allergies, 
                           food_items=food_items,
                           workout_items = workout_items)

@app.route('/add_food_item', methods=['POST'])
def add_food_item():
    if request.method == 'POST':
        # Retrieve data from the form
        region_id = request.form['region']
        food_name = request.form['food_name']
        food_description = request.form['food_description']
        nutrient_value = request.form['nutrient_value']
        calories = request.form['calories']
        allergy_ids = request.form.getlist('allergy')  # List of allergy IDs selected by the admin
        image_url = request.form['image_url']
        
        # Convert the allergy_ids list into a JSON format
        allergy_ids_json = json.dumps({f"allergy_{i}": True for i in allergy_ids}) if allergy_ids else None
        
        # Call the stored procedure to add the food item
       
        conn = db.engine.raw_connection()
        cursor = conn.cursor()
        cursor.callproc('add_food_item', 
                    [region_id, food_name, food_description, nutrient_value, calories, allergy_ids_json, image_url])
        conn.commit()

        return redirect(url_for('admin_dashboard'))  # Redirect to the dashboard after adding the food item

@app.route('/edit_food_item', methods=['POST'])
def edit_food_item():
    if request.method == 'POST':
        # Retrieve data from the form
        region_id = request.form['region']
        food_name = request.form['food_name']
        field = request.form['field']  
        new_value = request.form['new_value']  
        
        # Call the stored procedure to edit the food item
        conn = db.engine.raw_connection() 
        cursor = conn.cursor()
        cursor.callproc('edit_food_item', 
                     [region_id, food_name, field, new_value])
        conn.commit()

        return redirect(url_for('admin_dashboard'))  

@app.route('/delete_food_item', methods=['POST'])
def delete_food_item():
    if request.method == 'POST':
        # Retrieve data from the form
        region_id = request.form['region']
        food_name = request.form['food_name']
        
        # Call the stored procedure to delete the food item
        conn = db.engine.raw_connection() 
        cursor = conn.cursor()
        cursor.callproc('delete_food_item', 
                    [region_id, food_name])
        conn.commit()

        return redirect(url_for('admin_dashboard'))  

@app.route('/add_exercise', methods=['POST'])
def add_exercise():
    if request.method == 'POST':
        # Retrieve data from the form
        workout_name = request.form['workout_name']
        workout_desc = request.form['workout_desc']
        cal_burned_per_hour = request.form['cal_burned_per_hour']
        video = request.form['video']
        
        # Call the stored procedure to add the food item
        # conn = db.engine.raw_connection() 
        conn = db.engine.raw_connection()
        cursor = conn.cursor()
        cursor.callproc('add_exercise', 
                    [workout_name, workout_desc, cal_burned_per_hour, video])
        conn.commit()

        return redirect(url_for('admin_dashboard'))  
    
@app.route('/edit_exercises', methods=['POST'])
def edit_exercises():
    if request.method == 'POST':
        # Retrieve data from the form
        workout_name = request.form['workout_name']
        field = request.form['field']  
        new_value = request.form['new_value']  
        
        # Call the stored procedure to edit the food item
        conn = db.engine.raw_connection() 
        cursor = conn.cursor()
        cursor.callproc('edit_exercises', 
                     [workout_name, field, new_value])
        conn.commit()

        return redirect(url_for('admin_dashboard'))  
    

@app.route('/delete_exercises', methods=['POST'])
def delete_exercises():
    if request.method == 'POST':
        # Retrieve data from the form
        workout_name = request.form['workout_name']
        
        # Call the stored procedure to delete the food item
        conn = db.engine.raw_connection() 
        cursor = conn.cursor()
        cursor.callproc('delete_exercises', 
                    [workout_name])
        conn.commit()

        return redirect(url_for('admin_dashboard'))  
    
import datetime
import json
from flask import render_template
from datetime import timedelta

@app.route('/generate_weekly_report')
def generate_weekly_report():
    user_id = session.get('user_id')
    
    if user_id:
        try:
            # Connect to the database and call the stored procedure
            conn = db.engine.raw_connection()
            cursor = conn.cursor()
            # Call the stored procedure
            cursor.callproc('GenerateWeeklyReport', [user_id])
            
            # Commit the transaction
            conn.commit()
            
            # Query the weekly report data after running the procedure
            cursor.execute("""
                SELECT start_date, end_date, food_recommendations, exercise_recommendations
                FROM weekly_report
                WHERE user_id = %s AND start_date >= CURDATE() - INTERVAL 1 WEEK
            """, (user_id,))
            
            report_data = cursor.fetchall()
            
            
            columns = [col_desc[0] for col_desc in cursor.description]
            
            
            report_data_dict = [dict(zip(columns, row)) for row in report_data]

        finally:
            
            cursor.close()
            conn.close()

        # Get the current date range for the week
        today = datetime.datetime.today()
        week_start_date = today - timedelta(days=today.weekday())  # Start of the week 
        week_end_date = week_start_date + timedelta(days=6)  # End of the week 

        # Fetching the report data and parsing JSON fields
        for entry in report_data_dict:
            entry['food_recommendations'] = json.loads(entry['food_recommendations']) if entry['food_recommendations'] else []
            entry['exercise_recommendations'] = json.loads(entry['exercise_recommendations']) if entry['exercise_recommendations'] else []
        
        # Pass data to the template
        return render_template(
            'weekly_report.html', 
            user_id=user_id, 
            week_start_date=week_start_date, 
            week_end_date=week_end_date, 
            weekly_recommendations=report_data_dict
        )


@app.route('/home')
def home():
    # Render the home page for registered users
    if 'user_id' not in session:
        return redirect(url_for('login'))
    return render_template('home.html')
 
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        # Get form data
        name = request.form['name']
        age = request.form['age']
        gender = request.form['gender']
        height = request.form['height']
        weight = request.form['weight']
        region_id = request.form['region']
        goal_id = request.form['goal']
        allergy_id = request.form['allergy'] 
        password = request.form['password']
        
        # Hash the password for secure storage
        hashed_password = generate_password_hash(password)
        # Create a new user
        new_user = User(u_name=name, u_age=age, u_gender=gender, u_height=height, u_weight=weight, u_region=region_id, goal=goal_id, u_allergies = allergy_id, password=hashed_password)

        db.session.add(new_user)
        db.session.commit()

        return redirect(url_for('index'))

    # Fetch regions, goals, and allergies from the database
    regions = Region.query.all()
    goals = Goal.query.all()
    allergies = Allergy.query.all()

    return render_template('registration.html', region=regions, goals=goals, allergies=allergies)

if __name__ == '__main__':
    app.run(debug=True)
