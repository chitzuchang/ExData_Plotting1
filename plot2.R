table <- read.table("household_power_consumption.txt",header = TRUE, na.strings="?",sep = ";",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric"))

# only using data from 2007-02-01 and 2007-02-02
table_time <- subset(table, Date%in%c("1/2/2007","2/2/2007"))
table_time$Date <- as.Date(table_time$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(table_time$Date), table_time$Time)
table_time$datetime <- as.POSIXct(datetime)

# make the plot 
with(table_time, {
  plot(Global_active_power~datetime, type = "l", 
       ylab = "Global Active Power (kilowatts)",xlab = "")
})

# make a copy of the plot 
dev.copy(png, file = "plot2.png",height = 480, width = 480)
dev.off()