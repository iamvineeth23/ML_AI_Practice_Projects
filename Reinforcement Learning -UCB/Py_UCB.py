"""
@author: vineethbharadwajp
"""

#Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import math

# Importing the dataset
dataset = pd.read_csv('Ads_CTR_Optimisation.csv')

# Implementing UCB
N = dataset.shape[0]
d = dataset.shape[1]
numbers_of_selection = [0] * d
sum_of_rewards = [0] * d
ads_selected = []
total_reward = 0
for n in range(N):
    max_upper_bound = 0
    ad = 0
    for i in range(d):
        if (numbers_of_selection[i]>0):
            average_reward = sum_of_rewards[i]/numbers_of_selection[i]
            delta_i = math.sqrt(3/2 * math.log(n+1)/numbers_of_selection[i])
            upper_bound = average_reward + delta_i
        else:
            upper_bound = 1e400
            
        if (upper_bound > max_upper_bound):
            max_upper_bound = upper_bound
            ad = i
    ads_selected.append(ad)
    numbers_of_selection[ad] += 1
    sum_of_rewards[ad] += dataset.values[n, ad]
    total_reward += dataset.values[n, ad]

# Visualisation of UCB
plt.hist(ads_selected)
plt.title('Histogram of Ads Selected')
plt.xlabel('Ads')
plt.ylabel('Click count')
plt.show()


    