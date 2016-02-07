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
png(filename="plot3.png", width=480, height=480)

# make plot
plot(df$datetime, df$Sub_metering_1, type="l"
     , xlab="", ylab="Energy sub metering")
lines(df$datetime, df$Sub_metering_2, type="l", col = 'red')
lines(df$datetime, df$Sub_metering_3, type="l", col = 'blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , lty=1, lwd=2.5, col=c("black", "red", "blue"))

# close graphics object
dev.off()