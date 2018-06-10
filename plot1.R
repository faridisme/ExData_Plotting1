#Create plot 1 - histogram of global active power



library(lubridate)

df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE); 
df <- df[df$Date=="1/2/2007"|df$Date=="2/2/2007",]#filter dates on 2007-02-01 and 2007-02-02
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Time <- strptime(paste(df$Date,df$Time), "%Y-%m-%d %H:%M:%S")
df$Day <- weekdays(df$Date)
df$Global_active_power <- as.numeric(df$Global_active_power)

png("plot1.png",height=480,width=480, units="px")

hist(df$Global_active_power, breaks=12, col="red", 
     main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()

