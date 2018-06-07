"""
@author: vineethbharadwajp
"""
# Random Forest Regression

# Data Preprocessing

# Importing Libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:, 1:2].values #independent variable
Y = dataset.iloc[:, 2].values   #dependent variable

"""
# Splitting the dataset into the Training set and Test set
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size = 0.2, random_state = 0)

##Feature Scaling 
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test) """

# Fitting Random Forest Regression Model to the dataset
from sklearn.ensemble import RandomForestRegressor
rf_reg = RandomForestRegressor(n_estimators = 300, random_state = 0)
rf_reg.fit(X, Y)


# Predicting new results with Random Forest Regression Model
y_pred = rf_reg.predict(6.5)


# Visualising the Random Forest Regression Model Results
X_grid = np.arange(min(X), max(X), 0.01)
X_grid = X_grid.reshape(len(X_grid), 1)
plt.scatter(X, Y, color = 'blue')
plt.plot(X_grid, rf_reg.predict(X_grid), color = 'black')
plt.title('Predicted Salary vs Levels (Random Forest Regression)')
plt.xlabel('Levels')
plt.ylabel('Predicted Salary')
plt.show()
