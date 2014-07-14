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
par(mar=c(4.5,4.5,2,2))
hist(data$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency")

dev.copy(png,file="plot1.png")
dev.off()
