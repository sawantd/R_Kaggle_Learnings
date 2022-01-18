### Descriptive Statistics are measures that summarize important features of data,
 ## Often with a single number
 ## Producing descriptive statistics is a comman first step to take after cleaning and preparing a dataset for analysis


#### Measures of Center
  ## Measures of center are statistics that give us a sense of the "middle" of a numeric varaible.
  ## In other words, centrality measures give you a sense of a typical value you'd expect
  ## Comman measures of center include the mean, median and mode


###### Mean - average value ########
 cars <- mtcars               # using the mtcars dataset

 mean(cars$mpg)               # mean() gets the mean for 1 variable

  # colMeans() gets the mean for all columns in a data frame
 colMeans(cars)
  # rowMeans() gets the mean for all rows in a data frame
 head(rowMeans(cars))


###
 
 ### Median ########
 ## median of a distribution is the value where 50% of the data lies below and 50% lies above it
 ## In essence, the median splits the data in half
 ## median is also known as the 50% percentile, since 50% of the observations are found below it
 
 median(cars$mpg)
 
 
 ##  to get the median of every column, we can use the apply()
 ## which takes a data object, a function to execute and a specified margin ( rows or columns)
 
 colMedians <- apply(cars,
                     MARGIN = 2,       # operate on columns
                     FUN = median)     # use function median
 colMedians 
 
 rowMedians <- apply(cars,
                     MARGIN = 1,
                     FUN = median)
head(rowMedians)


##############################################################################
 ### Although the mean and median both give us some sense of the center of a distribution
 ## they aren't always the same
 ## in symmetric distribution, the mean and median will the same

norm_data <- rnorm(100000)        # Generate normally distributed data
plot(density(norm_data))          # create a density plot

abline(v=mean(norm_data), lwd=5)  # Plot a thick black line at the mean
abline(v=median(norm_data), col = "red", lwd=2)   # Plot a red line at the median
  ### if there are outliers then the mean tends to fluctuate a lot
 ### but a median is said to be a robust statistics because it tends to resist such influences

##### create another plot to investigate this

skewed_data <- rexp(100000, 1)      # generate data
plot(density(skewed_data), xlim = c(0,4))

abline(v=mean(skewed_data), lwd = 5)
abline(v=median(skewed_data), col="red", lwd = 2)


##### Mode ( most comman value that occurs) ######
 # create dummy data
data <- c("cat", "cat", "hat", "sat", "cat", "hat", "hat", "hat")

 # create table of counts
data_table <- table(data)
data_table

 # get the index of the variable with the maximum count
max_index <- which.max(data_table)
max_index

 # use the index to get the mode from the table's name
names(data_table)[max_index]


######## If you repeatedly find the mode, you could wrap these steps into a user-defined function

mode_function <- function(data){                      # Define new function
  data_table <- table(data)                           # create data table
  max_index <- which.max(data_table)                  # find max index
  if (is.numeric(data)){                              # If input is numeric data
    return(as.numeric(names(data_table)[max_index]))  # return output as numeric
  }
  names(data_table)[max_index]                # Otherwise return output as character
}

mode_function(data)


##### Get the mode of numeric columns in cars dataset
colModes <- apply(cars,
                  MARGIN = 2,
                  FUN = mode_function)
colModes


##############################################################################
#### Measures of Spread ####
 ## Measures of spread ( or dispersion) are statistics that describe how data varies
 ## while measures of center give us an idea of the typical value,
 ## measures of spread give us a sense of how much the data tends to diverge from the typical value


#### Range ( distance between the maximum and minimum observations) ####
 ## subtract min from max to get the range
max(cars$mpg) - min(cars$mpg)

 ### earlier we noted that the median is the 50th percentile of the data
  ## we can find any other percentile of the data by using quantile()

quantile(cars$mpg)     # Gives 0th, 25th, 50th, 75th and 100th percentile

 # or

# five number summary
fivenum(cars$mpg)

 # or

# summary() shows the five number summary plus the mean
summary(cars$mpg)


########### If you want to get specific quantiles ############
quantile(cars$mpg,
         probs = c(0.1, 0.9))    # get the 10th and 90th percentile

###############################################################
###### Interquartile(IQR) range
 ## IQR is the distance between the 3rd quartile and the 1st quartile which encompasses half the data

IQR(cars$mpg)

 ### the boxplot we learned to create are just visual representations of the five number summary and IQR
five_num <- fivenum(cars$mpg)
boxplot(cars$mpg)

text(x=five_num[1], adj = 2, labels = "Minimum")
text(x=five_num[2], adj = 2.3, labels = "1st Quartile")
text(x=five_num[3], adj = 3, labels = "Median")
text(x=five_num[4], adj = 2.3, labels = "3rd Quartile")
text(x=five_num[5], adj = 2, labels = "Maximum")
text(x=five_num[3], adj = c(0.5, -8), labels = "IQR", srt = 90, cex = 2)



####################################################################################
 ## Variance and Standard deviation are two other comman measures of spread

 #######  Variance ##########
  # the variance of a distribution is the average of the squared deviations(differnces) from the mean
  # use the built in function var() to check variance
var(cars$mpg)

####### Standard Deviation ########
 # is the square root of the variance
 # it puts the units back to the original units
sd(cars$mpg)


  ### Since variance and standard deviation are both derived from the mean
   ## Both are susceptible to the influence of data skew and outliers

#### MEDIAN ABSOLUTE DEVIATION  
  ## is an alternative measure of spread based on the median, which inherits the median's robustness
  ## against data skew and outliers
mad(cars$mpg)


#####################################################################################
####### Skewness and Kurtosis #########
# Beyond the measure of center and spread, descriptive statistics include measures that give
# you a sense of shape of a distribution
# Skewness measures the skew or asymmetry of a distribution
# Kurtosis measure the peakedness of a distribution

#### skewness and kurtosis take the idea of variance a step further
 ## skewness involves cubing deviations from the mean 
 ## kurtosis involves raising deviations from the mean to the 4th power
install.packages("e1071")
library(e1071)

normal_data <- rnorm(100000)                         # generate normally distributed data
skewed_data <- c(rnorm(35000, sd=2)+2, rexp(65000))  # Generate skewed data
uniform_data <- runif(100000, 0, 1)                  # generate uniformly distributed data
peaked_data <- c(rexp(100000),                       # generate data with a sharp peak
                 (rexp(100000)*-1))

## make density plots of the distribution
par(mfrow=c(2,2))             # par() lets you set various graphical parameters
plot(density(normal_data))
plot(density(skewed_data), xlim=c(-5,5))         
plot(density(uniform_data))
plot(density(peaked_data), xlim=c(-5,5))

 ### now lets check skewness of each distributions 
  ## since skewness measures asymmetry, we'd expect to see low skewness for all distribution except 2nd
  ## because all other are roughly symmetric

skewness(normal_data)     #requires package
skewness(skewed_data)
skewness(uniform_data)
skewness(peaked_data)

### here the 3 roughly symmetric distributions have almost zero skewness
## while the positively skewed distribution has positive skewness

#### Now let's check kurtosis ######
 ## since kurtosis measures peakedness, we would expect the flat(uniform) distribution have low kurtosis
 ## while the distributions with sharper peaks should have higher kurtosis

kurtosis(normal_data)
kurtosis(skewed_data)
kurtosis(uniform_data)
kurtosis(peaked_data)

## as we can see from the output, the normally distributed data has a kurtosis near zero
## the flat distribution has negative kurtosis
## and the two pointer distributions have positive kurtosis