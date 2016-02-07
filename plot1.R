# read data
df <- read.table("household_power_consumption.txt"
                 , sep = ";"
                 , header = T
                 , stringsAsFactors = F
                 , na.strings="?"
                 , colClasses=c("character", "character", "numeric",
                              "numeric", "numeric", "numeric",
                              "numeric", "numeric", "numeric"))
# Subset
df <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

# open graphics object
png(filename="plot1.png", width=480, height=480)

# make plot
hist(df$Global_active_power
     , col = "red"
     , main = "Global Active Power"
     , xlab = "Global Active Power (kilowatts)"
     , breaks = 12
     , ylim = c(0, 1200))

# close graphics object
dev.off()