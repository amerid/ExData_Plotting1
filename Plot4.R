
# Create data in R
week1 <- read.table ("Household_power.txt", header=T,quote="\"", sep=";", na.strings="?")

#Check number of rows
nrow(week1)

# Convert factor to date(date)
week1$Date <- as.Date(week1$Date, format="%d/%m/%Y")


# Subset for 2 days 2/1 and 2/2 2007

Week1 <- week1[week1$Date >= as.Date("2007-02-01") & week1$Date <= as.Date("2007-02-02"), ]

# Create Date/Time stamp
week1$DateTime <- strptime(paste(week1$Date, week1$Time), format="%Y-%m-%d %H:%M:%S", tz="EST")

#Plot 4

# Open PNG device
png(filename = "Plot4.png", width=480, height=480, bg="transparent")


# Create plots 
par(mfrow = c(2, 2),ps=12)


plot(y=week1$Global_active_power, x=week1$DateTime, ylab="Global Active Power", xlab="", type="l")
plot(y=week1$Voltage, x=week1$DateTime, ylab="Voltage", xlab="datetime", type="l")
plot (y=week1$Sub_metering_1, x=week1$DateTime, ylab="Energy sub metering", xlab="", type="l", col="black")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1), bty="n")
lines(y=week1$Sub_metering_2, x=week1$DateTime, ylab="Energy sub metering", xlab="", type="l", col="red"  )
lines(y=week1$Sub_metering_3, x=week1$DateTime, ylab="Energy sub metering", xlab="", type="l", col="blue" )
plot(y=week1$Global_reactive_power, x=week1$DateTime, ylab="Global_reactive_power", xlab="datetime", type="l")


# Close the PNG file 
dev.off()










