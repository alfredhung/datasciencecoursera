## This code examines how household energy usage varies over a 2-day period 
## in February, 2007. It reconstructs plot #4 shown at 
## https://github.com/alfredohung/ExData_Plotting1 using the base plotting system.

## Loads required package
library(datasets)

## Reads the data from the file
data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", colClasses = c("character","character",rep("numeric",7)))

## Selects the days that are 2007-02-01 and 2007-02-02
dateselected<-data[which(data[,1] == "1/2/2007" | data[,1] == "2/2/2007"),]

## Joins each of 2880 observations' time with its date
datetime <- paste(dateselected[,1], dateselected[,2])

## Converts date and time from character to a POSIX Date format
POSIXdatetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

## Extracts the day of the week each date belongs to
weekday <- weekdays(POSIXdatetime, abbreviate=T)

## Puts Thursday before Friday as factors
weekday <- factor(weekday, levels = c("Thu","Fri"))

## Adds 2 additional columns to the data set. Use 'x' variable for easier manipulation of code
x <- HPCdata <- cbind(POSIXdatetime, weekday, dateselected)

## PLOT 4
## Open PNG device; create 480x480 pixel file in working directory
png("plot4.png")

## Defines positioning of graphs, and margins for graph and text
par(mfcol = c(2,2), mar = c(5,5,1,1), oma = c(1,1,0,0))

## Plots 4 graphs
with(x, {
    ## Plot for position (1,1) Global Active Power vs. Thu, Fri
    plot(x[,1], x[,5], type = "l", xlab = "", ylab = "Global Active Power")
    
    ## Plot for position (2,1) Energy sub metering vs. Thu, Fri
    plot(x[,1], x[,9], type = "n", col = "black", axes = T, xlab = "", ylab = "Energy sub metering")
    with(x, lines(x[,1], x[,9], type = "l", col = "black"))
    with(x, lines(x[,1], x[,10], type = "l", col = "red"))
    with(x, lines(x[,1], x[,11], type = "l", col = "blue"))
    legend("topright", lty = 1,bty = "n", text.font = 6, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    ## Plot for position (1,2) Voltage vs. datetime
    plot(x[,1], x[,7], type = "l", col = "black", xlab = "datetime", ylab = "Voltage")
    
    ## Plot for position (2,2) Global Active Power vs. datetime
    plot(x[,1], x[,6], type = "l", col = "black", xlab = "datetime", ylab = "Global_reactive_power")
})

## Close the PNG file device
dev.off()
