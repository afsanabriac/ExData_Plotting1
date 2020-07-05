#Loading data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", comment.char = "")

#Filter data with specified dates
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#Convert to Time class the corresponding column
data$Time <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#Convert to Date class the corresponding column
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#Plotting second plot (lines)
plot(data$Time, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
lines(data$Time,data$Global_active_power)

#Copying to PNG file
dev.copy(png, file = "plot2.png")
dev.off()
