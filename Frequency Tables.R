####### loading data #######
titanic_train <- read.csv("../Data/titanic/train.csv")   
summary(titanic_train)
str(titanic_train)

## preprocessing steps
char_cabin <- as.character(titanic_train$Cabin)
new_cabin <- ifelse(char_cabin == "",
                    "",
                    substr(char_cabin, 1, 1))
titanic_train$Cabin <- factor(new_cabin)

str(titanic_train)

####### ONE WAY TABLES #########
###################################################################
## one way table with counts for each of the variable levels
table(titanic_train$Survived)
table(titanic_train$Pclass)
table(titanic_train$Sex)
table(titanic_train$Cabin)


####################### vector indexing like operations #############################################
cabin_table <-table(titanic_train$Cabin)       # store a table
cabin_table
 
sum(cabin_table)      # get the sum of counts
length(cabin_table)   # get the length of the table i.e number of levels

cabin_table[2]        # get the second item
cabin_table[3:8]      # get items 3-8

## note : the table() function ignores the NA values by default

######### to include the NA values count in the table use "exclude = NULL" option
age_table <- table(titanic_train$Age, exclude = NULL)
age_table
 ## we can observe in the output that, creating a table of the variable which is not categorised can be quit messy to appear



## NOTE : table of numeric values can be quite long and messy.
        # it is often prescribed to explore numeric variabes using a histogram with hist()

### if we want to view a table with the missing values excluded then  do
table(titanic_train$Cabin, exclude = c(""))


### One of the most important aspects of frequency table is that they allow you to 
## extract the proportion of the data that belongs to each level
gender_table <- table(titanic_train$Sex)
gender_table / sum(gender_table)

  ## OR alternatively you can pass the table to the prop.table()
prop.table(gender_table)



######### TWO WAY TABLES ###########
######################################################################

## table of Survival vs. Sex
survived_sex <- table(titanic_train$Survived, titanic_train$Sex)
survived_sex

rownames(survived_sex) <- c("Died", "Survived")
survived_sex

#### some operational functions on Two way table
rowSums(survived_sex)      # get row totals
colSums(survived_sex)      # get col totals
survived_sex[2, 1]         # get the value in row 2 and col 1
prop.table(survived_sex)   # check the proportion of counts at each level

### proportions accross variables
 # set margin = 1 to get proportions across rows
prop.table(survived_sex, margin = 1)
 # set margin =  to get proportions across columns
prop.table(survived_sex, margin = 2)


#### Higher Dimentional  tables ######
surv_sex_class <- table(titanic_train$Survived,
                        titanic_train$Sex,
                        titanic_train$Pclass)
dimnames(surv_sex_class)

  # assign names to the dimensions
dimnames(surv_sex_class)[[1]] <- c("Died", "Survived")
dimnames(surv_sex_class)[[3]] <- c("class1", "class2", "class3")

surv_sex_class       # check the three way table


 ## proportion 
prop.table(surv_sex_class, margin = c(2,3))
