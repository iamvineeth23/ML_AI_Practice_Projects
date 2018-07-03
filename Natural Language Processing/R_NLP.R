# Natural Language Processing

# Importing the dataset
dataset_original = read.delim('Restaurant_Reviews.tsv', header = TRUE, quote = "", stringsAsFactors = FALSE)

# Cleaning the text
#install.packages('tm')
# install.packages('SnowballC')
library(tm)
library(SnowballC)
corpus = VCorpus(VectorSource(dataset_original$Review))
# to view 
# as.character(corpus[[1]])

corpus = tm_map(corpus, content_transformer(tolower)) #everything to lower case
corpus = tm_map(corpus, removeNumbers) #remove numbers
corpus = tm_map(corpus, removePunctuation) #remove punctuation
corpus = tm_map(corpus, removeWords, stopwords()) #remove irrelevant words
corpus = tm_map(corpus, stemDocument) #stemming 
corpus = tm_map(corpus, stripWhitespace) #removing extra spaces

# Creating the bag of words model
dtm = DocumentTermMatrix(corpus)
dtm = removeSparseTerms(dtm, 0.999)

dataset = as.data.frame(as.matrix(dtm))
dataset$Liked = dataset_original$Liked

# Random forest classification model

#Encoding the target feature as factor
dataset$Liked = factor(dataset$Liked,
                           levels = c(0,1)) 

library(caTools)
set.seed(123)
split = sample.split(dataset$Liked, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting Random Forest classifier to the Training Set
library(randomForest)
n = dim(dataset)[2]
classifier = randomForest(x = training_set[-n],
                          y = training_set$Liked,
                          ntree = 10)

# Predicting the Test set results 
y_pred = predict(classifier, newdata = test_set[-n])

# Making the confusion Matrix
cm = table(test_set[,n], y_pred)








