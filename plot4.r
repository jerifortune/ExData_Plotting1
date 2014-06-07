# Loading the dataset
power_data <- function(filepath) {
      plot3 <- read.table(filepath, sep=";", header=TRUE, na.strings="?")
     
    # Creating  new "datetime" column with type POSIXlt
    plot3$date_time <- strptime(paste(plot3$Date, plot3$Time), "%d/%m/%Y %H:%M:%S")


    # Returning only the subset of dates as described in the assignment description
    plot_date <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))
    plot3[as.Date(plot3$date_time) %in% plot_date,]
}




# 
# Creating Function for the graph
do.plot3 <- function(plot3) {
    with(plot3, {
        # Set up the canvas
        plot(date_time, Sub_metering_1, type="n", xlab="",
            ylab="Energy sub metering")


        colo <- c("black", "red", "blue")
       x <- paste0("Sub_metering_", 1:3)


       
        for (t in seq_along(x)) {
            var <- x[t] 
            data <- plot3[[var]]
            lines(date_time, data, col=colo[t])
        }

        legend("topright",
            legend=variables,col=colo,lty="solid" )
    }) 
}


plot3 <- power_data("./household_power_consumption.txt")


png("plot3.png", width=480, height=480)
do.plot3(plot3)
dev.off()

