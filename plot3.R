library(data.table)
file <- "data/household_power_consumption.txt"
dt <- fread(file , sep=";",header=T, nrows = 100000)
dt$Date <-as.Date(raw$Date,format="%d/%m/%Y")
dt$Global_active_power <- as.numeric(dt$Global_active_power)
dt <- dt[Date>="2007-02-01" & Date<="2007-02-02"]

dt$stamp<-strftime(paste(dt$Date,dt$Time),format="%Y-%m-%d %H:%M:%S")

dt$stamp <- as.POSIXct(dt$stamp)  


png('plot3.png', width = 480, height = 480, units = "px")
plot(dt$stamp,dt$Sub_metering_1,type = 'n',xlab="",ylab="Energy sub metering")
points(dt$stamp,dt$Sub_metering_1,col="black",type="l")
points(dt$stamp,dt$Sub_metering_2,col="red",type="l")
points(dt$stamp,dt$Sub_metering_3,col="blue",type="l")
legend("topright",pch=c(NA,NA,NA),text.col="black",lwd=1,lty=(c(1,1,1)),col=(c("black","red","blue")),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()

