
## Getting dataset
getwd()
setwd("C:/Users/Carla/Documents/ExData_Plotting1/")
data_total <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_total$Date <- as.Date(data_total$Date, format="%d/%m/%Y")
## Subsetting the data
data <- subset(data_total, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_total)
## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
## Plot 1
hist(data$Global_active_power, 
main="Global Active Power",
xlab="Global Active Power (kilowatts)", 
ylab="Frequency", 
col="Red")
## Saving png format (view project instructions)
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
