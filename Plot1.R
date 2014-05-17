
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

#Open PNG device - create 'Plot1.png' 

png(filename = "Plot1.png", width=480, height=480, bg="transparent")


# Create plot send to a file 
hist(x=week1$Global_active_power, main="Global Active Power", col="red",xlab="Global Active Power (killowatts)")


# Close the PNG file device
dev.off()
------









