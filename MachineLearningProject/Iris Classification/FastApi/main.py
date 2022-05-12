from urllib.request import Request
from fastapi import FastAPI, Request
from fastapi.templating import Jinja2Templates
import numpy as np
import pickle

#load model
with open('../model.pickle', 'rb') as file:
    model_file = pickle.load(file)

model = model_file['model']

#fast api app
app = FastAPI()

templates = Jinja2Templates(directory='templates')

@app.get("/")
def iris_prediction(request: Request):
    return templates.TemplateResponse("home.html", {'request':request})

@app.get("/predict/")
def iris_prediction(request: Request, l1:float, w1:float, l2:float, w2:float):

    data = np.array([l1,w1,l2,w2]).reshape(1,-1)
    species = model.predict(data)[0]
    
    probalities = model.predict_proba(data)[0]
    
    probality = probalities[np.argmax(probalities)]

    return templates.TemplateResponse("result.html", {'request':request, 'species':species, 
                                                      'probalities': probalities, 'probality':probality})