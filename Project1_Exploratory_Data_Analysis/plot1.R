data <- read.table("household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
#read raw data

used <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007"))
#select target data

hist(used$Global_active_power, col= "red", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", main= "Global Active Power")
#make the histogram

png('plot1.png', width = 480, height = 480)
#output the figure to a png file

hist(used$Global_active_power, col= "red", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", main= "Global Active Power")

dev.off()