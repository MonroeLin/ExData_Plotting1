file <- dir('exdata_data_household_power_consumption', full.names = T)
data_all <- read.csv2(file, colClasses = 'character')
rm(file)
data_all[,1] <- as.Date(data_all[,1], '%d/%m/%Y')
lowdate <- as.Date('2007-02-01')
update <- as.Date('2007-02-02')
## && can only be used for vector of 1 length(& is better all the time)
data <- subset(data_all, Date >= lowdate & Date <= update)
data[,3:9] <- suppressWarnings(lapply(data[,3:9], as.numeric))

png("plot1.png")
hist(data[,3], col = 'red', 
     xlab= 'Global Active Power (kilowatts)', ylab = 'Frequency', 
     main = 'Global Active Power')
dev.off()
rm(data)
rm(date_all)