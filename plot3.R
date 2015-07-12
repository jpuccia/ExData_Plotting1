## plot3.R
##
## Task: Create a plot3.png file that resembles Plot 3 as described in Project 1.
##... The plot is written to the working directory. 
##

plot3 <- function(){
        ## Source utilities file
        source("ExData_Plotting1_Utilities.R")
        
        ## Get the plotting data by calling a function from the utilities file
        powerData <- getPlottingData()
        
        ## Create a line plot for the three sets of sub mettering data (1, 2 and 3)
        png(filename = "plot3.png", width = 480, height = 480, units = "px")
        with(powerData, {
                plot(DateTime, Sub_metering_1, type="n", 
                     xlab="", ylab="Energy sub metering",
                     width = 480, height = 480, units = "px")
                lines(DateTime, Sub_metering_1, type="l", col=1)
                lines(DateTime, Sub_metering_2, type="l", col=2)
                lines(DateTime, Sub_metering_3, type="l", col=4)
                legend("topright", col = c("black", "red", "blue"), 
                       legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"),
                       lty=c(1,1,1))
                
        }) 
        
        ## Close the device to plot to a png file with the same name as this function.
        invisible(dev.off())
}