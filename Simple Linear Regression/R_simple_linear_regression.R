setwd("~/Documents/Machine Learning/ML-R_and_Py/My_Trials/2")

#Importing the dataset
dataset = read.csv('Salary_Data.csv')
#dataset = dataset[, 2:3]

# Splitting dataset into training set and test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting Simple Linear Regression to the Training Set
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

#Visualising the Training set results
# install.packages('ggplot2')
library(ggplot2)
ggplot() + 
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') + 
  geom_line(aes(x = training_set$YearsExperience, predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Training Set)') +
  xlab('Years of Experience') +
  ylab('Salary')

# library(ggplot2)
# ggplot(data=training_set, aes(x=YearsExperience, y=Salary)) +
#   geom_point(colour = 'red') +
#   geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
#             colour = 'blue') +
#   geom_smooth(method=lm)+
#   ggtitle('Salary vs Experience (Training set)') +
#   xlab('Years of experience') +
#   ylab('Salary')

#Visualising the Test set results
# install.packages('ggplot2')
library(ggplot2)
ggplot() + 
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'black') + 
  geom_line(aes(x = training_set$YearsExperience, predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Test Set)') +
  xlab('Years of Experience') +
  ylab('Salary')






