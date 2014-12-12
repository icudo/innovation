## Get the dataset
data_full <- read.table('household_power_consumption.txt',
                        header = TRUE,
                        sep = ";",
                        colClasses = c("character", "character", rep("numeric",7)),
                        na = "?")

## get the data only from 2007-02-01 to 2007-02-02 
subset <- Date == "1/2/2007" | Date == "2/2/2007"
data <- data_full[subset, ]

x <- paste(Date, Time)

## Converting dates
data$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")

## Plot 4
par(mfrow = c(2, 2))
## Top-left
plot(DateTime, Global_active_power, 
     type = "l",
     xlab = "", ylab = "Global Active Power")
## Top-right
plot(DateTime, Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")
## Bottom-left
plot(DateTime, Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(DateTime, Sub_metering_2, col = "red")
lines(DateTime, Sub_metering_3, col = "blue")
# Remove the border of legend here.
legend("top", 
       bty = "n",
       col = c("black", "red", "blue"),
       c("Sub_meter_1", "Sub_meter_2", "Sub_meter_3"),
       lwd = 1)
## Bottom-right
plot(DateTime, Global_reactive_power, 
     type = "l",
     col = "black",
     xlab = "datetime", ylab = colnames(newData)[4])

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()