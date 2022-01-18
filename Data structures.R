######################## Variables ############################
 
 # A variable is a name that you assign to a value or object such as one of the atomic data types we learned
 # Variables are the convinient way of storing values with names that are meaningful

x <- 10
y <- "R is fun"
z <- (sqrt(144) == 12)

 # when assigning values it is a good practice to put a space between the variable name, the assignment operator and the variable value for clearity
p<-8       # looks messy
p <- 10    # looks neat

 # perform operations using variable names
x + p

 # It is generally considered a good practice to use "<-" sign instead of "=" sign for variable assignment in R
 # One reason for this is "=" sign is used in places other than variable assignment statements in R.
 # Functions often take named arguments and when calling a function you use the symbol "=" to assign values to the named arguments.

round(23.4567, digits = 2)

digits  # variable digits in not created in the above function

round(23.4567, digits <- 2)
 
digits  # "<-" always makes a variable assignment

 #### assign function:

assign("cats", 2)   # first argument use the variable name and the second argument is the value to be assigned to the variable
assign("dogs", 5)

cats; dogs


######################## Vectors ############################

 # R's most basic data structure is the vector
 # Vector is a sequense of data elements of same atomic type.
 # To create and store a vector with specific values, use the c() function and assign the result to a variable.

x <- c(1,2,3,4)     # numeric vector
x

y <- c("R", "Is", "Fun!")  # character vector
y
 
 # One can also combine two different vectors using c() function.
 # R will autoatically convert the vectors into the type that fits best
z <- c(x, y)
z                  # the first three numeric values have been converted to characters


 #### vector indexing

 #When you create a vector, each element in the vector is assigned an index based on its position in the vector.
 #The first element is at index position 1, the second element is at index position 2 and so on.
 #When you print a vector to the screen, each line starts with a number in square brackets followed by vector values. 
 #The number in square brackets indicates the index of the next value listed on that line. 

random_data <- runif(100)  # creates a vector of random numbers from uniform distribution between 0 and 1
print(random_data)

 #You can access a specific value in a vector by typing the name of the vector and then wrapping the index associated with the value you want to access in square brackets.
random_data[7]

random_data[110]            # accessing data that does'nt exists would return "NA"

subset1 <- random_data[7:14]         # Getting values from index 7 to 14 
subset1                              # stored as another vector

subset2 <- random_data[c(1,10,100)]  # Accessing specific subset of values by wrapping a vector in the square brackets
subset2

 # to calculate length of a vector

length(10)                 # a singular value is a vector of length 1
length(random_data)

y <- c("R", "Is", "Fun!")
z <- y[-2]                 # adding a minus sign to a given index excludes the value at that index
z


random_data1 <- runif(50)
random_data1subset <- random_data1[-(2:49)]  # excluding a range of values
random_data1subset

  ## vector indexing using logicals

  # If we pass a logical statement for the vector then it would grab only those values which are TRUE and exclude values when FALSE

# create a logical vector identifying values over 0.5 in data
data <- rnorm(50)
logical_subset <- (data > 0.5)
logical_subset
length(logical_subset)

# use the logical vector to create a subset of values that are over 0.5
over_half <- data[logical_subset]
over_half

###
print(data[data > 0.5])

 # %in% operator
### one can also use %in% operator to filter a vector
my_letters <- c("a","b","c","d","a","a","g","h")
my_letters_sub <- my_letters[my_letters %in% c("a","c")]
my_letters_sub

 ################## Vectorised Operations ###############################
example_vector <- c(1,2,3)

example_vector + 10  #adds to every element of the vector
example_vector - 10  # deducts from every element of the vector

  ## also the remaining operators *, /, ^ and modulus(%%) also works

example_vector2 <- c(1.6,2.5,3.5)
round(example_vector2)
floor(example_vector2)

#vector addition
vector1 <- c(1,2,3,4)
vector2 <- c(10,20,30,40)

vector1 + vector2
vector1 * vector2
vector1 %*% vector2  # inner product

# vector operations also work on character vectors if we use paste() function
a <- c("R", "Is", "Fun!")
b <- c("Kaggle", "Is","Fun!")
paste(a,b)

#data type conversion functions also work on vectors
vec <- c("1","2","3")
typeof(vec)
vec2 <- as.numeric(vec)
vec2
typeof(vec2)

### Generating vectors (other ways )
x <- 1:20   #colon function
x 
y <- seq(from = 1, to = 20, by = 2)   # seq function
y
z <- rep(1, times = 10)     # replicate function
z

#runif function to draw values from specified range
d <- runif(n = 5, min = 0, max = 100)
d
