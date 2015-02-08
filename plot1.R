project <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")) 
project <- project[(project$Date == "1/2/2007") | (project$Date == "2/2/2007"),] 
write.csv(project, file="project1.csv") 
data<-read.csv("project1.csv") 
data$Date <- as.Date(data$Date, format="%d/%m/%y") 
data$Time <- strptime(data$Time, format="%H:%M:%S") 
png(filename="plot1.png", width=480, height=480) 
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power") 
dev.off() 