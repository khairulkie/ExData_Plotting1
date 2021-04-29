df1<-read.csv('./exdata_data_household_power_consumption/household_power_consumption.txt',sep = ";")

df1<-df1[(as.Date(df1$Date,format = '%d/%m/%Y')>=as.Date("01/02/2007",format = '%d/%m/%Y'))&
           (as.Date(df1$Date,format = '%d/%m/%Y')<=as.Date("02/02/2007",format = '%d/%m/%Y')),]

df2<-df1
df2$DateTime<-paste(df2$Date,df2$Time)

df2$DateTime<-strptime(df2$DateTime,format = "%d/%m/%Y %H:%M:%S")

png(file="plot2.png")
with(df2,plot(DateTime,Global_active_power,type="n",ylab = "Global Active Power (kilowatts)"))
with(df2,lines(DateTime,Global_active_power,type="l"))
dev.off()
