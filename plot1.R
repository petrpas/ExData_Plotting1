
data=read.delim('household_power_consumption.txt', sep=';', na.strings = '?')

data$DateTime=as.POSIXct(strptime(paste(data$Date,data$Time),format='%d/%m/%Y %H:%M:%S', tz = "CET"))

begin=as.POSIXct('01/02/2007',format='%d/%m/%Y', tz = "CET")
end=as.POSIXct('03/02/2007',format='%d/%m/%Y', tz = "CET")

d=subset(data, DateTime>=begin & DateTime<end)

png('plot1.png')
hist(d$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowats)')
dev.off()
