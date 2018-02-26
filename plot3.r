filepath <- "./household_power_consumption.txt"
png(file="plot3.png", width=480, height=480)

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

#decrease font size from 1 to 0.8
par(cex=0.8)

#plot 3
with(data, {
  plot(Datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  points(Datetime, Sub_metering_1, type="l", col="black")
  points(Datetime, Sub_metering_2, type="l", col="red")
  points(Datetime, Sub_metering_3, type="l", col="blue")
  legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

dev.off()
