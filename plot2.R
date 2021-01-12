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



#line Chart
#Global active variable independiente ~ datetime variable dependiente
plot(df2$Global_active_power~df2$dateTime, type = "l",
     ylab = "Global Active Poer(KW)", xlab= "")
dev.copy(png,file="plot2.png",height=480, width=480)
dev.off()