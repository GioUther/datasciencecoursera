data<- read.table("household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
#read raw data

used <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007"))
#select target data

used$Date <- as.Date(used$Date, format = '%d/%m/%y')
#change the format of the variable 'date'

used$DateTime <- as.POSIXct(paste(used$Date, used$Time))
# Combine date and time

png("plot3.png", width = 480, height = 480)
plot(used$DateTime, used$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(used$DateTime, used$Sub_metering_2, type="l", col="red")
lines(used$DateTime, used$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
# Creating the plot3

dev.off()