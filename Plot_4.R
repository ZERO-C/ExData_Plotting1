###### EXPLORATORY DATA ANALYSIS #########
########## Peer Assessments 1 #############
########### Course Project 1 ##############

# Getting dataset
getwd()
setwd("C:/Users/Ronald/Documents/R/ExData_Plotting")
global_data <- read.csv("household_power_consumption.txt", header=T,sep=';', na.strings="?", nrow=2075259, check.names=F, stringsAsFactors=F,comment.char="", quote='\"')
global_data$Date <- as.Date(global_data$Date, format="%d/%m/%Y")

# Subsetting the data
working_data<-subset(global_data,subset=(Date>="2007-02-01" & Date <="2007-02-02"))
rm(global_data)

# Converting dates
datetime <- paste(as.Date(working_data$Date), working_data$Time)
working_data$datetime <- as.POSIXct(datetime)

setwd("C:/Users/Ronald/Documents/R/ExData_Plotting1/ExData_Plotting1")
# Plot 4 

#1 frame
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(working_data, {
plot(Global_active_power~datetime, type="l",
ylab="Global Active Power", xlab="")

#2 frame
plot(Voltage~datetime, type="l",
ylab="Voltage", xlab="datetime")

#3 frame
plot(Sub_metering_1~datetime, type="l",
ylab="Energy sub metering", xlab="")
lines(Sub_metering_2~datetime,col='Red')
lines(Sub_metering_3~datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4 frame
plot(Global_reactive_power~datetime, type="l",
ylab="Global_reactive_power",xlab="datetime")

})

# Saving png format 

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
