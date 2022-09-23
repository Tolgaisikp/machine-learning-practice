import mlflow
logged_model = 'runs:/8c1214879cb54255a5fe58dc573bf075/model'

# Load model as a PyFuncModel.
loaded_model = mlflow.pyfunc.load_model(logged_model)

# Predict on a Pandas DataFrame.
import pandas as pd
print(loaded_model)
print(loaded_model.predict(pd.DataFrame(data)))