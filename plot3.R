##read in the data with variable names
mydata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
##subset the data to only the dates we want
subsetdata<-subset(mydata,Date=="1/2/2007"|Date=="2/2/2007")
##combine the Date and Time into one variable and convert it to a date format with strptime
datetime<-with(subsetdata,paste(Date,Time))
subsetdata$Date<-strptime(datetime,"%d/%m/%Y %H:%M:%S")
##convert the Sub_metering variables to numeric
subsetdata$Sub_metering_1<-as.numeric(subsetdata$Sub_metering_1)
subsetdata$Sub_metering_2<-as.numeric(subsetdata$Sub_metering_2)
subsetdata$Sub_metering_3<-as.numeric(subsetdata$Sub_metering_3)
##create a blank plot with the appropriate labels
with(subsetdata,plot(Date,Sub_metering_1,xlab="",ylab="Energy sub metering",type="n"))
##add the 3 lines to the plots with different colors
with(subsetdata,lines(Date,Sub_metering_1))
with(subsetdata,lines(Date,Sub_metering_2,col="red"))
with(subsetdata,lines(Date,Sub_metering_3,col="blue"))
##add the legend to the plot
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##copy to a PNG file
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()