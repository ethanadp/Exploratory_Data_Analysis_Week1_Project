OriginalData <- read.table("household_power_consumption.txt", sep=";", 
                           header=TRUE,colClasses = c("character", "character", rep("numeric", 7)),
                           na.strings = "?")

OriginalData$Time <- strptime(paste(OriginalData$Date, OriginalData$Time), "%d/%m/%Y %H:%M:%S")
OriginalData$Date <- as.Date(OriginalData$Date, format="%d/%m/%Y")

data <- subset(OriginalData, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()