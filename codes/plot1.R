power1 <- read.table("./household_power_consumption.txt", sep = ";" , header = TRUE, colClasses = "character")
power<- power1
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power2 <- power[power$Date == "2007-02-01"|power$Date == "2007-02-02",]

power2$Global_active_power <- as.numeric(power2$Global_active_power)

png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(power2$Global_active_power, xlab = "Global Active Power(killowatt)", main = "Global Active Power", col = "red" )
dev.off()