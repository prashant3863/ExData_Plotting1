power1 <- read.table("./household_power_consumption.txt", sep = ";" , header = TRUE, colClasses = "character")
power<- power1
power$datetime <- paste(power$Date, power$Time)

power$Date <- as.Date(power$Date, "%d/%m/%Y")
power2 <- power[power$Date == "2007-02-01"|power$Date == "2007-02-02",]

power2$datetime <- strptime(power2$datetime, "%d/%m/%Y %H:%M:%S")
power2$Global_active_power <- as.numeric(power2$Global_active_power)

png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(power2$datetime, power2$Global_active_power, xlab = "", ylab = "Global Active Power(killowatt)", type = "l" )
dev.off()