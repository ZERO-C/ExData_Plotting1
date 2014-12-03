###### EXPLORATORY DATA ANALYSIS #########
########## Peer Assessments 1 #############
########### Course Project 1 ##############

# Getting dataset
getwd()
setwd("C:/Users/Administrador/Documents/ex_data")
global_data <- read.csv("household_power_consumption.txt", header=T,sep=';', na.strings="?", nrow=2075259, check.names=F, stringsAsFactors=F,comment.char="", quote='\"')
global_data$Date <- as.Date(global_data$Date, format="%d/%m/%Y")

# Subsetting the data
working_data<-subset(global_data,subset=(Date>="2007-02-01" & Date <="2007-02-02"))
rm(global_data)

# Converting dates
datetime <- paste(as.Date(working_data$Date), working_data$Time)
working_data$datetime <- as.POSIXct(datetime)

# Plot 2 (Basics)

plot(working_data$Global_active_power ~ working_data$datetime,
type="l", 
ylab="Global Active Power (kilowatts)", 
xlab="")

# Saving png format 
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

