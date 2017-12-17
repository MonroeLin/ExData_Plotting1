file <- dir('exdata_data_household_power_consumption', full.names = T)
data_all <- read.csv2(file, colClasses = 'character')
rm(file)
data_all[,1] <- as.Date(data_all[,1], '%d/%m/%Y')
lowdate <- as.Date('2007-02-01')
update <- as.Date('2007-02-02')
## && can only be used for vector of 1 length(& is better all the time)
data <- subset(data_all, Date >= lowdate & Date <= update)
data[,3:9] <- suppressWarnings(lapply(data[,3:9], as.numeric))

png("plot4.png")
par(mfcol = c(2,2))
## (1,1)
plot(1:2880, data[,3], 
     xlab = '', ylab= 'Global Active Power (kilowatts)', type = 'l',
     xaxt = 'n')
axis(1, c(0,1440,2880), c('Thu', 'Fri', 'Sat'))
## (2,1)
plot(1:2880, data[,7], 
     xlab = '', ylab= 'Energy sub metering', type = 'n',
     xaxt = 'n')
axis(1, c(0,1440,2880), c('Thu', 'Fri', 'Sat'))
lines(1:2880, data[,7], col = 'black')
lines(1:2880, data[,8], col = 'red')
lines(1:2880, data[,9], col = 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       lty = 1, col = c('black', 'red', 'blue'))
## (1,2)
plot(1:2880, data[,5], 
     xlab = 'datetime', ylab = 'Voltage', type = 'l', 
     xaxt = 'n') 
axis(1, c(0,1440,2880), c('Thu', 'Fri', 'Sat'))
## (2,2)
plot(1:2880, data[,4], 
     xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l', 
     xaxt = 'n') 
axis(1, c(0,1440,2880), c('Thu', 'Fri', 'Sat'))
dev.off()
rm(data)
rm(date_all)