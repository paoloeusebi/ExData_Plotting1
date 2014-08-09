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

#plot1
png(filename="plot1.png", height = 480,width = 480)
hist(DF$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatt)",cex.names=0.9)
dev.off()