# plot2.R  6/18/2016  Charles Wylie
# Coursera Exploratory Data Analysis: Course Project 1
# https://github.com/cwylie3737/Coursera-Exploratory-Data-Analysis-Project-1

# Set working directory and clean up work environment:
setwd("C:/Users/Chuck/Documents/R/coursera/Module 4 - Exploratory Data Analysis/Week 1")
rm(list=ls())

# Download and unzip the raw data files if they do not exist in working directory:
if (!file.exists("household_power_consumption.txt")) {
    download.file(
        "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
        method='curl',
        destfile="exdata_data_household_power_consumption.zip"
    )
    unzip("exdata_data_household_power_consumption.zip")
}

# Read data file, extract two days data, extract field "Global_active_power", convert dates from char
HPC <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")
HPC <- HPC[HPC$Date %in% c("1/2/2007","2/2/2007") ,]
DT <- strptime(paste(HPC$Date, HPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
# Extract the three Submetering fields
subMetering1 <- HPC$Sub_metering_1
subMetering2 <- HPC$Sub_metering_2
subMetering3 <- HPC$Sub_metering_3

# Open png plot device, plot the graph, close the plot device
png("plot3.png", width=480, height=480)
plot(DT, subMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(DT, subMetering2, type="l", col="red")
lines(DT, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
