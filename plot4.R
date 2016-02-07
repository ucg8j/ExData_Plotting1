# read data
df <- read.table("household_power_consumption.txt"
                 , sep = ";"
                 , header = T
                 , stringsAsFactors = F
                 , na.strings="?"
                 , colClasses=c("character", "character", "numeric",
                                "numeric", "numeric", "numeric",
                                "numeric", "numeric", "numeric"))
# subset
df <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

# extra formatting of dates
df$datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# open graphics object
png(filename="plot4.png", width=480, height=480)

# set up multi plot
par(mfrow = c(2, 2)) 

# make plot1
plot(df$datetime, df$Global_active_power, type="l", ylab="Global Active Power", xlab = "")

# make plot2
plot(df$datetime, df$Voltage, type="l", xlab="datetime", ylab="Voltage")

# make plot3
plot(df$datetime, df$Sub_metering_1, type="l"
     , xlab="", ylab="Energy sub metering")
lines(df$datetime, df$Sub_metering_2, type="l", col = 'red')
lines(df$datetime, df$Sub_metering_3, type="l", col = 'blue')
legend("topright", bty = "n", col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1, cex = 0.40)

# make plot4
plot(df$datetime, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# close graphics object
dev.off()