setwd("~/JHU Data Science/EDA/Project 1/")
power_data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = "character")
feb_items<-subset(power_data, power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007")


feb_items$Date<-as.Date(feb_items$Date, format="%d/%m/%Y")
feb_items$Time<-strptime(feb_items$Time, format = "%H:%M:%S")
feb_items$Global_active_power<-as.numeric(feb_items$Global_active_power)
feb_items$Global_reactive_power<-as.numeric(feb_items$Global_reactive_power)
feb_items$Voltage<-as.numeric(feb_items$Voltage)
feb_items$Global_intensity<-as.numeric(feb_items$Global_intensity)

library(datasets)
png(file="plot2.png",width=480,height=480)
plot(feb_items$Global_active_power, type = "l", xaxt="n", xlab = "", ylab="Global Active Power (kilowatts)")
axis(side=1, at=c(0, 1450, 2900), labels=c("Thu", "Fri", "Sat"))
dev.off()
