df0 <- "./data/household_power_consumption.txt"
df <- read.table(df0, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetdf <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetdf)
str(subSetdf)
complete.cases(subSetdf)
subSetdf1 <- subSetdf[complete.cases(subSetdf), ]
#subsetdf1 <- ?.omit(subSetdf)

datetime <- strptime(paste(subSetdf1$Date, subSetdf1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subSetdf1$Global_active_power)
energySubMetering1 <- as.numeric(subSetdf1$Sub_metering_1)
energySubMetering2 <- as.numeric(subSetdf1$Sub_metering_2)
energySubMetering3 <- as.numeric(subSetdf1$Sub_metering_3)
globaReactivePower <- as.numeric(subSetdf1$Global_reactive_power)

globalActivePower <- as.numeric(subSetdf1$Global_active_power)
voltage <- as.numeric(subSetdf1$Voltage)

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2), mar = c(4, 4, 2, 0), oma = c(0, 0, 2, 0), pty="s")

plot(datetime, voltage, xlab = "datetime", ylab = "Voltage", type="l")
plot(datetime, globaReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

plot(datetime, energySubMetering1, type="l", xlab="", ylab="energy SubMetering")
lines(datetime, energySubMetering2, type="l", col="red")
lines(datetime, energySubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd = 3, col= c("black", "red", "blue"))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


