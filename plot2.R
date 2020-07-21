library(data.table)
file <- "data/household_power_consumption.txt"
dt <- fread(file , sep=";",header=T, nrows = 100000)
dt$Date <-as.Date(raw$Date,format="%d/%m/%Y")
dt$Global_active_power <- as.numeric(dt$Global_active_power)
dt <- dt[Date>="2007-02-01" & Date<="2007-02-02"]


dt$stamp<-strftime(paste(dt$Date,dt$Time),format="%Y-%m-%d %H:%M:%S")

dt$stamp <- as.POSIXct(dt$stamp)  


png('plot2.png', width = 480, height = 480, units = "px")
plot(dt$stamp,dt$Global_active_power,type = 'l',col="black",xlab="",ylab="Global Active Power (kilowatts)",col.axis="black")
dev.off()

