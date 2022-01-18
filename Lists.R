###################### Lists ############################################
# list in R are a type of data structurer that contain an ordered sequence of objects that can be of different types
# It can contain all sorts of objects such as numeric, logical and character vectors and even matrices or other lists

new_list <- list(c(1,2,3),
                 "R is Fun!!",
                 matrix(seq(1,6,1),2,3))
new_list

# you can also give names to the objects in the same list
new_list <- list(vector = c(1,2,3),
                 char_string = "R is Fun!!",
                 my_matrix = matrix(seq(1,6,1),2,3))
new_list

# you can use names() functon to access list's object names or assign new names
names(new_list)     #access names
names(new_list) <- c("obj1", "obj2", "obj3")    #assign new names
names(new_list)

######################## List indexing
new_list[1:2]      # take a slice of the first two objects
new_list[2]        # take a slice that contains only the second object
typeof(new_list[2])  # check the type of single object slice
 # single bracket gives the smaller lists even if the slices contain only one object

##### To access a specific member of a list directly, wrap the object's ondex in double square brackets
new_list[[2]]     #access the second list object
typeof(new_list[[2]])  #check object's type

### accessing list's objects using the assigned names
new_list[["obj3"]]  #or
new_list$obj3


#### after directly accessing a list object, you can perform indexing and other operations on the object as usual.
new_list$obj3[2,2]        #get obj3 from the list and then access ro2 and col2
new_list[["obj3"]][2,3]


##############  List summaries and alterations
length(new_list)    # return the length of a list
str(new_list)       # gives overview of list's structure
summary(new_list)   # get a summary of the list's contents

### adding new object to the list
new_list$obj4 <- c("Additional","string")
str(new_list)

new_list[[5]] <- c(T, F, T, F)     #object with no name
str(new_list)


####### combining two lists using c() function
second_list <- list(c(64, 25, 100), c("Rose", "Jasmine", "Lily"))  #new list created
second_list
combine_list <- c(new_list, second_list)
str(combine_list)

## you can remove list items by assigning them a value of NULL
combine_list[[7]] <- NULL       # remove object 7
combine_list$obj1 <- NULL       # remove object 1
str(combine_list)
