 library(ggplot2)
 
 diamonds
 str(diamonds)
 
 ######## Histogram ###########
 ## a histogram is a univariate plot ( a plot that displays one variable)
 ## that groups a numeric variable into bins and displays the number of observations that fall within each bin
 
 hist(diamonds$carat)

 ## 
 hist(diamonds$carat,
      breaks = 50,         # group into 50 bins
      xlim = c(0, 3.5))    # limit x-axis to the range 0-3.5

## limiting the x - axis to 3.5 might have cut some outliers with count so small that they did'nt show up 
 # as bars on our original chart
 # lets check to see if diamonds are larger than 3.5 carats
 
 subset(diamonds, carat > 3.5)

 
 
 ########### Boxplots ####################### 
 #Boxplots are another type of univariate plot for summarizing distributions of numeric data graphically
 
 boxplot(diamonds$carat)
 
 
 ### Make the boxplot of one variable(dependent) based on another variable
 boxplot(diamonds$price ~ diamonds$clarity)     # plot price split on clarity
 # output conveys that low clarity diamonds have higher prices
 
 # compare with other variable/factor
 boxplot(diamonds$carat ~ diamonds$clarity)     # plot carat split on clarity
 # output shows that the prices are high based on carat no matter the clarity of diamonds

  
 ############### Density Plots ###########################
  # a density plot shows the distribution of a numeric variable with a continuous curve
  # it is similar to histogram but without discrete bins
  # it gives better picture of the underlying shape of the distribution
 
 plot(density(diamonds$carat))
 
 
 
################### Barplots #########################
  # barplots are graphs that visually display counts of categorical variable
  # create a barplot by making a table of categorical variable and passing it to the barplot() function
 barplot(table(diamonds$clarity))

 
################## Scatterplots ######################
  # Scatterplots are bivariate ( two variables) plots
  # plots data on x/y plane
 
 plot(diamonds$carat,
      diamonds$price)       # scatterplot of carat and price

 # recreate the plot above, but use the col option with rgb() to set alpha
 plot(diamonds$carat,
      diamonds$price,
      col = rgb(red = 0, green = 0, blue = 0, alpha = 0.1))

 
 ########## Line plots ###############
  # Line plots are charts used to show the change in a numeric variable based on some other ordered variable
  # Line plots are often used to plot time series data to show the evolution of a variable over time
 
 years <- seq(1950, 2015, 1)      # create some dummy data
readings <- (years-1900)  + (runif(66,0,20))

plot(years, readings, type = "l") 


############ Plot parameters #############

 # remake the grouped barplot
barplot(table(diamonds$color, diamonds$clarity),
        legend = levels(diamonds$color),
        beside = T,
        xlab = "Diamond Clarity",
        ylab = "Diamond Counts",
        main = " Diamond Clarity, Grouped by Color",
        col = c("red", "green", "yellow", "blue", "magenta", "pink", "brown") )


 # remake the line plot
plot(years,
     readings,
     type = "l",
     col = "blue",      # color the line blue
     lwd = 2,           # increase the line width      
     main = "Example Time Series Plot")   # add plot title

points(x = years, y = readings,     # draw points at specifies coordinates
       pch = 10)                    # set point symbol

# arbitrary line
abline(a = mean(readings),        # draw a line with y -intercept a
       b = 0,                     # add a slope
       lwd = "3")                   # set line width

text(x = 2010, y = mean(readings)+2,   # add text at specified location
     labels = "Mean Reading")          # text to add

abline(lm(readings~ years),     # create a line based on a linear model
       col = "red",             # add color
       lty = "dashed",          # add line type
       lwd = 2)                 # line width
