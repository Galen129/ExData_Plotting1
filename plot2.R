#---------------------------------------------------------------------------
# Galen129
# 12/09/15
# Exploratory Data Anlysis
# Course Project 1, Plot 2
# 
# Data download link
#    https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#    Extract the .txt file into your working directory
# 
# Dependencies (be sure the following package(s) are installed)
#    data.table
#---------------------------------------------------------------------------

rm(list=ls())
library(data.table)
PwrData = fread("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", data.table=FALSE)
PwrData$Time = strptime(paste(PwrData$Date,PwrData$Time), format="%d/%m/%Y %H:%M:%S")
PwrData$Date = as.Date(PwrData$Date, format="%d/%m/%Y")

index = PwrData$Date==as.Date("2007-02-01") | PwrData$Date==as.Date("2007-02-02")

png("plot2.png", width=480, height=480)
plot(PwrData$Time[index],PwrData$Global_active_power[index], type="l", 
     xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()