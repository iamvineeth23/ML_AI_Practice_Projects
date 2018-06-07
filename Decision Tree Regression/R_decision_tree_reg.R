#Decision Tree Regression

#Regression Template

#Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#Feature Scaling
# training_set[,2:3] = scale(training_set[,2:3])
# test_set[,2:3] = scale(test_set[,2:3])

# Fitting Decision Tree Regression Model to the dataset
library(rpart)
decTree_reg = rpart(formula = Salary ~ .,
                    data = dataset,
                    control = rpart.control(minsplit = 1))


#Predicting the results with Decision Tree Regression Model
y_pred = predict(decTree_reg, newdata = data.frame(Level = 6.5))


# Visualising the Decision Tree Regression Model
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = 'red') + 
  geom_line(aes(x = x_grid, y = predict(decTree_reg, newdata = data.frame(Level = x_grid))), colour = 'blue') +
  ggtitle('Predicted Salary vs Levels (Decision Tree Regression)') +
  xlab('Levels') +
  ylab('Predicted Salary')
