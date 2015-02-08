plot3 <- function() {
    ## Read desirable data from file.
    ## Assume that we already have it downloaded and unzipped.
    data <- read.table("C:\\Coursera\\R\\household_power_consumption.txt",   
                       sep = ";", na.strings = "?", skip = 66637, nrows = 2880)
    
    ## Set meaningful names to work with.
    colnames(data) <- c("Date","Time","Global_active_power",
                        "Global_reactive_power","Voltage",
                        "Global_intensity","Sub_metering_1",
                        "Sub_metering_2","Sub_metering_3")
    
    ## Create intermediate variable corresponding to x-axis.
    Time <- as.POSIXlt(paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time, sep=" "))
    
    ## Handle issue with non-latin symbols.
    Sys.setlocale("LC_TIME","English")
    
    ## Create png file.
    png(filename = "plot3.png", height = 480, width = 480, bg = NA)
    
    plot(Time, data$Sub_metering_1, col = "black", type="l", 
         xlab="", ylab="Energy sub metering")
    lines(Time, data$Sub_metering_2, col = "red", type = "l")
    lines(Time, data$Sub_metering_3, col = "blue", type = "l")
    legend("topright", col = c("black", "red", "blue"), 
           lty = c("solid", "solid", "solid"), 
           legend = names(data[,c(7,8,9)]))
    
    dev.off()
}