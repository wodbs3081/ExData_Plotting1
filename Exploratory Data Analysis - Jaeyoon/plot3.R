data<-read.table("./data/#4cp1.txt",sep=";",header=TRUE,na.strings="?")
data<-data[66637:69516,]
data[1]<-as.Date(data[[1]],format="%d/%m/%Y")
x<-data[[1]]
y<-as.character(data[[2]])
z<-paste(x,y)
time<-strptime(z,format="%Y-%m-%d %H:%M:%S")
data$Date<-NULL
data$Time<-NULL
data["Date_Time"]<-0
data[["Date_Time"]]<-time

par(mfrow=c(1,1))
par(mar=c(2.5,4.5,1.5,2))
plot(data$Date_Time,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
points(data$Date_Time,data$Sub_metering_2,col="red",type="l")
points(data$Date_Time,data$Sub_metering_3,col="blue",type="l")
legend("topright",pch="-",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="plot3.png")
dev.off()