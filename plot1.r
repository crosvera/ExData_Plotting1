filepath <- "./household_power_consumption.txt"
png(file="plot1.png", width=480, height=480)

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

#plot 1
hist(data$Global_active_power, col="red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

dev.off()
