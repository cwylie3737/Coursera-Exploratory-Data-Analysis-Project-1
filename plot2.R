# plot2.R  6/18/2016  Charles Wylie
# Coursera Exploratory Data Analysis: Course Project 1
# https://github.com/cwylie3737/Coursera-Exploratory-Data-Analysis-Project-1

# Set working directory and clean up work environment:
setwd("C:/Users/Chuck/Documents/R/coursera/Module 4 - Exploratory Data Analysis/Week 1")
rm(list=ls())

# Read data file, extract two days data, extract field "Global_active_power", convert the dates from char
HPC <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")
HPC <- HPC[HPC$Date %in% c("1/2/2007","2/2/2007") ,]
GAP <- HPC$Global_active_power
DT <- strptime(paste(HPC$Date, HPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Open png plot device, plot the graph, close the plot device
png("plot2.png", width=480, height=480)
plot(DT, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
