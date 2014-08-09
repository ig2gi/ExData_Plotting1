source("readData.R")
##
##
##
plot2 <- function(){
    # read data
    data <- readData()
    # set graphic device
    png(filename = "plot2.png",width = 480, height = 480)
    # plot
    with(data, {
        plot(DateTime, Global_active_power,  type="l" , xlab="", ylab="Global Active Power (kilowatts)")
    })
    dev.off()
}