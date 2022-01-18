########################## Factors ########################################
 # Factors are intended to hold categorical data, variables that can take on one of several distinct values from a set
 # eg. Gender, state of residence and educational attainment
 # Factors take categorical data ansd assign each category an integer value.
 # the number of factor categories or "levels" is equal to the no. of unique elements in the vector used to make the factor

# you can create a factor by passing a char or num vector into the factor() function
gender_vector <- c(rep("male",10), rep("female",15))      # creating a char vector
gender_vector
gender_factor <- factor(gender_vector)                    # convert to factor
gender_factor

 # you can specify the levels, a factor can take by passing a character vector of levels to the levels argument
gender_factor <- factor(gender_vector,
                        levels = c("male", "female", "others"))
gender_factor

 # check and rename the levels of the factor using levels() function
levels(gender_factor)     # check levels
levels(gender_factor) <- c("male", "female", "unknown")   #rename or change levels
levels(gender_factor)

levels(gender_factor) <- c("male", "female", "unknown", "no response") # add level
levels(gender_factor)

 # you can remove factor levels with no data present by recreating the factor with the factor() function or 
 # by using the droplevels() function
gender_factor <- droplevels(gender_factor)     # drops unused levels
levels(gender_factor)


###################### Ordered factor #################################3
 # R offers a second type of factor called an ordered factor for ordinal data
 # Oridinal data is non-numeric that has some sense of natural ordering
 # To create an ordered factor, use the factor() function with the additional arguement ordered = TRUE or
 # ordered() function
#### note - it is very imp to use levels argument when creating a factor because the levels you supply are used to create the ordering from lowest to highest.

dat <- rep(c("very low", "low", "medium", "high", "very high"), 5)
dat_factor <- factor(dat,
                     levels = c("very low", "low", "medium", "high", "very high"),
                     ordered = T)
dat_factor

 # Factors are created by default for char variables. If you want a char variable to be a character only then 
 # You can use as.character() function to convert the factor to character
as.character(gender_factor)

num <- as.numeric(gender_factor)    # convert factor to numeric would yield the numeric vector with levels values
num                                 # yeilds the indices associated with the levels i.e male has index 1 nad female has index as 2

 # if you have actual numeric data in a factr and if you want to retrieve that then d the following
numeric_factor <- factor(c(-1.3, -2.6, 2.6, 3.2, 2.6, 4.5, -1.3));   # creating a numeric factor
numeric_factor

as.numeric(levels(numeric_factor))[numeric_factor]  # extracts the numbers

as.numeric(as.character(numeric_factor))            # first convert to character then numeric

 # adding more vales to a existing factor
gender_factor <- as.factor(c(as.character(gender_factor), 
                           "Other", "Unknown", "Prefer not to say"))
gender_factor

summary(gender_factor)


###################### Factor Indexing #####################
 # since factors are essentially vectors with each value being an integer paired with a character that specifies
 # the name of the level, factor indexing works the same as vector indexing

gender_factor[2]            # get the second element
gender_factor[9:15]         # get slice of elements
gender_factor[c(3,5,9)]     # get a selection of specific elements
gender_factor[gender_factor == 'male']   # get all values where the level equals

 # Factor Summary Functions
summary(gender_factor)      # returns count of each level
str(gender_factor)          # shows the factor's structure
length(gender_factor)       # get the length of the factor
table(gender_factor)        # creates data table of counts
