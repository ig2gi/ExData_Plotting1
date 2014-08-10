source("readData.R")
##
##
##
plot4 <- function(){
    # read data
    data <- readData()
    # set graphic device
    png(filename = "plot4.png",width = 480, height = 480)
    # plot
    par(mfrow = c(2, 2))
    with(data, {
        # plot1
        plot(DateTime, Global_active_power,  type="l" , xlab="", ylab="Global Active Power (kilowatts)")
        # plot2
        plot(DateTime, Voltage,  type="l" , ylab="Voltage", xlab="datetime")
        # plot3
        plot(DateTime, Sub_metering_1,  type="l" , xlab="", ylab="Global Active Power (kilowatts)")
        lines(DateTime, Sub_metering_2, col="red")
        lines(DateTime, Sub_metering_3, col="blue")
        legend("topright", lty=c(1,1,1), col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        # plot4
        plot(DateTime, Global_reactive_power,  type="l" , ylab="Global_reactive_power", xlab="datetime")
        })
    dev.off()
}