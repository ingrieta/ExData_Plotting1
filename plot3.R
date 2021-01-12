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