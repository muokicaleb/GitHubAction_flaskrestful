import unittest
import json

from app import app


class BmiTest(unittest.TestCase):

    def setUp(self):
        self.app = app.test_client()
    
    def test_successful_bmi(self):
        # Given
        payload = {
                    "height":155,
                    "weight":66
                }

        # When
        response = self.app.post('/bmicalc', headers={"Content-Type": "application/json"}, json=payload)

        # Then
        self.assertEqual(27.47, response.json['bmi'])
       
