###### If, Else and Else If

 # If
x <- 10  # assign some variables
y <- 5

if ( x > y) {
   print(x)
  }

 # If Else
y <- 25

if ( x > y) {
  print(x)
} else {
  print(y)
}

 # Else If
y <- 10

if ( x > y ) {
  print(x)
} else if ( x == y) {
  print("x and y are equal")
} else {
  print(y)
}

########### For Loops #############
## goes through each item in a sequence and then perform some operation on each one
my_sequence <- seq(0, 100, 10)
my_sequence
for (item in my_sequence) {
  print(item)
}


####
for (item in my_sequence) {
  if (item < 50) {                   # this if statement skips items less than 50
    next
  }
  print(item)
}


####
for (item in my_sequence) {
  if (item > 50) {
    break                           # Break out of the entire loop if item exceeds 50
  }
  print(item)
}


######### While Loops ##########
## while loop will execute the operation until the condition is TRUE
x <- 5
iters <- 0
while ( iters < 5) {               # Execute the contents as long as iters < x
  print("Study")
  iters <- iters + 1               # Increment iters by 1 each time the loop executes
}

# As long as the condition is true while loop will keep on executing
while (TRUE) {                    # This logical statement is always true
  print("Study")
  break                           # but we immediately break out of the loop
}


############### ifelse() function ##################
## whenever you want to perform the same operation to each object in a vector or other R data structure, we can use this function
## the operation is performed to each element all at once instead of having to loop through each element one by one 

## for loop
a <- set.seed(12)        # intialize random number generator
a

my_vector <- runif(25, -1, 1)           # generate some random numbers between -1 and 1
my_vector

for (item in 1 : length(my_vector)) {    # loop through the sequence 1 : 25
  number <- my_vector[item]              # look up the next number through indexing
  if (number< 0) {                       # check if the number is less than 0
    my_vector[item] <- 0                 # if so, set it to 0
  }
}
print(my_vector)

## ifelse() function    ( can be used when the data is large to loop over)
set.seed(12)
my_vect <- runif(25, -1, 1)

my_vect <- ifelse((my_vect < 0),        # logical test
                  0,                    # value to set if the test is true
                  my_vect)              # value to set if the test is false
print(my_vect)
