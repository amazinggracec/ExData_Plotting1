# read data and subsetting to 2 days in February 2007

library(lubridate)
library(dplyr)

data <- read.table("household_power_consumption.txt", header = TRUE, sep=";",  na.strings = "?")
data$Date <- dmy(data$Date)
data<-data[data$Date == ymd("2007-02-01") | data$Date == ymd("2007-02-02"),]
data$dt <- paste(data$Date, data$Time) %>% ymd_hms()

png("plot2.png")

with(data, plot(dt, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off()
