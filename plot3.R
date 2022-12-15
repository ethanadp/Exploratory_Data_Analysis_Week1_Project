OriginalData <- read.table("household_power_consumption.txt", sep=";", header=TRUE,
                           colClasses = c("character", "character", rep("numeric", 7)),
                           na.strings = "?")

OriginalData$Time <- strptime(paste(OriginalData$Date, OriginalData$Time), "%d/%m/%Y %H:%M:%S")
OriginalData$Date <- as.Date(OriginalData$Date, format="%d/%m/%Y")

data <- subset(OriginalData, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

plot(data$Time, data$Sub_metering_1, type="l", xlab = "", ylab ="Energy sub metering")

lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")

legend("topright", col=c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()