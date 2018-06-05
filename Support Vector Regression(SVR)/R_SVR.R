#SVR

#Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Fitting SVR Model to the dataset
library(e1071)
sv_reg = svm(formula = Salary ~ .,
             data = dataset,
             type = 'eps-regression')

#Predicting the results with SVR Model
y_pred = predict(sv_reg, newdata = data.frame(Level = 6.5))

# Visualising the Regression Model
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = 'red') + 
  geom_line(aes(x = dataset$Level, y = predict(sv_reg, newdata = dataset)), colour = 'blue') +
  ggtitle('Predicted Salary vs Levels (SVR Model)') +
  xlab('Levels') +
  ylab('Predicted Salary')

# for getting smoother curves
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = 'red') + 
  geom_line(aes(x = x_grid, y = predict(sv_reg, newdata = data.frame(Level = x_grid))), colour = 'blue') +
  ggtitle('Predicted Salary vs Levels (SVR Model)') +
  xlab('Levels') +
  ylab('Predicted Salary')
