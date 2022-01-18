######### Exploring the Variables #########
titanic_train <- read.csv("../Data/titanic/train.csv")

 # check the structure of the data
str(titanic_train)

 # check the data summary
summary(titanic_train)

### Questions after checkin the data ###
# Do I need all of the variables?
# Should I transform any variables?
# Are there NA values, outliers or other strange values?
# Should I create new Variables?


### Do I need all of the variables ?

 # It you want to remove unwanted variables then do the following
titanic_train$PassengerId <- NULL      # Remove Passenger Id

### Name , Ticket and Cabin
 # sort() returns the names in sorted order
print(head( sort(titanic_train$Name), 15))            # Unique 891 records
print(head( sort(titanic_train$Ticket), 25))          # Too amny categories 681 near to total records
print(head( sort(titanic_train$Cabin), 25))           # can be used for predictive purpose (148 categories)
                                                        # we can group it further by combining based on first letter

#### should I transform Any variable ?

 # let's turn back Name to character variable

titanic_train$Name <- as.character(titanic_train$Name)

#############################################################################
 # No let's inspect Survived variable using the table function
table(titanic_train$Survived)   # table of counts

 # Survived is treated as integer variable. So lets convert it to a factor variable
new_survived <- factor(titanic_train$Survived)
levels(new_survived) <- c("Died", "Survived")
table(new_survived)

# Pclass variable is also treated as integer but it has only 3 values denoting passenger classes
# So it should be treated as ordered factor
titanic_train$Pclass <- ordered(titanic_train$Pclass, levels = c("3", "2", "1"))
table(titanic_train$Pclass)

##############################################################################
 # revisiing the Cabin variable
## Strip of the first letter and categorise

char_cabin <- as.character(titanic_train$Cabin)         # convert to character
new_cabin <- ifelse( char_cabin == " ",                 # if missing
                     " ",                               # then keep it as missing
                     substr(char_cabin,1,1))            # else transform it to a substring
new_cabin <- factor(new_cabin)                          # convert back to a factor
table(new_cabin)

###############################################################################

####### Are there NA values, outliers or other strange values? ########

 ## you can detect NA values with the is.na() function
dummy_vector <- c(1,1,2,3,NA,4,3,NA)
is.na(dummy_vector)                   # check whether values are NA or not

## We know Age variable has NA values
summary(titanic_train$Age)

 # with 177 NA values, it's probably not a good idea to throw all those records away
 # Here are a few ways we could deal with them
 # 1. Replace all the NA's with zero or a negative value
 # 2. Replace the NA's with some central or comman value like the mean, median or mode
 # 3. impute values using some other method
 # 4. Split the data into two parts: one set where records have an Age value and one set where Age is NA

### sensing the distribution of age by creating a histogram with the hist() function

 # this code sets the plot to desired display size for thus
options(repr.plot.width=4, repr.plot.height=4)
 # create a histogram of age with 20 bins
hist(titanic_train$Age, breaks = 20)

# 28 is the median age
#####################################################################################
na_logical <- is.na(titanic_train$Age)           # Create a logical variable to flag NA
new_age_var <- ifelse(na_logical,                # If NA was found
                      28,                        # change the value to 28
                      titanic_train$Age)         # else keep the old value
titanic_train$Age <- new_age_var                 # Update the Age variable
summary(titanic_train$Age)                      # Check the new age variable

# recheck the histogram
hist(titanic_train$Age, breaks = 20)


######################################################################################
# Looking into Fare variable
# to see this we are going to use boxplot, since boxplots are designed to show the spread of the data
# and help identify outliers
boxplot(titanic_train$Fare)

 # outliers are present, so to check who the passenger is we check the index of the maximum Fare
high_roller_index <- which.max(titanic_train$Fare)        
high_roller_index                       # Check the index
titanic_train[high_roller_index,]        # use the index to check the record

######################################################################################
## Should I create new variables? #######

## Suppose we want to know the total number of family members that travelled
# Let's create a new variable Family that combines Sibp and Parch to indicate the total number of family members

titanic_train$Family <- titanic_train$SibSp + titanic_train$Parch

# For interest's sake, let's find out who had the most family members onboard
most_family <- which(titanic_train$Family == max(titanic_train$Family))   #gives the index where the condition matches
most_family
titanic_train[most_family,]

## NOTE : which.max() returns only a single index number which is the first case matched even if there are some more cases
        # satisfying the same criteria but those are not shown
