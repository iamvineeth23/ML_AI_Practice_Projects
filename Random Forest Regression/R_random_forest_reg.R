# Random Forest Regression

#Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Fitting Random Forest Regression Model to the dataset
library(randomForest)
set.seed(1234)
rf_reg = randomForest(x = dataset[1], # gives x dataframe
                      y = dataset$Salary, # gives y vector
                      ntree = 500)

#Predicting the results with Random Forest Regression Model
y_pred = predict(rf_reg, newdata = data.frame(Level = 6.5))


# Visualising the Random Forest Regression Model
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = 'red') + 
  geom_line(aes(x = x_grid, y = predict(rf_reg, newdata = data.frame(Level = x_grid))), colour = 'blue') +
  ggtitle('Predicted Salary vs Levels (Random Forest Model)') +
  xlab('Levels') +
  ylab('Predicted Salary')
