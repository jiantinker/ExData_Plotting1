project <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")) 
project <- project[(project$Date == "1/2/2007") | (project$Date == "2/2/2007"),] 
write.csv(project, file="project1.csv") 
data<-read.csv("project1.csv")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time, sep=" "),format="%d/%m/%Y %H:%M:%S") 
png(filename="plot4.png", width=480, height=480) 
par(mfrow=c(2,2)) 
plot(data$DateTime,data$Global_active_power,type="l", col="black",xlab="", ylab="Global Active Power") 
 
plot(data$DateTime,data$Voltage,type="l",col="black",xlab="datetime",ylab="Voltage") 

plot(data$DateTime,data$Sub_metering_1,type="l",col="black",xlab="", ylab="Energy sub metering") 
lines(data$DateTime, data$Sub_metering_2, col="red") 
lines(data$DateTime, data$Sub_metering_3, col="blue") 
cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright",lwd=0.5,lty=1,col = c("black", "red", "blue"),legend = cols,bty="n")

plot(data$DateTime,data$Global_reactive_power,type="l",col="black",xlab="datetime", ylab="Global_reactive_power",main="") 
dev.off() 