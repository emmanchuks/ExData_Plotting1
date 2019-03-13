df0 <- "./data/household_power_consumption.txt"
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetdf <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetdf)
str(subSetdf)
complete.cases(subSetdf)
subSetdf1 <- subSetdf[complete.cases(subSetdf), ]
#subsetdf1 <- ?.omit(subSetdf)

datetime <- strptime(paste(subSetdf1$Date, subSetdf1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetdf1$Global_active_power)
voltage <- as.numeric(subSetdf1$Voltage)
png("plot4.png", width=480, height=480)
par(mfrow = c(1, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0), pty="s")
#windows.options(width=10, height=10)

# plot away
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(datetime, voltage, xlab = "datetime", ylab = "Voltage", type="l")
dev.off()
