## plot2.R
##
## Task: Create a plot2.png file that resembles Plot 2 as described in Project 1.
##... The plot is written to the working directory. 
##

plot2 <- function(){
        ## Source utilities file
        source("ExData_Plotting1_Utilities.R")
        
        ## Get the plotting data by calling a function from the utilities file
        powerData <- getPlottingData()
        
        ## Plot the histogram to the screen device first
        png(filename = "plot2.png", width = 480, height = 480, units = "px")
        plot(powerData$DateTime, powerData$Global_active_power, type="l", 
             xlab="", ylab="Global Active Power (kilowatts)")
        

        ## Close the device to plot to a png file with the same name as this function.
        invisible(dev.off())
}