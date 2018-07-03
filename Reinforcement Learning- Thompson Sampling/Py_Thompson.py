"""
@author: vineethbharadwajp
"""

# Thompson Sampling


# Importing the libraries
import matplotlib.pyplot as plt
import pandas as pd
import random

# Importing the dataset
dataset = pd.read_csv('Ads_CTR_Optimisation.csv')

# Implementing Thompson Sampling
N = dataset.shape[0]
d = dataset.shape[1]
ads_selected = []
num_rewards_1 = [0]*d
num_rewards_0 = [0]*d
total_reward = 0
for n in range(N):
    ad = 0 
    max_random = 0
    for i in range(d):
        random_beta = random.betavariate(num_rewards_1[i] + 1,
                                         num_rewards_0[i] + 1)
        if random_beta > max_random:
            max_random = random_beta
            ad = i
    ads_selected.append(ad)
    reward = dataset.values[n,ad]
    if reward == 1:
        num_rewards_1[ad] += 1
    else:
        num_rewards_0[ad] +=1
    total_reward += reward 
        
# Visualising the results 
plt.hist(ads_selected)
plt.title('Histogram of Ads Selected')
plt.xlabel('Ads')
plt.ylabel('Click count')
plt.show()