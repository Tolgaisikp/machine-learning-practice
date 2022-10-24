import warnings
warnings.filterwarnings("ignore")

import uvicorn
from fastapi import FastAPI
import numpy as np
import joblib
from pydantic.main import BaseModel

app = FastAPI(title="First ML App")

@app.get("/")
def home():
    return "Hello"

class MyData(BaseModel): #blueprint model
    age: float
    sex: float
    bmi: float
    bp:	float
    s1:	float
    s2:	float
    s3:	float
    s4:	float
    s5:	float
    s6: float
    
@app.post("/predict")
def predict(data:MyData):
    model = joblib.load("./app/my_model") #docker appin üstünden çalıştığından path böyle
    X = np.array([data.age, data.sex, data.bmi, data.bp, data.s1, data.s2, data.s3, data.s4, data.s5, data.s6]).reshape(1,-1)
    return str(model.predict(X).item())
    
    
if __name__ == '__main__':
    uvicorn.run(app, host="127.0.0.1", port=8000)
    