# Reinforcement learning - Upper Confidence Bound

# Importing the dataset
 dataset = read.csv('Ads_CTR_Optimisation.csv')
 
 # Implementing the UCB
 N = dim(dataset)[1]
 d = dim(dataset)[2]
 ads_selected = integer(0)
 number_of_selections = integer(d)
 sum_of_rewards = integer(d)
 total_reward = 0
 for (n in 1:N) {
   max_upper_bound = 0
   ad = 0
   for (i in 1:d){
     if (number_of_selections[i] > 0){
       average_reward = sum_of_rewards[i]/ number_of_selections[i]
       delta_i = sqrt(3/2* log(n)/ number_of_selections[i])
       upper_bound = average_reward + delta_i
     } else {
       upper_bound = 1e400
     }
     if (upper_bound > max_upper_bound){
       max_upper_bound = upper_bound
       ad = i
     }
   }
   ads_selected = append(ads_selected, ad)
   number_of_selections[ad] = number_of_selections[ad] + 1
   sum_of_rewards[ad] = sum_of_rewards[ad] + dataset[n, ad]
   total_reward = total_reward + dataset[n,ad]
 }
 
 # Visualising the results
 hist(ads_selected,
      col = 'blue',
      main = 'Histogram of ads selection',
      xlab = 'Ads',
      ylab = 'Click count')
 
 
 
 
 
 
 
 
 