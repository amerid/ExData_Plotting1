
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

#Plot 3

 #Open PNG device
png(filename = "Plot3.png", width=480, height=480, bg="transparent")


# Create plot 
plot (y=data$Sub_metering_1, x=data$DateTime, ylab="Energy sub metering", xlab="",type="l", col="black")
lines(y=data$Sub_metering_2, x=data$DateTime, ylab="Energy sub metering", xlab="",type="l", col="red")
lines(y=data$Sub_metering_3, x=data$DateTime, ylab="Energy sub metering", xlab="",type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1))


# Close the PNG file device
dev.off()










