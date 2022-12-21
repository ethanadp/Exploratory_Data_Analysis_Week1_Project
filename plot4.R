# This will read the data and assign the classes to the variables within the table provided.
# The first two classes are labeled as 'character' for the filtering process coming up.
OriginalData <- read.table("household_power_consumption.txt", sep=";", header=TRUE,
                           colClasses = c("character", "character", rep("numeric", 7)),
                           na.strings = "?")

# This converts the character two classes for the date and time of the data to a date-based
# class where we could filter through it later.
OriginalData$Time <- strptime(paste(OriginalData$Date, OriginalData$Time), "%d/%m/%Y %H:%M:%S")
OriginalData$Date <- as.Date(OriginalData$Date, format="%d/%m/%Y")

# This filters through the dates to specify the two days we are interested in.
data <- subset(OriginalData, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# This next small line of code is what will set up the PNG device to hold a 2x2 grid of images
# that we'll be filling with the graphs.
par(mfrow = c(2, 2))

# The first plot we've seen before as "plot2.png", the second is just the voltage plotted.
plot(data$Time, data$Global_active_power, type="l", xlab = "", ylab ="Global Active Power")
plot(data$Time, data$Voltage, type="l", xlab = "", ylab ="Voltage")

# This is the third plot, "plot3.png", plotted again.
plot(data$Time, data$Sub_metering_1, type="l", xlab = "", ylab ="Energy sub metering")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, cex = 0.5)

# The extra plotted lines and legend when using R's base plotting, are automatically inserted onto 
# the last plotted graph. So we have to make sure to plot any other graphs AFTER the last thing we
# wish to be added to a respective graph, like how the fourth plot is created after the one above.
plot(data$Time, data$Global_reactive_power, type="l", xlab = "datetime", 
     ylab ="Global_reactive_power")

# Saves the copy of the fourth plot at the right scale and closes the PNG device.
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()