"""
@author: vineethbharadwajp
"""
# Natural Language Processing

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Restaurant_Reviews.tsv', delimiter = '\t',
                      quoting = 3) # ignores the double quotes

#### Cleaning the texts  ##### 
import re
import nltk
#nltk.download('stopwords')
from nltk.corpus import stopwords
from nltk.stem.porter import PorterStemmer
ps = PorterStemmer()


corpus = []

for i in range(dataset.shape[0]):
    review = re.sub('[^a-zA-Z]', #not to remove all letter (both capital and small)
                    ' ',        #removed parameter will be replaced by space
                    dataset['Review'][i])
    #bring everything to lower case
    review = review.lower()
    #removing irrelevant words and stemming
    review = review.split()
    review = [ps.stem(word) for word in review if not word in set(stopwords.words('english'))]
    review = ' '.join(review)
    corpus.append(review)

# Creating the Bag of Words model
from sklearn.feature_extraction.text import CountVectorizer
cv = CountVectorizer(max_features = 1500)
X = cv.fit_transform(corpus).toarray()
y = dataset.iloc[:,1].values

# Splitting the dataset into the Training set and Test set
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.20, random_state = 0)

# Fitting Naive Bayes Classifier to the Training Set
from sklearn.naive_bayes import GaussianNB
classifier = GaussianNB()
classifier.fit(X_train, y_train)

# Predicting the Test set results
y_pred = classifier.predict(X_test)

# Making the Confusion Matrix
from sklearn.metrics import confusion_matrix #importing function
cm = confusion_matrix(y_test, y_pred)



#from nltk import ngrams
#sentence = 'this is a foo bar sentences and i want to ngramize it'
#n = 3
#sixgrams = ngrams(sentence.split(), n)
#for grams in sixgrams:
#  print(grams)




    