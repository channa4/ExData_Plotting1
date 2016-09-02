#Code to generate plot 2

#Upload the data 
fname <- "Enter the file path to your data"

houseData <- read.table(file = fname, header = TRUE, sep = ';', stringsAsFactors = FALSE)



#Clean and filter the data
houseData$Date <- as.Date(houseData$Date, format = "%d/%m/%Y")

d1 = as.Date('2/1/2007', format = '%m/%d/%Y')
d2 = as.Date('2/2/2007', format = '%m/%d/%Y')


febData <- houseData[(houseData$Date == d1) | (houseData$Date == d2),]
febData$Global_active_power <- as.numeric(febData$Global_active_power)
febData$Date <- paste(febData$Date, febData$Time)
febData$Date <- strptime(febData$Date, format = '%Y-%m-%d %H:%M:%S')



#Create Plot 2
png(filename = 'plot2.png', width = 480, height = 480)

plot(febData$Date, febData$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatts)', type = 'l')

dev.off()
