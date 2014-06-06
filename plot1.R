# Data downloaded from 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# 6/4/14  @ 1:15PM

# Measurements of electric power consumption in
# one household with a one-minute sampling rate over a period of almost
# 4 years. Different electrical quantities and some sub-metering values
# are available.


# The following descriptions of the 9 variables in the dataset are taken
# from
# the web site:
     
# Date</b>: Date in format dd/mm/yyyy </li>
# Time</b>: time in format hh:mm:ss </li>
# Global_active_power</b>: household global minute-averaged active power (in kilowatt) 
# Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt)
# Voltage</b>: minute-averaged voltage (in volt)
# Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
# Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). 
# Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
#
setwd("~/Documents/datasciencecoursera/ExData_Plotting1")
rawData <- read.table("./household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
names(rawData) <- c("Date", "Time", "ActivePower", "ReactivePower", "Voltage", "GlobalIntensity", "Submetering1", "Submetering2", "Submetering3")
#
# Subset just the two days Feb1 and 2 2007
feb1Data <- rawData[rawData$Date == "1/2/2007",]
feb2Data <- rawData[rawData$Date == "2/2/2007",]
smallData <- rbind(feb1Data, feb2Data)
#
# Reformat the date and time into a single DateTime date object
x <- paste(smallData$Date, smallData$Time)
y <- strptime(x, "%d/%m/%Y %H:%M:%S")
dateData = cbind(y, smallData[,3:9])
names(dateData) <- c("DateTime", "ActivePower" ,    "ReactivePower"  , "Voltage"  ,       "GlobalIntensity", "Submetering1"  ,  "Submetering2"  ,  "Submetering3")
tidyData <- dateData
#
# Plot a histogram of Global Active Power and save to plot1.png
par(mar=c(5, 6, 4, 2))
hist(as.numeric(tidyData$ActivePower), main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red", cex.lab=3/4, cex.main=3/4, cex.axis=3/4)
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

