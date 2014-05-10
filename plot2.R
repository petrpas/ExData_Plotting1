
Sys.setlocale("LC_TIME", "C")

data=read.delim('household_power_consumption.txt', sep=';', na.strings = '?')

data$DateTime=as.POSIXct(strptime(paste(data$Date,data$Time),format='%d/%m/%Y %H:%M:%S', tz = "CET"))

begin=as.POSIXct('01/02/2007',format='%d/%m/%Y', tz = "CET")
end=as.POSIXct('03/02/2007',format='%d/%m/%Y', tz = "CET")

d=subset(data, DateTime>=begin & DateTime<end)

png('plot2.png')
plot(d$DateTime, d$Global_active_power, t='l', xlab='', ylab='Global Active Power (kilowats)')
dev.off()
