# read data and subsetting to 2 days in February 2007

library(lubridate)

data <- read.table("household_power_consumption.txt", header = TRUE, sep=";",  na.strings = "?")
data$Date <- dmy(data$Date)
data<-data[data$Date == ymd("2007-02-01") | data$Date == ymd("2007-02-02"),]

png("plot1.png")

hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()
