source("readData.R")
##
##
##
plot3 <- function(){
    # read data
    data <- readData()
    # set graphic device
    png(filename = "plot3.png",width = 480, height = 480)
    # plot
    with(data, {
        plot(DateTime, Sub_metering_1,  type="l" , xlab="", ylab="Global Active Power (kilowatts)")
        lines(DateTime, Sub_metering_2, col="red")
        lines(DateTime, Sub_metering_3, col="blue")
    })
    legend("topright", lty=c(1,1,1), col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    dev.off()
}