# Apriori

# Data Pre-processing
dataset = read.csv('Market_Basket_Optimisation.csv', header = FALSE)

#Creating a sparse matrix for the dataset
library('arules')
dataset = read.transactions('Market_Basket_Optimisation.csv', sep = ',',
                            rm.duplicates = TRUE)
#summary(dataset)
itemFrequencyPlot(dataset, topN = 10) #dataset visualisation

# Training Apropri on the dataset
rules = apriori(data = dataset, parameter = list(support = 0.004, confidence = 0.2))

# Visualising the results
inspect(sort(rules, by = 'lift')[1:10])
