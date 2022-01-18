################## Creating Functions #######################

 # assign the function() to a name and declare arguments within ()
new_function <- function(arguments) {
  
  # write a function body within the {} to execute
  for ( x in 1 : arguments) {
    print("This is a Function!!!")
  }
}

# call the function
new_function(4)

##########################################################################3
 ## Functions in R return the last expression evaluated by default.
 ## For instance, if we add two numbers at the end of the function, it will return the result of that addition

add_10 <- function(number) {
  
  number + 10
}

add_10(5)

#### You can force an R function to return a specific value with return()
  ## using return() breaks out of the function, so that code that appers after a return() statement is not run

add_20 <- function(number) {
  
  return(number + 20)             # exit and return a specified value
  number + 10                     # the function exists before running this line
  
}

add_20(5)

########################### Passing multiple arguments ############################################

 sum_3_items <- function(x,y,z,                 # create a new function
                         print_args = TRUE) {   # one argument has a default
   
   if ( print_args ) {
     print(x)
     print(y)
     print(z)
   }
   return(x+y+z)
 }  

sum1 <- sum_3_items(1,2,3)             # here the arguments are printed
sum2 <- sum_3_items(10,20,30,
                    print_args = F)    # changing default suppress printing

########### using list when the number of arguments are unknown #######
addition_function <- function(...) {
  
  total <- 0
  
  for ( value in list(...)) {           # list(...) extracts the arguments to a list
    total <- total + value              # add each argument in ... to the total
  }
   total
}

addition_function(2,4,6,8,10,12,14)     # add several numbers

########################################################################

root_mean_squared_error <- function( predicted, targets) {
  
  # Computes root mean squared error between two vectors
  #
  # Arg:
  #     predicted: a numeric vector of predictions
  #     targets: a numeric vector of target values for each prediction
  #
  # Returns:
  #    The root mean squared error between predicted values abd targets
  
  sqrt(mean(targets - predicted) ^ 2)
  
}  

root_mean_squared_error(100,94)



