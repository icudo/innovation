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

## Plot 3
plot(DateTime, Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(DateTime, Sub_metering_2, col = "red")
lines(DateTime, Sub_metering_3, col = "blue")
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_meter_1", "Sub_meter_2", "Sub_meter_3"),
       lwd = 1)

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
