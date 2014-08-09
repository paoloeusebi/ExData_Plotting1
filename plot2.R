## load library
library(sqldf)

## make a path and file string
fn<-"D:/Coursera/power/household_power_consumption.txt"

## read file and select rows based on dates
DF1 <- read.csv.sql(fn, sep=";",sql = 'select * from file where Date = "1/2/2007"')
DF2 <- read.csv.sql(fn, sep=";",sql = 'select * from file where Date = "2/2/2007"')
DF<-rbind(DF1,DF2)
head(DF)
names(DF)
DF$dt=paste(DF$Date,DF$Time)
DF$dtime=strptime(DF$dt,"%d/%m/%Y %H:%M:%S")

#plot2
png(filename="plot2.png", height = 480,width = 480)
plot(DF$dtime,DF$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatt)")
dev.off()