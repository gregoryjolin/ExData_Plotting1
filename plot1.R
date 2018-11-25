##read in the data with variable names
mydata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
##subset the data to only the dates we want
subsetdata<-subset(mydata,Date=="1/2/2007"|Date=="2/2/2007")
##convert the Date variable to a date format with strptime
subsetdata$Date=strptime(subsetdata$Date,"%d/%m/%Y")
##convert Global_active_power to numeric
subsetdata$Global_active_power=as.numeric(subsetdata$Global_active_power)
##create the histogram with color red and appropriate labels
with(subsetdata,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
##copy to a PNG file
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()