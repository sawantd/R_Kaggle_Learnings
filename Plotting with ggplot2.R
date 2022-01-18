#### refer link in description of youtube video ------- g- sheet for ggplot with parameters details

#### ggplot2 Basics and qplot() ####
library(ggplot2)

 ### qplot()
  ## basic quick plot ( i.e qplot) using ggplot2 library
  ## it us similar to plot() function in base R

qplot(x = carat,                           # x variable
      y = price,                           # y variable
      data = diamonds,                     # Dataset
      geom = "point",                      # Plot type
      color = clarity,                     # color points based on clarity
      xlab = "Carat Weight",               # x label
      ylab = "Price",                      # y label
      main = "Diamond Carat v/s Price")    # Title


 ##### Using ggplot()
 ## It creates plots incrementally in layers
 ## every ggplot starts with the same basic syntax
 ## every ggplot starts with a call to the ggplot() along with an argument specifying the dataset to be used 
 ## and aesthetic mappings from variables in the dataset to visual properties of the plot
 ## such as, x and y position

ggplot(data = diamonds,               # call to ggplot() and dataset
       aes(x = carat, y = price))     # aesthetics to assign

##########################################################################
ggplot(data = diamonds, aes(x=carat, y=price)) +     # Initialize plot*
       geom_point()                     # Add a layer of points ( make scatterplot)

#########################################################################
ggplot(data = diamonds, aes(x=carat, y=price)) +    # Initialize plot
       geom_point(aes(color = clarity))              # add color based on clarity

#########################################################################
ggplot(data = diamonds, aes(x=carat, y=price)) +    # Initialize plot
  geom_point(aes(color = clarity), alpha = 0.1)     # adds 90% transparency




########################################################################
 ##### Create a histogram of carat #####
  ## histogram is a univariate plot

ggplot(data = diamonds, aes(x = carat)) +          # Initialize plot
      
       geom_histogram(fill = "skyblue",            # create histgram with blue bars
                      col = "black",               # set bar outline with black
                      binwidth = 0.05) +           # set bin width
        
       xlim(0,3)                                   # add x-axis limit

#######################################################################
 ##### create a boxplot of carat split on clarity with points added ###

ggplot(data = diamonds, aes(x=clarity, y=carat)) +  # Initialize plot
       
       geom_jitter(alpha = 0.05,                    # Add jittered data
                   col = "yellow") +                # set data point color
       
       geom_boxplot(outlier.shape = 1,              # create boxplot and set outlier shape
                    alpha = 0)                      # make inner boxplot transparent

#######################################################################
 ##### create a grouped barplot #######

ggplot(data = diamonds, aes(x=clarity)) +           # Initialize plot
       
       geom_bar(aes(fill = color),                  # create bar plot, fill based on diamond color
                color = "black",                    # set bar outline color
                position = "dodge") +               # place bars side by side

       scale_fill_manual(values = c("skyblue", "pink", "blue", "green", "yellow", "orange", "red"))   # use colors


#######################################################################
 ##### create a density plot carat weight #####
 
ggplot(data = diamonds, aes(x=carat)) +           # Initialize plot
      xlim(0,2.5) +                                 # Limit x-axis

      geom_density(position = "stack",               # create a stacked density chart
                   aes(fill=cut),                   # fill based on diamond cut
                   alpha = 0.5)                     # set transparency

########################################################################
 ###### create a line plot #########

years <- seq(1950, 2015, 1)                      # create dummy data
readings <- (years-1990) + runif(66,0,20)
data <- data.frame(years, readings)

ggplot(data = data, aes(x=years, y=readings)) +    # initialize plot
       
       geom_line(color="red",                          # draw a line plot
                 size = 1) +
       
       geom_point(shape=10,                            # Display the points
                 size = 2.5) +
      
      geom_smooth(method = lm) +             # add a linear best fit line
  
      xlab("Year") + ylab("Readings") +      # changing labels
      
      ggtitle( "Example Time Series PLot")   # add a title


################################################################################

######## Multidimensional Plotting and Faceting #########
  #### visually illustrate the realtionships between 3 or more variables
  #### create multiple plots based on one of your variables

ggplot(data = diamonds, aes(x=carat, y=price)) +   # Initialize plot
       
      geom_point(aes(color = color),               # color based on diamond color
                 alpha = 0.5) +
      
      facet_wrap(~clarity) +                       # Facet on clarity
 
      geom_smooth() +                              # add an estimated fit line
  
      theme(legend.position = c(0.85, 0.16))       # set legend position















