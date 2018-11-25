##read in the data with variable names
mydata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
##subset the data to only the dates we want
subsetdata<-subset(mydata,Date=="1/2/2007"|Date=="2/2/2007")
##combine the Date and Time into one variable and convert it to a date format with strptime
datetime<-with(subsetdata,paste(Date,Time))
subsetdata$Date<-strptime(datetime,"%d/%m/%Y %H:%M:%S")
##convert Global_active_power to numeric
subsetdata$Global_active_power=as.numeric(subsetdata$Global_active_power)
##create a blank plot with the appropriate labels
with(subsetdata,plot(Date,Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="n"))
##add the line between all the points
with(subsetdata,lines(Date,Global_active_power))
##copy to a PNG file
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()