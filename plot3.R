#Code to generate plot 3

#Upload the data 
fname <-"Enter the file path to your data"

houseData <- read.table(file = fname, header = TRUE, sep = ';', stringsAsFactors = FALSE)



#Clean and filter the data
houseData$Date <- as.Date(houseData$Date, format = "%d/%m/%Y")

d1 = as.Date('2/1/2007', format = '%m/%d/%Y')
d2 = as.Date('2/2/2007', format = '%m/%d/%Y')


febData <- houseData[(houseData$Date == d1) | (houseData$Date == d2),]
#Conversions to numeric data types
febData$Sub_metering_1 <- as.numeric(febData$Sub_metering_1)
febData$Sub_metering_2 <- as.numeric(febData$Sub_metering_2)
febData$Sub_metering_3 <- as.numeric(febData$Sub_metering_3)


#Combine and reformat the data time
febData$Date <- paste(febData$Date, febData$Time)
febData$Date <- strptime(febData$Date, format = '%Y-%m-%d %H:%M:%S')



#Create Plot 3
png(filename = 'plot3.png', width = 480, height = 480)

plot(febData$Date, febData$Sub_metering_1, xlab = '', ylab = 'Energy Sub Metering', type = 'l')
lines(febData$Date, febData$Sub_metering_2, type = 'l', col = 'red')
lines(febData$Date, febData$Sub_metering_3, type = 'l', col = 'blue')
legend('topright',col = c('black', 'red', 'blue'), lty = c(1,1,1), legend = c('Sub_Metering_1','Sub_Metering_2','Sub_Metering_3'))

dev.off()