### Importing Data ###
dates <- read.csv("../Data/dates_lesson_16.csv", 
                  stringsAsFactors = FALSE)
dates

dates[[1]]
typeof(dates[[1]])

 ### convert from character format to date format
first_col <- as.Date(dates$month_day_year,        # character vector to convert
                     format = "%m/%d/%y")         # Format of the dates to convert
first_col                # check the new dates
typeof(first_col)        # check type
class(first_col)         # check class


### list of formatting strings
 #  %d -> Day
 #  %m -> numeric month
 #  %b -> abbreviated month
 #  %B -> Full month
 #  %y -> 2-Digit year
 #  %Y -> 4-Digit year

## the dates are internally stored as numbers. 
## R internaly stores dates as the number of days since the first day of 1970
## you can check the underlying numeric representation of a date with as.numeric()

as.numeric(first_col)


### Some other useful date and time relation functions in base R
weekdays(first_col)
months(first_col)
Sys.Date()
date()

#### Date-Time conversions
 ## R contains a couple of data classes.
 ## 'POSIXct' and 'POSIXlt' to deal with date/time data
 ## POSIXct encodes a date/time as the numbers of seconds since the first day of 1970
 ## POSIXlt stores date/time information as a list with items like year, month, day, hour, minute an second

third_col_ct <- as.POSIXct(dates$date_time,
                           format = "%a %b %d %H:%M:%S %Y")
third_col_ct
typeof(third_col_ct)


third_col_lt <- as.POSIXlt(dates$date_time,
                           format = "%a %b %d %H:%M:%S %Y")
third_col_lt
typeof(third_col_lt)


#### both the POSIXct and POSIXlt support subtraction t get the amount of time between two dates in days
third_col_ct[2] - third_col_ct[1]


## you can extract various features of a date/time encodes as POSIXlt
third_col_lt$year    # year
third_col_lt$mon     # numeric month
third_col_lt$wday    # day of the week
third_col_lt$mday    # day of the month
third_col_lt$yday    # day of the year
third_col_lt$hour    # hours
third_col_lt$min     # minutes
third_col_lt$sec     # seconds


####### LUBRIDATE ##########
 ## It is a package in R specifically build in for dealing with date/time data
 ## It contains a variety of functions that operate on dates stored in the POSIXct and POSIXlt formats
library(lubridate)

 # remind ourselves of the format of each column
head(dates, 1)

 #### Convert each column with the appropriate lubridate parsing function
col1_dates <- mdy(dates[,1])
col1_dates

col2_dates <- dmy(dates[,2])
col2_dates

## the date_time column is pretty messy so it can't be parsed with a pre-made lubridate function
# So in this case use lubridate's parse_date_time() function with the full date format
col3_dates <- parse_date_time(dates[,3],
                              orders = "%a %b %d %H:%M:%S %Y")
col3_dates

col4_dates <- ymd(dates[,4]) 
col4_dates


###############################################################################################
# Once the data is loaded in a date format that lubridate understands,
# It has a variety of functions that can extract useful information from the dates

am(col3_dates)     # check if date/time occured in am(TRUE) or pm(FALSE)

decimal_date(col3_dates)   # the decimal version of the date/time

leap_year(col3_dates)      # is it a leap year?

round_date(col3_dates, 
           unit = c('year'))  # round date/time based on specified unit

ceiling_date(col3_dates,
             unit = c("year")) # round date/time up based on specified unit

hour(col3_dates)     # get hours
minute(col3_dates)
second(col3_dates)
month(col3_dates)
year(col3_dates)
mday(col3_dates)
wday(col3_dates)
yday(col3_dates)
now()         # get the current date/time

 ### Lubridate also contains some more advanced functions ----- explore !!!!
