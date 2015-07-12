## plot4.R
##
## Task: Create a plot4.png file that resembles Plot 4 as described in Project 1.
##... The plot is written to the working directory. 
##

plot4 <- function(){
        ## Source utilities file
        source("ExData_Plotting1_Utilities.R")
        
        ## Get the plotting data by calling a function from the utilities file
        powerData <- getPlottingData()
        
        ## Create a png file with 4 line plots in 2 rows and 2 columns
        png(filename = "plot4.png", width = 480, height = 480, units = "px")
        par(mfcol = c(2,2))
        with(powerData, {
                ## Global Active Power
                plot(powerData$DateTime, powerData$Global_active_power, type="l", 
                     xlab="", ylab="Global Active Power (kilowatts)")

                ## Sub Metering
                plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering",
                     width = 480, height = 480, units = "px")
                lines(DateTime, Sub_metering_1, type="l", col=1)
                lines(DateTime, Sub_metering_2, type="l", col=2)
                lines(DateTime, Sub_metering_3, type="l", col=4)
                legend("topright", col = c("black", "red", "blue"), 
                       legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"),
                       lty=c(1,1,1))
                
                ## Voltage
                plot(powerData$DateTime, powerData$Voltage, type="l", 
                     xlab="Date Time", ylab="Voltage")
                
                ## Global Reactive Power
                plot(powerData$DateTime, powerData$Global_reactive_power, type="l", 
                     xlab="Date Time", ylab="Global Reactive Power")
        }) 
        
        ## Close the device to plot to a png file with the same name as this function.
        invisible(dev.off())
}