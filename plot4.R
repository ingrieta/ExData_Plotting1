#Multiple base plots with mfrow
par(mfrow=c(2,2),mar =c(4,4,1,1))
with(df2,{
  plot(Global_active_power~dateTime, type ="l",xlab="",ylab="Global Active Power KW")
  plot(Voltage~dateTime,type="l",xlab="",ylab = "Voltage Volt")
  
  {plot(Sub_metering_1~dateTime,type="l",xlab="",ylab = "Global Active Power")
    lines(Sub_metering_2~dateTime,col='Red')
    lines(Sub_metering_3~dateTime,col='Blue')
    legend("topright",pch=1,col=c("Black","Red","Blue"),
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  }
  plot(Global_reactive_power~dateTime, type = "l",xlab= "",ylab= "Global Reactive Power")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()