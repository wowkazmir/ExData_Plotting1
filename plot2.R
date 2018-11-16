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

datetime <- paste(as.Date(subsetdata$Date, "%d/%m/%Y"), subsetdata$Time, "%H:%M:%S")

# Had to look up this function, "POSIXlt" and "POSIXct" are used to convert Date-Time

subsetdata$datetime <- as.POSIXct(datetime)

## Saves the plot to a png file

png('plot2.png', width = 480, height = 480)

## Make the second plot

plot(subsetdata$Global_active_power ~ subsetdata$datetime, type = "l", xlab="", ylab = "Global Active Power (kilowatts)")

dev.off()



    