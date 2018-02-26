filepath <- "./household_power_consumption.txt"
png(file="plot4.png", width=480, height=480)

#read the whole data
data <- read.table(filepath, 
                   header = TRUE, sep = ";", 
                   colClasses = c("character", "character", "numeric", "numeric", "numeric", 
                                  "numeric", "numeric", "numeric", "numeric"),
                   stringsAsFactors = FALSE,
                   na.strings = c("NA", "?")
)

#subsetting 2007-02-01 and 2007-02-02
l <- ( data$Date == "1/2/2007" | data$Date ==  "2/2/2007") 
data <- data[l, ]
rm(l)

#Date format
data$Datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

#plot 4
par(mfrow = c(2, 2), cex = 0.7)

with(data, {
  #Global Active power
  plot(Datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  
  #Voltage
  plot(Datetime, Voltage, type="l", xlab = "datetime", ylab = "Voltage")
  
  #Energy sub metering
  plot(Datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  points(Datetime, Sub_metering_1, type="l", col="black")
  points(Datetime, Sub_metering_2, type="l", col="red")
  points(Datetime, Sub_metering_3, type="l", col="blue")
  legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1), bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  #Global reactive power
  plot(Datetime, Global_reactive_power, type="l", xlab = "datetime")
})
par(mfrow = c(1, 1))

dev.off()

