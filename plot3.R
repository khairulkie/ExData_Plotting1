df1<-read.csv('./exdata_data_household_power_consumption/household_power_consumption.txt',sep = ";")

df1<-df1[(as.Date(df1$Date,format = '%d/%m/%Y')>=as.Date("01/02/2007",format = '%d/%m/%Y'))&
           (as.Date(df1$Date,format = '%d/%m/%Y')<=as.Date("02/02/2007",format = '%d/%m/%Y')),]

df2<-df1
df2$DateTime<-paste(df2$Date,df2$Time)

df2$DateTime<-strptime(df2$DateTime,format = "%d/%m/%Y %H:%M:%S")

png(file="plot3.png")
with(df2,plot(DateTime,Sub_metering_1,type="n",ylab = "Energy sub metering"))
with(df2,lines(DateTime,Sub_metering_1,type="l"))
with(df2,lines(DateTime,Sub_metering_2,type="l",col="red"))
with(df2,lines(DateTime,Sub_metering_3,type="l",col="blue"))
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1)
dev.off()
