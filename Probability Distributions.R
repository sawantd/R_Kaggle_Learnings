# Probability measures how likely it is for an event to occur on a scale from 
# 0 ( the event never occurs ) to 1 ( the event always occurs )

# Probability distribution describes how a r.v is distributed,
# it tells us which values a r.v is most likely to take on and which is less likely.


#########################################################################################
### Distribution Function Basics and The uniform distribution ###
#########################################################################################

# The uniform distribution is a probability distribution where each value within a certain range
# is equally likely to occur and values outside of the range never occur
# If we make a density plot of a uniform distribution, it appears flat 
# because no value is any more likely than another

options(warn = -1)                      # suppress warnings
uniform_data <-runif(1000000, 0, 10)     # generate data from a uniform distribution
plot(density(uniform_data))

# the area under the probability density curve is always equal to 1
# Every probabilty distribution in R comes with 4 function prefixes: "r", "p", "q" and "d"

#######################################################################
# "r" prefix is used to generate random numbers from a specified distribution
more_random_data <- runif(n = 10000, min = 0, max = 10)    # generate 10000 random numbers

# "p" prefix is used to determine the prob. that an obs. drawn from a distribution falls below a specified value
# ( known as "cumulative distrbution function)
# In essence, "p" gives you the area under the distribution's density curve to the left
# of a certain value on the x-axis
punif(q = 2.5, min = 0, max = 10)    # q is the cut-off value ( quantile )

# "q" prefix is the inverse of the prefix "p"
# It returns cut-off value (quantile) associated with a given probability
qunif(p = 0.40, min = 0, max=10)    # p is probability cut-off

# "d" prefix gives you the density (height of the density curve) at a given point
dunif(x = 0, min = 0, max = 10)    # x is the value at which to check density
dunif(x = 5, min = 0, max = 10)    # checking some more densities
dunif(x = 10, min = 0, max = 10)
dunif(x = 11, min = 0, max = 10)   # a value outside distribution's range has 0 probability 

#######################################################################################
### Generating random numbers and setting the seed ###
#######################################################################################

# any time you need to generate randm real numbers in a range with equal prob. you can use runif()
# the uniform dist. is cont. meaning the values it generates can take on any real numbered value within the specified range
# so the nos. it generates are decimals.
# if you need to generate integers instead of decimals, you could use floor() to round the decimals down
random_ints <- floor(runif(100000, 1,11))   # generate random data and round down
table(random_ints)

# Using runif() is not necessary to generate integers however:
# you can use the sample(), to draw a specifies no. of samples from a vector instead
random_ints2 <- sample(x = 1:10,           # vector to sample from
                       size = 100000,      # number of samples
                       replace = TRUE)     # sample with replacement
table(random_ints2)

## When generating random data and working with functions that involve randomization,
## Your results can differ from one run to the next
## To make you results reproducible, you can set a seed as follows
set.seed(12)          # set seed to arbitrary value
runif(5,1,5)          # generate some random numbers

set.seed(12)          # reset seed to the same value
runif(5,1,5)          # generate more random numbers
# this reproducibilty illustrates the fact that these r.n aren't truely random,
# but rather "pseudorandom"


###########################################################################################
### Normal Distribution ###
############################################################################################
## The normal or gaussian distribution is a cont. prob. dist. characterized by a 
# "symmetric bell-shaped curve".
# A normal dist. is defoned by its centre (mean) and spread (standard deviation)

normally_distributed <- rnorm(1000000, mean = 0, sd = 1)

prob_under_minus1 <- pnorm(q=-1, 0, 1)               # prob. below -1
prob_over_1 <- 1 - pnorm(q=1, 0, 1)                  # prob. above 1
between_prob <- 1 - (prob_over_1 + prob_under_minus1)  # prb. between -1 and 1

prob_under_minus1
prob_over_1
between_prob


## Finding quantiles of a normal distribution
qnorm(p=0.025)      # quantile at 2.5% cut-off
qnorm(p=0.975)      # quantile at 97.5% cut-off

## the quantile output above confirms that roughly 5% of the data lies more than 2 sd from the mean

###########################################################################################
### Binomial Distribution ###
###########################################################################################
# the binomial dist. is a dicrete prob. dist. that models the outcomes of a given random trails of some exp.
# or event with a known prob. of success.
# defined by two parameters : the probability of success in any iven trail and the no. of random trials
# each individaul trial is known as "Bernoulli random trial"

fair_coins_flip <- rbinom(1000000, size = 10, p = 0.5)
table(fair_coins_flip)
hist(fair_coins_flip, breaks = seq(-0.5,10.5,1))

# the histogram shows that a binomial dist. with a 50% prob. of success is symmetric, 
# with the most likely outcomes lying at the centre. This is reminiscent of normal dist.
# but if we alter the success prob., the dist. won't be symmetric

set.seed(9)
biased_coin_flip <- rbinom(1000000, 10, 0.8)
table(biased_coin_flip)
hist(biased_coin_flip, breaks = seq(-0.5,10.5,1))

# check the chances of achieving 5 successes or less
pbinom(q=5, 10, 0.8)
# check chances of achieving 9 successes or more
pbinom(q=9, 10, 0.8, lower.tail = F)   # check the upper tail

# dbinom() checks the density of the binomial at a given value of x
 ## check prob. of 5 successe in 10 flips in fair coin
dbinom(x = 5 , size = 10, prob = 0.5)
 ## check prob. of 8 successes in 10 flips of biased coin
dbinom(x = 8, size = 10, prob = 0.8)


########################################################################################
### Geometric and Exponential Distributions ###
#########################################################################################
# the geometric and exponential distribution models the time it takes for an event to occur
# the geometric distribution is discrete and models the number of trials it takes to achieve the sucess
## in repeated exp. with a given prob. of success
# the exponential distribution is a cont. analog of the geometric dist. and models the amount of time
## you have to wait before an event occurs with a certain occurrence rate

#### 1. Geometric Distribution
# In R, the geom functions actually models the no. of failures until the first successes,
## so we need to add 1 to get the number of trials until the first success
set.seed(12)
flips_Till_heads <- rgeom(n = 1000000, prob = 0.5) + 1
table(flips_Till_heads)
hist(flips_Till_heads, breaks = seq(-0.5, max(flips_Till_heads) + 0.5))

## lets use pgeom() to get the prob. of 6 flips or more to get a success
pgeom(q=6, prob = 0.5, lower.tail = F)

# use dgeom() to get the prob. of specific no. of failures before a success
## check the chance of getting one failure and then a success
dgeom(x = 1,
      prob = 0.5)

#### 2. Exponential Distribution
# generating exponential dist. where we have to wait longer than 1 time unit for a success and plot it
exponential_data <- rexp(n = 1000000, rate = 1)      # success/arrival rate

 ## get prob. of waiting more than 1 time unit before a success
pexp(q = 1, rate = 1, lower.tail = FALSE)

##### Similar to geometric dist., the exponential dist. starts high and has a long tail that trails off
## to the right that contains rare cases where you have to wait much longer than avg. of an arrival


#################################################################################################
###### Poisson Distribution #######
############################################################################################
 ## the poisson dist. models the prob. of seeing a certain no. of successes within a time interval,
## where the time it takes for the next success is modelled by the an exponential dist.

## it can be used to model
 # traffic
 # no. of arrivals a hospital can expect in an hour's time
 # no. of emails you'd expect to receive in a week

set.seed(12)
arrival_rate_1 <- rpois(n = 1000000, lambda = 1)
table(arrival_rate_1)
hist(arrival_rate_1, breaks = seq(-0.5, max(arrival_rate_1) + 0.5, 1))

## the histogram shows that when arrival rate is low, it is rare to see more than a couple of arrivals
## in each time period
## when the arrival rate is hogh, it becomes increasingly rare to see a low no. of arrivals
## and the dist. starts to look more symmetric

set.seed(12)
arrival_rate_10 <- rpois(n = 1000000, lambda = 10)
table(arrival_rate_10)
hist(arrival_rate_10, breaks = seq(-0.5, max(arrival_rate_10) + 0.5, 1))

# check the prob. of getting 5 arrivals or less
ppois(q = 5, lambda = 10)

# check prob. of getting exactly 10 arrivals
dpois(x = 10, lambda = 10)
