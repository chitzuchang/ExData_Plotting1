table <- read.table("household_power_consumption.txt",header = TRUE, na.strings="?",sep = ";",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric"))

# only using data from 2007-02-01 and 2007-02-02
table_time <- subset(table, Date%in%c("1/2/2007","2/2/2007"))
table_time$Date <- as.Date(table_time$Date, format = "%d/%m/%Y")

# create the plot
hist(table_time$Global_active_power, main = "Global Active Power",xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

# save the plot
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()
