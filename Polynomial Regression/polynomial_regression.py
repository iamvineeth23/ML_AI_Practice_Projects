
"""
@author: vineethbharadwajp
"""
#Polynomial Regression


# Data Preprocessing

# Importing Libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:, 1:2].values #independent variable
Y = dataset.iloc[:, 2].values   #dependent variable

# Fitting Linear Regressor to the dataset
from sklearn.linear_model import LinearRegression
lin_reg = LinearRegression()
lin_reg.fit(X, Y)

# Fitting Polynomial Regression to the dataset
from sklearn.preprocessing import PolynomialFeatures
poly_reg = PolynomialFeatures(degree = 4)
X_poly = poly_reg.fit_transform(X)

lin_reg2 = LinearRegression()
lin_reg2.fit(X_poly, Y)

# Visualising the Linear Regression Results
plt.scatter(X, Y, color = 'red')
plt.plot(X, lin_reg.predict(X), color = 'blue')
plt.title('Predicted Salary vs Levels (Linear Regression)')
plt.xlabel('Levels')
plt.ylabel('Predicted Salary')
plt.show()

# Visualising the Polynomial Regression Results
X_grid = np.arange(min(X), max(X), 0.1)
X_grid = X_grid.reshape(len(X_grid), 1)
plt.scatter(X, Y, color = 'blue')
plt.plot(X_grid, lin_reg2.predict(poly_reg.fit_transform(X_grid)), color = 'black')
plt.title('Predicted Salary vs Levels (Polynomial Regression)')
plt.xlabel('Levels')
plt.ylabel('Predicted Salary')
plt.show()

# Predicting new results with Linear Regression 
lin_reg.predict(6.5)

# Predicting new results with Polynomial Regression
lin_reg2.predict(poly_reg.fit_transform(6.5))





