### Getting the working directory
getwd()

### setting a new working directory
setwd("C:/Users/Darshana/Desktop/Darshana/Kaggle learning/Data")

getwd()     # checking the new directory set

### You can also use file.path() function. It takes a comma separated seq of character strings and then uses them
 ## to construct a file path string for you
my_path <- file.path("C:/Users", "Darshana", "Desktop", "Darshana", "Kaggle learning", "Data")    # construct path
setwd(my_path)                        # Set the working directory to the path
getwd()                               # Check the working directory

 # you can list the files and folders in the current working directory using the list.files() function
list.files("../Data")     # .. goes up a level in the working directory

list.files("../Data/titanic")

 ################################ Read CSV and TSV Files #####################################
 
 # load the titanic data
titanic <- read.csv("../Data/titanic/train.csv")
head(titanic)

 ## if the data were stored as tab separated values then we would have used the following code
 # titanic <- read.csv("../Data/titanic/train.csv", sep = "/t")


#####################################################################################################
## Reading Excel files ##
install.packages("readxl")
library(readxl)     #load the readxl package

draft <- read_excel("../Data/draft2015/Donors_motiv_factors.xlsx",              # file to read
                    1)                                                    # worksheet within the excel file to read
head(draft, 10)

######################################################################################################

### Reading Web Data ( code is not given - google the same)

## Writing Data to CSV ( similar to exporting data in CSV format)
draft <- read.csv("../Data/draft2015/draft2015saved.csv")          # CSV to R
head(draft, 10)

write.csv(draft,                     # name of variable assigned to the data
         "draft2015s.csv",            # name of file to create to store the data
          row.names = F )             # whether to include row names in the file
 # the file is outputted to the working directory

##### Other R Packages for Reading and Writing Data
 # functions other than base R functions - helps in loading big data file easier and faster
install.packages("readr")
library(readr)
titanic_fast <- read_csv("../Data/titanic/train.csv")
head(titanic_fast)

library(data.table)
titanic_super_fast <- fread("../Data/titanic/train.csv")
head(titanic_super_fast)

 ## readr and data.table each read data into their own uniques data structuresthat build upon R's base data frames
 ## We can confirm this by checking the class of each object we loaded with the class() function
class(titanic)
class(titanic_fast)
class(titanic_super_fast)


## convert the tbl_df and data.frame back to normal data frames
class(as.data.frame(titanic_fast))
class(as.data.frame(titanic_super_fast))

## Finally the data.table package has a function called fwrite() that can write data to disk much faster than 
 # the standard write.csv() fuction
fwrite(draft, "draft2015fast.csv")
