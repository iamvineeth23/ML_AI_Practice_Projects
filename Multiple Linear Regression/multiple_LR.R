# Multiple Linear Regression

setwd("~/Documents/Machine Learning/ML-R_and_Py/My_Trials/3")

#Importing the dataset
dataset = read.csv('50_Startups.csv')
#dataset = dataset[, 2:3]

#Encoding categorical data
dataset$State = factor(dataset$State, 
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))

# Splitting dataset into training set and test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Fitting Multiple Linear Regression to the Training Set
regressor = lm(formula = Profit ~ ., #. to include all the independent variables
               data = training_set)

# regressor = lm(formula = Profit ~ R.D.Spend,
#                data = training_set)

#Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# Building the optimal model using Backward Elimination
"""
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = dataset) # taking dataset just to check the correlation
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = dataset) # taking dataset just to check the correlation
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset) # taking dataset just to check the correlation
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend,
               data = dataset) # taking dataset just to check the correlation
summary(regressor)
"""
#Automatic Backward Elimination
backwardElimination <- function(x, sl){
  numVars = length(x)
  for (i in c(1:numVars)){
    regressor = lm(formula = Profit ~ ., data = x)
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    if (maxVar > sl){
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[, -j]
    }
    numVars = numVars - 1
  }
  return(summary(regressor))
}

SL = 0.05
dataset = dataset[, c(1,2,3,4,5)]
backwardElimination(training_set, SL)

