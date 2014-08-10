#
#
#
readData <- function(from=as.Date('1/2/2007',format='%d/%m/%Y'), to=as.Date('2/2/2007',format='%d/%m/%Y')){
    data <- NULL
    delta <- 100000
    step <- 0
    complete <- FALSE
    while(complete == FALSE){
        df <- read.csv("household_power_consumption.txt", sep=";", nrows=delta, skip=step, na.strings = c("","?"), colClasses=c("character","character", rep("numeric",7)))
        date1 <- as.Date(df[1, 1],format='%d/%m/%Y')
        date2 <- as.Date(df[delta, 1],format='%d/%m/%Y')
        if (date2 < from){
            step <- step + delta
            next
        }
        data <- subset(df, as.Date(Date, format='%d/%m/%Y') >= from & as.Date(Date, format='%d/%m/%Y') <= to)
        complete <- TRUE
    }
    # add a Data + Time column
    data[,"DateTime"] <- as.POSIXct(paste(data[,1],data[,2], sep=" "), format="%d/%m/%Y %H:%M:%S")
    data
}
