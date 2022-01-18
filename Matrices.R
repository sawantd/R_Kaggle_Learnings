###################### Matrices #####################################

# A matrix is a two dimentional data structure with rows and columns that contais atomic elements of same type
# To construct a matrix you can use matrix() function which takes several arguements

x <- matrix(data = c(1,2,3,4,5,6),
            nrow = 2,
            ncol = 3,
            byrow = F)
x

# add values to the existing matrix
x  <- rbind(x, c(7,8,9))   #adding new row
x

# create a new matrix 
y <- matrix( seq(10, 15, 1), 3, 2)
y

# add the newly created matrix to the existing one
x <- cbind(x,y)
x

#using rbind() to create a matrix
z <- rbind(c(1,2,3), c(4,5,6), c(7,8,9))   # similarly yu can use cbind()
z

# One can turn matrix's rows to columns by using transpose function
k <- t(z)
print(k)

# can also convert a existing matrix into a vector by using as.vector() or c() function
as.vector(x)        # creates vector by taking values by column
c(x)

c(t(x))             # creates vector by taking values by rows

# Matrix Indexing
  # since the matrix are two dimensional, we need to provide 2 different index positions (row and column)
x
x[3,2]       # get value at 3rd row and 2nd column
x[2,]        # get row 2
x[,4]        # get column 4

 # one can also take slices of rows and columns from the matrix
print(x[2:3,4:5])             # selecting range of rows and columns
print(x[c(1,3), c(1,3,5)])    # selecting specific rows and columns
print(x[-2, -2])              # remove row 2 and column 2

 # create a logical matrix
logical_X <- (x %% 2 == 0)    # fetches even numbers
logical_X                    
print(x[logical_X])           # subsetting using logical matrix  # yeilds all the even values as a vector

x[x %in% c(2,3,10,11,15,100)] # using %in% operator

### naming rows and columns
z <- matrix(c(1,2,3,4), 2, 2, dimnames = list(c("r1", "r2"), c("c1","c2")))
z
 # can also use dimnames() function for giving names to rows and columns after creating the matrix
dimnames(z) <- list(c("first_r","second_r"), c("first_c","second_c"))   
z
 # can also use dimnames for subsetting
z["second_r","second_c"]

########### Matrix Operations
 # create two identical matrixes
X <- Y <- matrix(c(1,2,-1,1,1,2,1,2,3), 3, 3)
print(X); print(Y)

dim(X)             # gives dimensions(number of rows and cols)

 # Elemet wise addition
print(X + Y)
 # Element wise multiplication
print(X * Y)
 # True matrix mltiplication ( dot product)
print(X %*% Y)
 

diag(X)   # diagonal elements
sum(X)    # sum of all the elements in X matrix
max(X)    # maximum value in X
min(X)    # minimum value in X
mean(X)   # mean of all values
rowSums(X) # get the sum of the rows
colSums(X) # get the sum of cols
rowMeans(X) # get the means of the rows
colMeans(X) # get the means of the cols

########### R also contains an array data structure that stores elements of the same atomic type n an arbitrary number of dimensions
 A <- array(1:8, dim = c(2,2,2))     # creates a 2x2X2 array
 A
dim(A) 
 # an array is just a vector stored with an extra attribute "dim" that specifies its dimensions
 # in other words, array lets you store data in 3 or more dimensions