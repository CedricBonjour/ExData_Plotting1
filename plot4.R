library(data.table)
file <- "data/household_power_consumption.txt"
dt <- fread(file , sep=";",header=T, nrows = 100000)
dt$Date <-as.Date(raw$Date,format="%d/%m/%Y")
dt$Global_active_power <- as.numeric(dt$Global_active_power)
dt <- dt[Date>="2007-02-01" & Date<="2007-02-02"]

dt$stamp<-strftime(paste(dt$Date,dt$Time),format="%Y-%m-%d %H:%M:%S")

dt$stamp <- as.POSIXct(dt$stamp)  


png('plot4.png', width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(dt$stamp,dt$Global_active_power,type = 'l',col="black",xlab="",ylab="Global Active Power",col.axis="black")
box(lty='solid',lwd=2,col='gray')
plot(dt$stamp,dt$Voltage,type="l",col="black",xlab="datetime",ylab="Voltage")
box(lty='solid',lwd=2,col='gray')
plot(dt$stamp,dt$Sub_metering_1,type = 'n',xlab="",ylab="Energy sub metering")
points(dt$stamp,dt$Sub_metering_1,col="black",type="l")
points(dt$stamp,dt$Sub_metering_2,col="red",type="l")
points(dt$stamp,dt$Sub_metering_3,col="blue",type="l")
legend("topright",pch=c(NA,NA,NA),text.col="black",box.lwd=0,box.col="white",lwd=1,lty=(c(1,1,1)),col=(c("black","red","blue")),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=.9)
box(lty='solid',lwd=2,col='gray')
plot(dt$stamp,dt$Global_reactive_power,type="l",col="black",xlab="datetime",ylab="Global_reactive_power")
box(lty='solid',lwd=2,col='gray')
dev.off()
