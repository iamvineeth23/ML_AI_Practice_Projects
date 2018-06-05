#Polynomial Regression

#setwd("~/Documents/Machine Learning/ML-R_and_Py/My_Trials/4")

#Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]
#dataset = dataset[, 2:3]


# Splitting dataset into training set and test set
# install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Purchased, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

#Feature Scaling
# training_set[,2:3] = scale(training_set[,2:3])
# test_set[,2:3] = scale(test_set[,2:3])

# Fitting Linear Regression to the dataset
lin_reg = lm(formula = Salary ~ .,
             data = dataset)


# Fitting Polynomial Regression to the dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(formula = Salary ~ .,
              data = dataset)

# Visualising Linear Regression Model
library(ggplot2)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = 'red') + 
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)), colour = 'blue') +
  ggtitle('Predicted Salary vs Levels (Linear Regression)') +
  xlab('Levels') +
  ylab('Predicted Salary')


# Visualising Polynomial Regression Model
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = 'red') + 
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)), colour = 'blue') +
  ggtitle('Predicted Salary vs Levels (Linear Regression)') +
  xlab('Levels') +
  ylab('Predicted Salary')

#Predicting the results with Linear Regression
y_pred = predict(lin_reg, newdata = data.frame(Level = 6.5))

#Predicting the results with Polynomial Regression
y_pred = predict(poly_reg, newdata = data.frame(Level = 6.5,
                                                Level2 = 6.5^2,
                                                Level3 = 6.5^3,
                                                Level4 = 6.5^4))