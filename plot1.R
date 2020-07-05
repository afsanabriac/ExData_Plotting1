#Loading data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", comment.char = "")

#Filter data with specified dates
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#Convert to Time class the corresponding column
data$Time <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#Convert to Date class the corresponding column
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#Plotting first plot (histogram)
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")


#Copying to PNG file
dev.copy(png, file = "plot1.png")
dev.off()
