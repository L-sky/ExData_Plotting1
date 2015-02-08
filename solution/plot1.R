plot1 <- function() {
    ## Read desirable data from file.
    ## Assume that we already have it downloaded and unzipped. 
    data <- read.table("C:\\Coursera\\R\\household_power_consumption.txt",   
                       sep = ";", na.strings = "?", skip = 66637, nrows = 2880)
    
    ## Set meaningful names to work with.
    colnames(data) <- c("Date","Time","Global_active_power",
                  "Global_reactive_power","Voltage",
                  "Global_intensity","Sub_metering_1",
                  "Sub_metering_2","Sub_metering_3")
    
    ## Create png file.
    png(filename = "plot1.png", height = 480, width = 480, bg = NA)
    
    hist(data$Global_active_power, col="red", main = "Global Active Power",
         xlab = "Global Active Power (kilowatts)")
    
    dev.off()
}