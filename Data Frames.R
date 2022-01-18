###################### Data Frames ###############################

# data structured in organised tables that have certain number of rows & columns
# row represents record and columns represent variables
# can hold different types of data

 # create vectors
a <- c(1:5)
b <- c("R", "is", "Fun", "Let's", "learn")
c <- c(T, F, T, F, T)

my_frame <- data.frame(a, b, c)   # create data frame
my_frame

 # giving names to columns
my_frame <- data.frame(numeric = a,
                       character = b,
                       logical = c)
my_frame

 # view and re-assign column names using colnames() function
colnames(my_frame)
colnames(my_frame) <- c("c1", "c2", "c3")
colnames(my_frame)

 # creating row names when creating a data frame
my_frame <- data.frame(numeric = a,
                       character = b,
                       logical = c,
                       row.names = c("r1", "r2", "r3", "r4", "r5"))
my_frame
 
# view and re-assign row names using rownames() function
rownames(my_frame)
rownames(my_frame) <- c(1:5)
rownames(my_frame)

############## Loading the existing dataset/data frame in R
cars <- mtcars
cars

##### Summarizing data frames
 ## Structure of the data
str(cars)   # shows no. of rows and columns. Also briefs the columns

 ## Summary of the data
summary(cars)  # displays the basic statistics for numeric variables

 ## using head() & tail() function for viewing few initial and last records if the data frame is very large
head(cars, 5)
tail(cars, 5)

 ## Data frames also support few other basic summary operations
dim(cars)        # gives dimension of the data frame
nrow(cars)       # gives no. of rows
ncol(cars)       # gives no. of columns


################## Data Frame Indexing
  # data frames are lists under the hood, where each list object is a column, they support the indexing operations that apply to lists.
mtcars

head(mtcars[6])       # single braket takescolumn slices
typeof(mtcars[6])     # returns a new dataframe (i.e list)

head(mtcars[[6]])     # gets the actual object at the index
typeof(mtcars[[6]])

head(mtcars[["wt"]])  # using colname getting the actual object at the index  #or
head(mtcars$wt)       # using the $ notation

 # Getting specific values using row and column numbers
mtcars[2,6]
mtcars[2,]
mtcars[,6]

 # by using names
mtcars["Mazda RX4",]
mtcars[,"mpg"]

 # logical indexing
cars1 <- mtcars
cars1[(cars1$mpg > 25),]   # get rows where mpg > 25

 # subset function
  # the subset function takes the dataframe as the first argument and then the logical statements as second
subset(cars1, (mpg > 20)  & (hp > 70))   

 # matrix functions cbing() & rbind() can be used to combine two data frames with same number of rows and columns

 # you can also delete columns in a data frame by assigning them a value NULL
cars1$vs <- NULL       #drops column "vs"
head(cars1)

 # you cannot drop rows by assigning them a value NULL due to the way data frames are stored as lists of columns
 # if you want to drop rows then you can use matrix style subsetting with -operator.
cars1 <- cars1[-c(1,3),]        # drops rows 1 and 3
head(cars1)

 # checking type of column "character" 
typeof(my_frame$character)     # yields integer 
typeof(my_frame$logical)

 # when we create a data frame, all character vectors are converted into a special data structure called "factor" by default
 # you can suppress this behaviour by including the following argument when creating a data frame
my_frame <- data.frame(numeric = a,
                       character = b,
                       logical = c,
                       stringsAsFactors = F)
typeof(my_frame$character)
