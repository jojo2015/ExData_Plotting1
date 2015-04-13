## data file is assumed to locate in currect directory
data1<-read.csv("./household_power_consumption.txt", header=TRUE, sep=";", quote="", na.strings="?")
data1[,1]<-as.Date(data1[,1], "%d/%m/%Y")
data2<-data1[data1$Date=="2007-2-1"|data1$Date=="2007-2-2",]
png(file="plot1.png", width=480, height=480)
hist(data2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (Kilowatts)", ylim=c(0,1200))
##dev.copy(png, file="Plot1.png")
dev.off()

