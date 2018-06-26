# Thompson Sampling

# Importing the dataset
dataset = read.csv('Ads_CTR_Optimisation.csv')

# Implementing the Thompson Sampling
N = dim(dataset)[1]
d = dim(dataset)[2]
ads_selected = integer(0)
num_reward_1 = integer(d)
num_reward_0 = integer(d)
total_reward = 0
for (n in 1:N){
  ad = 0
  max_random = 0
  for (i in 1:d){
    random_beta = rbeta(n = 1,
                        shape1 = num_reward_1[i]+1,
                        shape2 = num_reward_0[i]+1)
    if (random_beta > max_random){
      max_random = random_beta
      ad = i
    }
  }
  ads_selected = append(ads_selected, ad)
  reward = dataset[n, ad]
  if (reward == 1){
    num_reward_1[ad] = num_reward_1[ad] + 1
  } else {
    num_reward_0[ad] = num_reward_0[ad] + 1
  }
  total_reward = total_reward + reward
}

# Visualising the results
hist(ads_selected,
     col = 'blue',
     main = 'Histogram of ads selection',
     xlab = 'Ads',
     ylab = 'Click count')