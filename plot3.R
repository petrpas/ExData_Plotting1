
Sys.setlocale("LC_TIME", "C")

data=read.delim('household_power_consumption.txt', sep=';', na.strings = '?')

data$DateTime=as.POSIXct(strptime(paste(data$Date,data$Time),format='%d/%m/%Y %H:%M:%S', tz = "CET"))

begin=as.POSIXct('01/02/2007',format='%d/%m/%Y', tz = "CET")
end=as.POSIXct('03/02/2007',format='%d/%m/%Y', tz = "CET")

d=subset(data, DateTime>=begin & DateTime<end)

png('plot3.png')
plot(d$DateTime, d$Sub_metering_1, ylab='Energy Sub Metering', t='l', xlab='')
lines(d$DateTime, d$Sub_metering_2, col='red')
lines(d$DateTime, d$Sub_metering_3, col='blue')
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1)
dev.off()
