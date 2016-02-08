#Code for constructing the Plot 1
#Student: Mario Fonseca

#This code assumes that the file "household_power_consumption.txt" is in the working directory

#Load all the data to memory
rawData<-read.csv("household_power_consumption.txt",sep=";")
#Coerces the date column to a Date object
rawData$Date<-as.Date(rawData$Date,"%d/%m/%Y")
#Establish the initial date we will work with
myDate <-as.Date("2007-02-01")
#Filter the Data from 2007-02-01 to 2007-02-01
workingData<-rawData[(rawData$Date==myDate | rawData$Date==myDate+1),]
#Free some memory
remove("rawData")
#Replace "?" for NA in Numeric Values
workingData[,workingData[,3:9]=="?"]<-NA
#Coerce to numeric Values
workingData$Global_active_power<-as.numeric(workingData$Global_active_power)
#Plot the histogram to screen
par(mfrow = (1,1))
hist(workingData$Global_active_power/1000,main = "Global Active Power",col="red",xlab = "Global Active Power (kwatts)")
#Export to a png device
#Copy the graphic to another device with the specified size
dev.copy(png,file ="plot1.png",width = 480, height = 480, units = "px", pointsize = 12)
#Close the png device.
dev.off()
#End.

