#Code for constructing the Plot 2
#Student: Mario Fonseca

#This code assumes that the file "household_power_consumption.txt" is in the working directory

#Load all the data to memory
#rawData<-read.csv("household_power_consumption.txt",sep=";")
rawData<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Coerces the date column Time to a Date Time object into the Time variable
rawData$Time<-strptime(paste(rawData$Date,rawData$Time),"%d/%m/%Y %H:%M:%S")
#Establish the initial date we will work with
myDateT1 <-strptime("01/02/2007 00:00:00","%d/%m/%Y %H:%M:%S")
#Establish the final date we will work with
myDateT2 <-strptime("02/02/2007 23:59:59","%d/%m/%Y %H:%M:%S")
#Filter the Data from 2007-02-01 to 2007-02-01 and get rid of $Date variable
workingData<-rawData[(rawData$Time>=myDateT1 & rawData$Time<=myDateT2),2:9]
#Free some memory
remove("rawData")
#Replace "?" for NA in Numeric Values
workingData[,workingData[,2:8]=="?"]<-NA
#Coerce to numeric Values
workingData$Global_active_power<-as.numeric(workingData$Global_active_power)
#Plot the Time series to screen
par(mfrow = c(1,1))
#Filter Nas
noNas<-!is.na(workingData$Global_active_power)
plot(workingData$Time[noNas],workingData$Global_active_power[noNas], xlab = "", ylab= "Global Active Power (kilowatts)", type="l")
#Export to a png device
#Copy the graphic to another device with the specified size
dev.copy(png,file ="plot2.png",width = 480, height = 480, units = "px", pointsize = 12)
#Close the png device.
dev.off()
#End.
