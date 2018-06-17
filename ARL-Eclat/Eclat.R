#Eclat

# Data Pre-processing

#Creating a sparse matrix for the dataset
library('arules')
dataset = read.transactions('Market_Basket_Optimisation.csv', sep = ',',
                            rm.duplicates = TRUE)
#summary(dataset)
itemFrequencyPlot(dataset, topN = 10) #dataset visualisation

# Training Eclat on the dataset
rules = eclat(data = dataset, parameter = list(support = 0.003, minlen = 2))

# Visualising the results
inspect(sort(rules, by = 'support')[1:10])
