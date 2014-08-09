## load library
library(sqldf)

## make a path and file string
fn<-"D:/Coursera/exdata-005/power/household_power_consumption.txt"

## read file and select rows based on dates
DF1 <- read.csv.sql(fn, sep=";",sql = 'select * from file where Date = "1/2/2007"')
DF2 <- read.csv.sql(fn, sep=";",sql = 'select * from file where Date = "2/2/2007"')
DF<-rbind(DF1,DF2)
head(DF)
names(DF)
DF$dt=paste(DF$Date,DF$Time)
DF$dtime=strptime(DF$dt,"%d/%m/%Y %H:%M:%S")

#plot4
png(filename="plot4.png", height = 480,width = 480)
par(mfrow=c(2,2))
plot(DF$dtime,DF$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatt)")
plot(DF$dtime,DF$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(DF$dtime,DF$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering")
lines(DF$dtime,DF$Sub_metering_2,type="l",col="red")
lines(DF$dtime,DF$Sub_metering_3,type="l",col="blue")
legend("topright",legend=names(DF)[7:9], lty=1,col=c("black","red","blue"),bty="n",cex=0.75)
plot(DF$dtime,DF$Global_reactive_power,type="l",xlab="datetime")
dev.off()