library(data.table)
file <- "data/household_power_consumption.txt"
dt <- fread(file , sep=";",header=T, nrows = 100000)
dt$Date <-as.Date(raw$Date,format="%d/%m/%Y")
dt$Global_active_power <- as.numeric(dt$Global_active_power)
dt <- dt[Date>="2007-02-01" & Date<="2007-02-02"]

png('plot1.png', width = 480, height = 480, units = "px")
hist(dt$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
