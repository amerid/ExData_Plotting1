
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

#Plot 2

 #Open PNG device
png(filename = "Plot2.png", width=480, height=480, bg="transparent")


# Create plot and send to a file (no plot appears on screen)
plot(y=week1$Global_active_power, x=week1$DateTime, ylab="Global Active Power (killowatts)", xlab="",type="l")


# Close the PNG file device
dev.off()








