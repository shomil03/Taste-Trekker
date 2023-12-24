from flask import Flask, jsonify, request
from firebase_admin import firestore
from firebase_admin import credentials
import firebase_admin
from google.cloud.firestore import Client as FirestoreClient

app = Flask(__name__)
cred = credentials.Certificate('taste-trekker-66b59-firebase-adminsdk-mb1j9-23b1bb11e6.json')
fapp = firebase_admin.initialize_app(credential=cred)
db: FirestoreClient = firestore.client()
# Multiply hunger level by 120, calc servings using this
@app.route("/recommedDish", methods=["POST"])
def get_dish_id():
    data: dict = request.get_json()
    user = getUserData(data['UserId'])
    print(data)
    print(user)
    hunger = 120*data['HungerLevel'] #calories to satisfy hunger
    cuisine = ''
    diet = user['DietPreference']
    ingredients = data['Ingredients']
    calories = ''
    serving = ''
    spicy_level = data['SpicyLevel']
    health_info = user['HealthProblems']

    # hunger_level = data['HungerLevel']
    dish_name = 'Achari Baingan' # call model function here
    dish = getDishData(dish_name)
    dish['Servings_Required'] = int(int(dish['Serving_Size'])*(hunger/int(dish['Calories'])))
    return jsonify(dish)

def getUserData(user_id):
    user = db.collection("Users").document(user_id).get()
    return user.to_dict()

def getDishData(dish_name):
    dish = db.collection("Dishes").document(dish_name).get()
    return dish.to_dict()


if __name__ == '__main__':
    app.run()