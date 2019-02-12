data <- read.table("household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
#read raw data

used <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007"))
#select target data

used$Date <- as.Date(used$Date, format = '%d/%m/%y')
#change the class of the variable 'date'

used$DateTime <- as.POSIXct(paste(used$Date, used$Time))
# Combine date and time

png('plot2.png', width = 480, height = 480)
#save the figure as a png file

plot(used$DateTime, used$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")

dev.off()