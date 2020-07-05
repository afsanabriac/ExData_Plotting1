#Loading data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", comment.char = "")

#Filter data with specified dates
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#Convert to Time class the corresponding column
data$Time <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#Convert to Date class the corresponding column
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#Plotting multiple plots
par(mfrow = c(2,2))
plot(data$Time, data$Global_active_power, xlab = "", ylab = "Global Active Power", type = "n")
lines(data$Time,data$Global_active_power)

plot(data$Time, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "n")
lines(data$Time,data$Voltage)

plot(data$Time, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(data$Time,data$Sub_metering_1, col = "black")
lines(data$Time,data$Sub_metering_2, col = "red")
lines(data$Time,data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty = "solid", col = c("black","red", "blue"), cex = .8, bty = "n")

plot(data$Time, data$Global_reactive_power, xlab = "datetime",
     ylab = "Global_reactive_power", type = "n")
lines(data$Time,data$Global_reactive_power)

#Copying to PNG file
dev.copy(png, file = "plot4.png")
dev.off()
