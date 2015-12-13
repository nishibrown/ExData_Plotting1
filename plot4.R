setwd("~/JHU Data Science/EDA/Project 1/")
power_data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = "character")
feb_items<-subset(power_data, power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007")


feb_items$Date<-as.Date(feb_items$Date, format="%d/%m/%Y")
feb_items$Time<-strptime(feb_items$Time, format = "%H:%M:%S")
feb_items$Global_active_power<-as.numeric(feb_items$Global_active_power)
feb_items$Global_reactive_power<-as.numeric(feb_items$Global_reactive_power)
feb_items$Voltage<-as.numeric(feb_items$Voltage)
feb_items$Global_intensity<-as.numeric(feb_items$Global_intensity)
feb_items$Sub_metering_1<-as.numeric(feb_items$Sub_metering_1)
feb_items$Sub_metering_2<-as.numeric(feb_items$Sub_metering_2)
feb_items$Sub_metering_3<-as.numeric(feb_items$Sub_metering_3)


library(datasets)
png(file="plot4.png",width=480,height=480)

par(mfrow=c(2,2))

plot(feb_items$Global_active_power, type = "l", xaxt="n", xlab = "", ylab="Global Active Power (kilowatts)")
axis(side=1, at=c(0, 1450, 2900), labels=c("Thu", "Fri", "Sat"))

plot(feb_items$Voltage, type = "l", xaxt="n", xlab = "datetime", ylab="Voltage")
axis(side=1, at=c(0, 1450, 2900), labels=c("Thu", "Fri", "Sat"))


plot(feb_items$Sub_metering_1, type = "l", xlab="", xaxt="n", ylab="Energy sub metering")
axis(side=1, at=c(0, 1450, 2900), labels=c("Thu", "Fri", "Sat"))
lines(feb_items$Sub_metering_2, type = "l", col="red")
lines(feb_items$Sub_metering_3, type="l", col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c('black', 'red', 'blue'))


plot(feb_items$Global_reactive_power, type = "l", xaxt="n", xlab = "datetime", ylab="Global_reactive_power")
axis(side=1, at=c(0, 1450, 2900), labels=c("Thu", "Fri", "Sat"))


dev.off()