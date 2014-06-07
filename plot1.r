

setwd("C:/Coursera/ExploratoryAnalysis/data")
 # Coursera Data Exploratory Analysis Course Project 1
# Analysis on Individual household electric power consumption
# Load and filter household power consumption dataset
power_data <- function(filepath) {
     plot1 <- read.table(filepath, sep=";", header=TRUE, na.strings="?")
 
 # Creating  new "datetime" column with type POSIXlt
date_time <- strptime(paste(plot1$Date, plot1 $Time), "%d/%m/%Y %H:%M:%S")

    # Returning only the subset of dates as described in the assignment description
    plot_date <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))
   plot1[as.Date(date_time) %in% plot_date,]
 }
 
 # Creating Function to plot Red histogram for global active power with explicit 
 plot.plot1 <- function(plot1) {
     hist(plot1$Global_active_power, col="red",
             main="Global Active Power",
             xlab="Global Active Power (kilowatts)")
 
 }
 
 plot1 <- power_data("./household_power_consumption.txt")
 
 png("plot1.png", width=480, height=480)
 plot.plot1(plot1)
 dev.off()
