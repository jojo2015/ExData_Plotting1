## data file is assumed to locate in currect directory
data1<-read.csv("./household_power_consumption.txt", header=TRUE, sep=";", quote="", na.strings="?")
data1[,1]<-as.Date(data1[,1], "%d/%m/%Y")
data2<-data1[data1$Date=="2007-2-1"|data1$Date=="2007-2-2",]
data2 <- transform(data2, time = strptime(paste(data2$Date, data2$Time), "%Y-%m-%d %H:%M:%S"))

png(file="plot3.png", width=480, height=480)
plot(data2$time, data2$Sub_metering_1, col="black", type="l", ylab="Energy sub metering", xlab="", ylim=c(0,40))
par(new=TRUE)
plot(data2$time, data2$Sub_metering_2, col="red", type="l", ylab="", xlab="", ylim=c(0,40))
par(new=TRUE)
plot(data2$time, data2$Sub_metering_3, col="blue", type="l", ylab="", xlab="", ylim=c(0,40))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),bty = "o",lwd=2, lty=c(1,1,1),cex=0.8,y.intersp=0.7)

##dev.copy(png, file="Plot3.png")
dev.off()

