## This code examines how household energy usage varies over a 2-day period 
## in February, 2007. It reconstructs plot #1 shown at 
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

## PLOT 1
## Open PNG device; create 480x480 pixel file in working directory
png("plot1.png")

## Defines margins for graph and text
par(mar = c(4, 4, 2, 1), oma = c(2, 2, 2, 0))

## Plots a histogram for the frequency of GAP(kw)
hist(x[,5], col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## Close the PNG file device
dev.off()