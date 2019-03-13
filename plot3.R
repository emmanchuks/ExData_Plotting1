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


png("plot3.png", width=480, height=480)
plot3 <- plot(datetime, energySubMetering1, type="l", xlab="", ylab="energy SubMetering")
lines(datetime, energySubMetering2, type="l", col="red")
lines(datetime, energySubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd = 3, col= c("black", "red", "blue"))
#dev.off()
