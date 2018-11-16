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

png('plot3.png', width = 480, height = 480)

## Make the third plot

# Using "with" selects the data so I don't have to call it every time

with(subsetdata, {
    plot(Sub_metering_1 ~ datetime, type = "l", xlab="", ylab = "Energy sub metering")
    lines(Sub_metering_2 ~ datetime, type = "l", col = "red")
    lines(Sub_metering_3 ~ datetime, type = "l", col = "blue")
})
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col = c("black", "red", "blue"))

dev.off()


