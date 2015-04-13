## data file is assumed to locate in currect directory
data1<-read.csv("./household_power_consumption.txt", header=TRUE, sep=";", quote="", na.strings="?")
data1[,1]<-as.Date(data1[,1], "%d/%m/%Y")
data2<-data1[data1$Date=="2007-2-1"|data1$Date=="2007-2-2",]
data2 <- transform(data2, time = strptime(paste(data2$Date, data2$Time), "%Y-%m-%d %H:%M:%S"))
png(file="plot2.png", width=480, height=480)
plot(data2$time, data2$Global_active_power, type="l", ylab="Global Active Power (Kilowatts)", xlab="")
##dev.copy(png, file="Plot2.png")
dev.off()

