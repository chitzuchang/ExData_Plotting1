table <- read.table("household_power_consumption.txt",header = TRUE, na.strings="?",sep = ";",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric"))

# only using data from 2007-02-01 and 2007-02-02
table_time <- subset(table, Date%in%c("1/2/2007","2/2/2007"))
table_time$Date <- as.Date(table_time$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(table_time$Date), table_time$Time)
table_time$datetime <- as.POSIXct(datetime)

# make the plot 
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(table_time,{
  plot(Global_active_power~datetime,type="l",ylab="Global Active Power", xlab = "")
  plot(Voltage~datetime,type="l",ylab="Voltage (Volt)",xlab="")
  plot(Sub_metering_1~datetime,type="l",ylab="Energy sub metering",xlab="")
  lines(Sub_metering_2~datetime, col = "red")
  lines(Sub_metering_3~datetime, col = "blue")
  legend("topright",col=c("black","red","blue"),lty=1,lwd=2,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(Global_reactive_power~datetime, type="l",ylab="Global Reactive Power (kilowatts)",xlab="")
})

dev.copy(png,file="plot4.png",width=480, height = 480)
dev.off()