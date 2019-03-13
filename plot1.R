df0 <- "./data/household_power_consumption.txt"
df <- read.table(df0, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetdf <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetdf)
str(subSetdf)
complete.cases(subSetdf)
subSetdf1 <- subSetdf[complete.cases(subSetdf), ]
#subsetdf1 <- ?.omit(subSetdf)

globalActivePower <- as.numeric(subSetdf1$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
