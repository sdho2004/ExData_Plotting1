## Download Electric Power Consumption zip file into a temp and extract the zip
##temp <- tempfile()
##download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp, mode="wb")
##unzip(temp, "household_power_consumption.txt")
##unlink(temp)

    ## Read in household_power_consumption.txt file as csv assuming the file is in the working directory
    ## with semicolon separator and removing na such as "?"
    hhps <- read.csv(file = "household_power_consumption.txt", sep=";", na.strings = c("?", ""))
    
    ## Convert the Date to the following format "YYYY-MM-DD"
    hhps$Date <- as.Date(hhps$Date, format="%d/%m/%Y")
    
    ## Convert the time to POSIXit format
    hhps$Time <- strptime(paste(hhps$Date, hhps$Time), format = "%Y-%m-%d %H:%M:%S")
    
    ## Subsetting the data for only 2007-02-01 and 2007-02-02
    subhhps <- subset(hhps, Date >= "2007-02-01" & Date <= "2007-02-02")
    
    ## Create a plot1.png file in the working directory
    ##dev.copy(png, file="plot3.png", width=480, height=480)
    png("plot3.png", width=480, height=480, type="window")
    
    ## Set a margin before plotting
    par(mar = c(4,4,2,2))
    
    ## Plot a line graph based on Energy sub metering columns and Time
    plot(subhhps$Time, subhhps$Sub_metering_1, type ="l", ylab = "Energy sub metering", xlab = "")
    lines(subhhps$Time, subhhps$Sub_metering_2, col = "red")
    lines(subhhps$Time, subhhps$Sub_metering_3, col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))
    
    ## Close writing a file to png
    dev.off()
    
### END OF PLOT3.R ###
    