#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
@author: vineethbharadwajp
"""

#SVR

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

""" 
##Feature Scaling 
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X = sc_X.fit_transform(X)
sc_Y = StandardScaler()
Y = Y.reshape(-1, 1)
Y = sc_Y.fit_transform(Y)


# Fitting SVR to the dataset
from sklearn.svm import SVR
svr_reg = SVR(kernel = 'rbf')
svr_reg.fit(X, Y) 


# Predicting new results with Regression Model
y_pred = sc_Y.inverse_transform(svr_reg.predict(sc_X.transform(np.array([[6.5]]))))


# Visualising the SVR Model Results
X_grid = np.arange(min(X), max(X), 0.1)
X_grid = X_grid.reshape(len(X_grid), 1)
plt.scatter(X, Y, color = 'blue')
plt.plot(X_grid, svr_reg.predict(X_grid), color = 'black')
plt.title('Predicted Salary vs Levels (SVR)')
plt.xlabel('Levels')
plt.ylabel('Predicted Salary')
plt.show()