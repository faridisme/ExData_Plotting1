#Create plot 3 - 3 overlapping line charts for sub metering



library(lubridate)

df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE); 
df <- df[df$Date=="1/2/2007"|df$Date=="2/2/2007",]#filter dates on 2007-02-01 and 2007-02-02
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Time <- strptime(paste(df$Date,df$Time), "%Y-%m-%d %H:%M:%S")
df$Day <- weekdays(df$Date)
df$Global_active_power <- as.numeric(df$Global_active_power)

png("plot3.png",height=480,width=480, units="px")

plot(df$Time,df$Sub_metering_1, type="l" ,
     main="",ylab="Energy sub metering",xlab="",
     xaxt='n')
axis.POSIXct(1, at=c(df$Time[c(1,1441)],df$Time[1441]+hours(16)), labels=c(df$Day[c(1,1441)],"Saturday"))

lines(df$Time,df$Sub_metering_2, col="red")
lines(df$Time,df$Sub_metering_3, col="blue")

legend("topright", legend=names(df)[7:9], lty=1,col=c("black","red","blue"))

dev.off()


