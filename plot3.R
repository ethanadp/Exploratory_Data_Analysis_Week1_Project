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

# The initial code line will plot Sub_metering_1 and then the following two lines of 
# code will apply two more lines to be plotted, being the Sub_metering_2|3.
plot(data$Time, data$Sub_metering_1, type="l", xlab = "", ylab ="Energy sub metering")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")

# This creates the legend to be displayed on the top right to distinguish the different
# lines plotted earlier, with their respective colors.
legend("topright", col=c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

# Saves the copy of the third plot at the right scale and closes the PNG device.
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()