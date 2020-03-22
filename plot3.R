table <- read.table("household_power_consumption.txt",header = TRUE, na.strings="?",sep = ";",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric"))

# only using data from 2007-02-01 and 2007-02-02
table_time <- subset(table, Date%in%c("1/2/2007","2/2/2007"))
table_time$Date <- as.Date(table_time$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(table_time$Date), table_time$Time)
table_time$datetime <- as.POSIXct(datetime)

# create plot
with(table_time, {
  plot(Sub_metering_1~datetime, type="l", 
       ylab = "Energu sub metering",xlab="")
  lines(Sub_metering_2~datetime,col = "red")
  lines(Sub_metering_3~datetime,col="blue")
})

# create legend 
legend("topright",col=c("black","red","blue"),lty=1,lwd=2,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# copy plot 
dev.copy(png, file="plot3.png",height = 480, width = 480)
dev.off()

