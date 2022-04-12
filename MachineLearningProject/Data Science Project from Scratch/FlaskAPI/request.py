import requests
from input_data import data_in

#send api request using requests

URL = 'http://127.0.0.1:5000/predict'
HEADERS = {'Content-Type':'application/json'}
DATA = {'input' : data_in}

r = requests.get(url=URL, headers=HEADERS, json=DATA)

data = r.json()

print(data)