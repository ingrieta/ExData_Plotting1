df<-read.table(file = "household_power_consumption.txt",header = TRUE,sep = ";",
               na.strings = "?", #   missed values coded as ?
               stringsAsFactors = FALSE,colClasses = c("character","character",
                                                       "numeric",
                                                       "numeric","numeric",
                                                       "numeric","numeric",
                                                       "numeric","numeric"))
df$Date<-as.Date(df$Date,"%d/%m/%Y")

library(dplyr)
df2<- filter(df,Date >= as.Date("2007-2-1") & Date <=  as.Date("2007-2-2"))

#Dar formato de dia y hora

dateTime <- paste(df2$Date, df2$Time)
dateTime <- setNames(dateTime, "DateTime")
df2$dateTime<-dateTime 
df2$dateTime<-as.POSIXct(dateTime)
df2$day<-format(df2$Date,"%a") 





#linechart with 3 subsets

with(df2,{
  plot(Sub_metering_1~dateTime,type="l",xlab="",ylab = "Global Active Power")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
  legend("topright",pch=1,col=c("Black","Red","Blue"),
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.copy(png,file="plot3.png",height=480, width=480)
dev.off()