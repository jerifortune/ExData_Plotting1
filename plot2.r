# Loading the dataset
power_data <- function(filepath) {
    # Just read the whole thing
    plot2<- read.table(filepath, sep=";", header=TRUE, na.strings="?")


    # Creating  new "datetime" column with type POSIXlt
    plot2$date_time <- strptime(paste(plot2$Date, plot2$Time), "%d/%m/%Y %H:%M:%S")


    # Returning only the subset of dates as described in the assignment description
    date_plot <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))
    plot2[as.Date(plot2$date_time) %in% date_plot,]
}




# Creating Function for the graph
do.plot2 <- function(plot2) {
    with(plot2, {
        plot(date_time, Global_active_power, type="l", xlab="",
            ylab="Global Active Power (kilowatts)")
    }) 


}


plot2 <- power_data("./household_power_consumption.txt")


png("plot2.png", width=480, height=480, bg=bg.color)
do.plot2(plot2)
dev.off()
