power1 <- read.table("./household_power_consumption.txt", sep = ";" , header = TRUE, colClasses = "character")
power<- power1
power$datetime <- paste(power$Date, power$Time)

power$Date <- as.Date(power$Date, "%d/%m/%Y")
power2 <- power[power$Date == "2007-02-01"|power$Date == "2007-02-02",]

power2$datetime <- strptime(power2$datetime, "%d/%m/%Y %H:%M:%S")
power2$Sub_metering_1 <- as.numeric(power2$Sub_metering_1)
power2$Sub_metering_2 <- as.numeric(power2$Sub_metering_2)
power2$Sub_metering_3 <- as.numeric(power2$Sub_metering_3)

png(file = "plot3.png", width = 480, height = 480, units = "px")
plot(power2$datetime, power2$Sub_metering_1, xlab = "",ylab = "Energy sub metering", type = "l", col = "black" )
legend("topright" , legend = "Sub metering 1", lty=1)
lines(power2$datetime, power2$Sub_metering_2, col="red")
lines(power2$datetime, power2$Sub_metering_3, col = "blue")
legend("topright" , legend = c("Sub metering 1","Sub metering 2","Sub metering 3"), lty=1, col=c("black","red","blue"))
dev.off()