library(readr)
library(dplyr)


## Read the data from the file and subsets the two dates desired

data <- read_delim("household_power_consumption.txt", delim = ";",
                   col_names = c("Date",
                                 "Time",
                                 "Global_active_power",
                                 "Global_reactive_power",
                                 "Voltage",
                                 "Global_intensity",
                                 "Sub_metering_1",
                                 "Sub_metering_2",
                                 "Sub_metering_3"))

subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

glimpse(subsetdata)

## Saves the plot to a png file

png('plot1.png', width = 480, height = 480)

## Make the first plot

globalactivepower <- as.numeric(subsetdata$Global_active_power)
hist(globalactivepower, xlab="Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

dev.off()
