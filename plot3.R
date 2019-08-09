# read data and subsetting to 2 days in February 2007

library(lubridate)
library(dplyr)
library(tidyr)

data <- read.table("household_power_consumption.txt", header = TRUE, sep=";",  na.strings = "?")
data$Date <- dmy(data$Date)
data<-data[data$Date == ymd("2007-02-01") | data$Date == ymd("2007-02-02"),]
data$dt <- paste(data$Date, data$Time) %>% ymd_hms()
data <- gather(data, Sub_metering_1, Sub_metering_2, Sub_metering_3, 
                        key = "Sub_Meter", value = "Use")

png("plot3.png")
with(data, plot(dt, Use, type = "n", xlab = "", ylab = "Energy sub metering"))
with(subset(data, Sub_Meter == "Sub_metering_1"), lines(dt, Use, col = "black"))
with(subset(data, Sub_Meter == "Sub_metering_2"), lines(dt, Use, col = "red"))
with(subset(data, Sub_Meter == "Sub_metering_3"), lines(dt, Use, col = "blue"))
legend("topright", lwd = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
