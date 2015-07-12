## plot1.R
##
## Task: Create a plot1.png file that resembles Plot 1 as described in Project 1.
##... The plot is written to the working directory. 
##

plot1 <- function(){
        ## Source utilities file
        source("ExData_Plotting1_Utilities.R")
        
        ## Get the plotting data by calling a function from the utilities file
        powerData <- getPlottingData()
        
        ## Plot the histogram to the screen device first
        png(filename = "plot1.png", width = 480, height = 480, units = "px")
        hist(powerData$Global_active_power, 
             xlab="Global Active Power (kilowatts)", 
             main="Global Active Power", col=2)
        
        ## Close the device to plot to a png file with the same name as this function.
        invisible(dev.off())
}