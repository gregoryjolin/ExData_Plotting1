##read in the data with variable names
mydata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
##subset the data to only the dates we want
subsetdata<-subset(mydata,Date=="1/2/2007"|Date=="2/2/2007")
##combine the Date and Time into one variable and convert it to a date format with strptime
datetime<-with(subsetdata,paste(Date,Time))
subsetdata$Date<-strptime(datetime,"%d/%m/%Y %H:%M:%S")
##convert all needed variables to numeric
subsetdata$Global_active_power=as.numeric(subsetdata$Global_active_power)
subsetdata$Sub_metering_1<-as.numeric(subsetdata$Sub_metering_1)
subsetdata$Sub_metering_2<-as.numeric(subsetdata$Sub_metering_2)
subsetdata$Sub_metering_3<-as.numeric(subsetdata$Sub_metering_3)
subsetdata$Voltage=as.numeric(subsetdata$Voltage)
subsetdata$Global_reactive_power=as.numeric(subsetdata$Global_reactive_power)
##make a 2 by 2 set of plots, adding new plots in column order
par(mfcol=c(2,2))
##add first plot, starting blank and then adding the line
with(subsetdata,plot(Date,Global_active_power,xlab="",ylab="Global Active Power",type="n"))
with(subsetdata,lines(Date,Global_active_power))
##add second plot, starting blank and then adding the lines
with(subsetdata,plot(Date,Sub_metering_1,xlab="",ylab="Energy sub metering",type="n"))
with(subsetdata,lines(Date,Sub_metering_1))
with(subsetdata,lines(Date,Sub_metering_2,col="red"))
with(subsetdata,lines(Date,Sub_metering_3,col="blue"))
##create the legend for the second plot without a border
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
##add third plot, starting blank and then adding the line
with(subsetdata,plot(Date,Voltage,xlab="datetime",type="n"))
with(subsetdata,lines(Date,Voltage))
##add fourth plot, starting blank and then adding the line
with(subsetdata,plot(Date,Global_reactive_power,xlab="datetime",type="n"))
with(subsetdata,lines(Date,Global_reactive_power))
##copy to a PNG file
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()