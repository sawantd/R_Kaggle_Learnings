##### Importing an example data excel file #####
library(readxl)
timdata <- read_excel("../Data/Char_data_ex/timberwolves.xlsx",
                   1)
timdata

 ######### Basic Character Functions ###########
 # If you use length() function on character string then it will return the length of the vector instead of
 # the number of characters in the string
comments <- timdata[,"body"]        # fetching the third column
first_comment <- comments[1,]        # fetching the first comment
length(first_comment)               # gives length of character string vector

 # if you want to extract the number of characters in a single char string then 
 # use nchar() function
first_comment
nchar(first_comment)

 # Combine two or more character strings in R using the paste() function
paste(comments[7,], comments[8,], comments[9,], sep = "|----|")

 # if you use paste() function on character vectors longer than length one, 
 # it will combine each element of the vector in element wise fashion
install.packages("dplyr")    # %>% needs this package
library(dplyr)
paste(timdata$author, timdata$body, sep = "-- posted -:") %>% head(2)   


 # You can extract part of a character string using the substr() function
substr(first_comment, 100, 149)

 # you can convert all the letters to upcase or lowcase by using 
 # toupper() and tolower() functions
substr(first_comment, 100, 149) %>% toupper()       # %>% is a pipe operator that transfer output of one function to other
substr(first_comment, 100, 149) %>% tolower()


 # to split a character string into multiple parts, use the strsplit() function with the split argument
typeof(first_comment)
first_comment <- as.character(first_comment)
words <- strsplit(first_comment, split = " ")          # split on spaces
words


# Replacing part of a string with something else
new_string <- "I like Wiggins. Wiggins is the best"

sub(pattern = "Wiggins",                   # String to replace
    replacement = "Towns",                 # String to use as replacement
    x = new_string)                        # Character vector to search

# Now in the output, one must have noticed that only the first match has been replaced by the replacement string provided
# To replace all the matches present in the text, use gsub() function

gsub(pattern = "Wiggins",
     replacement = "Towns",
     x = new_string)                       


### A comman operation when working with text data is to test whether character strings contain a pattern of characters
## For instance, if we are only interested in posts about Andrew Wiggins,
## use the grep() function which gives indexes of elements in a character vector that match a given substring



char <- c("He Is very smart", "Outdoors are good", "Programming is fun!!!", "#Flower Bloomed#", "Babies are cute")
char
Char_index <- grep(pattern = "is|bloom",     # Substring or pattern to match
              x = tolower(char))             # vector to search
Char_index                                   # fetched indexes
char[Char_index]                             # fetched values
length(Char_index)/length(char)              # ratio of presence in the whole vector


############### R Regular Expressions #####################
 # A regular expression (regex) is a sequence of characters and special meta characters used to match strings.
 # "." - the period is a metacharacter that matches any character other than the newline
my_char <- c("bill","Till","still","pill","mill","gull")
grepl(pattern = ".ill",
      my_char)
 # NOTE : grepl() searches for matches just like grep() 
 # Put returns TRUE/FALSE values if matches 

# "[]" - Square brackets specify a set of characters to match
grepl(pattern = "[Tt]ill",                  # matches T or t followed by "ill"
      my_char)


# "^" - outside of a sequence, the caret symbol searches for matches at the beginning of a string
ex_str1 <- c("Where did he go?",
             "He went to the Cool store",
             "he is so cool")
# Matches He or he but only at the start of a string
grepl(pattern = "^(He|he)",
      ex_str1)

# "$" - searches for matches at the end of the string
grepl(pattern = "(Cool|cool)$",
      ex_str1)


######### #########;
ex_str2 <- c("abdominal","b","aa","abbcc","aba")
# Match 0 or more a's, a single b, then 1 or more characters
grepl(pattern = "a*b.+",
      ex_str2)

# "\\" - double backslashes let you escape metacharacters
ex_str4 <- c("Mr. Ed","Dr. Mario","Mrs Ganger.")
 # match a single period and then a space
grepl(pattern = "\\. ",
      ex_str4)

