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

# Plots a line graph with the Global Active Power vs time graph.
plot(data$Time,data$Global_active_power, type="l", xlab = "", ylab ="Global Active Power (kilowatts)")

# Saves the copy of the second plot at the right scale and closes the PNG device.
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()