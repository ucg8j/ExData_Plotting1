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
png(filename="plot2.png", width=480, height=480)

# make plot
plot(df$datetime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# close graphics object
dev.off()