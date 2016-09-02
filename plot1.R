#Code to generate plot 1 

#Upload the data 
fname <-"Enter the file path to your data"


houseData <- read.table(file = fname, header = TRUE, sep = ';', stringsAsFactors = FALSE)

houseData$Date <- as.Date(houseData$Date, format = "%d/%m/%Y")

d1 = as.Date('2/1/2007', format = '%m/%d/%Y')
d2 = as.Date('2/2/2007', format = '%m/%d/%Y')


febData <- houseData[(houseData$Date == d1) | (houseData$Date == d2),]
febData$Global_active_power <- as.numeric(febData$Global_active_power)

#Create Plot 1
png(filename = 'plot1.png', width = 480, height = 480)

hist(febData$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency', main = 'Global Active Power')

dev.off()
