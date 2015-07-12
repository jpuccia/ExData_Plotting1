## ExData_Plotting1_Utilities.R
##
## Task: Read the specific rows of data from the household_power_consumption.txt
##... file for Project 1 of the Exploratory Data Analysis class.  This function
##... assumes that the data file has already been downloaded into the working
##... directory for the project.
##
## Returns: A data.frame of records from the household_power_consumption.txt
##... file for the date range of Feb 1 - Feb 2, 2007.
##

getPlottingData <- function(){
        ## The data we are interested in starts on line 66638 so we can skip 
        ##... every row before that.
        skipCount <- 66637
        
        ## The sample rate for the data is every 1 sec.  We want data for a
        ##... 48 hour period so we want (48 * 60) 2,880 records
        recCount <- 2880
        
        ## Pull only the data we need from this file (Feb 1 - Feb 2, 2007)
        powerData <- read.table("household_power_consumption.txt",skip=skipCount 
                                ,nrows=recCount, sep=";", na.strings = "?" )
        
        ## Since we're skipping rows we need to get the title separately
        header <- read.table("household_power_consumption.txt", nrows = 1, 
                             header = FALSE, sep =";", stringsAsFactors = FALSE)
        
        ## Add the column names to the data
        colnames( powerData ) <- unlist(header)
        
        ## Convert string Date and Time columns to a single Date/Time column
        dates <- as.vector(powerData[,"Date"])
        times <- as.vector(powerData[,"Time"])
        dateandtimes <- paste(dates, times)
        vDateTime <- strptime(dateandtimes, "%d/%m/%Y %H:%M:%S")
        powerData$DateTime <- vDateTime
        powerData$Date <- NULL
        powerData$Time <- NULL
        
        ## Return data to caller
        powerData
}