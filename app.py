from flask import Flask
from flask_restful import Api, Resource, request

app = Flask(__name__)
api = Api(app)

class BmiCalc(Resource):
    def post(self):
        json_data = request.json

        height = json_data["height"]
        weight = json_data["weight"]
        bmi = weight / (height/100)**2

        return {'bmi': round(bmi, 2 )}

api.add_resource(BmiCalc, '/bmicalc')

if __name__ == '__main__':
    app.run(debug=False)
