#dataFile <- "./data/household_power_consumption.txt"
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetdf <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetdf)
str(subSetdf)
complete.cases(subSetdf)
subSetdf1 <- subSetdf[complete.cases(subSetdf), ]
#subsetdf1 <- ?.omit(subSetdf)

datetime <- strptime(paste(subSetdf1$Date, subSetdf1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetdf1$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#dev.off()
