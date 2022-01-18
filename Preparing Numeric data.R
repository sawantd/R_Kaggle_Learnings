###### Centering and Scaling Data ( data normalization) #######
cars <- mtcars
summary(cars)
auto_scaled <- scale(cars,             # numeric data object
                        center = T,       # center the data?
                        scale = T)        # scale the data?
summary(auto_scaled)

####### Dealing with Skewed Data #######
options( repr.plot.width=4, repr.plot.height=4)

## Generate normally distributed data
normally_distributed <- rnorm(1000)
## Create a histogram of the distribution
hist(normally_distributed, breaks = 30)

## Generate skewed data
skewed_right <- rexp(1000, 0.5)
## Create histogram of the distribution
hist(skewed_right, breaks = 50)


###### to reduce the skewness #########
sqrt_transform <- sqrt(skewed_right)
hist(sqrt_transform, breaks = 50)

log_transform <- log(skewed_right + 1)     # adding one so that we dont end up with negative values
hist(log_transform, breaks = 50)

###### highly correlated variables #######

## check the pairwise correlations of 6 variables
cor(cars[,1:6])


#### If you find highly correlated variables, there are a few things you can do 
  #1) Leave them be
  #2) Remove one
  #3) Combine them in some way


##### imputing missing data #####
 ### to impute vaues we use KNN imputation
install.packages("caret")
install.packages("RANN")

library(caret)
library(RANN)

## include missing values in the cars dataset
remove_rows <- c(3,5,8,9,15,20)
origial_vals <- cars$mpg[remove_rows]
origial_vals

# set some rows to NA
cars$mpg[remove_rows] <- NA
summary(cars$mpg)


#### to imput the NA values
impute <- preProcess(cars, method = c("knnImpute"))
impute
  # predict new values based on preprocessing
cars <- predict(impute, cars)
summary(cars$mpg)


####### To check the original values and imputed values for comparison
 ## Imputed values
imp_vals <- cars$mpg[remove_rows] * sd(mtcars$mpg) + mean(mtcars$mpg)
imp_vals

 ## Original values
origial_vals

 ## Average absolute difference
mean(abs(origial_vals - imp_vals))


###### lets check the imputed values by comparing it with median values
mpg_median <- median(mtcars$mpg[-remove_rows])
mpg_median

mean(abs(origial_vals - mpg_median))
