project <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")) 
project <- project[(project$Date == "1/2/2007") | (project$Date == "2/2/2007"),] 
write.csv(project, file="project1.csv") 
data<-read.csv("project1.csv") 
data$DateTime <- as.POSIXct(paste(data$Date, data$Time, sep=" "),format="%d/%m/%Y %H:%M:%S") 
png(filename="plot2.png", width=480, height=480) 
plot(data$DateTime,data$Global_active_power,type="l",col="black",xlab="", ylab="Global Active Power (kilowatts)") 
dev.off()