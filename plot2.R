#line Chart
#Global active variable independiente ~ datetime variable dependiente
plot(df2$Global_active_power~df2$dateTime, type = "l",
     ylab = "Global Active Poer(KW)", xlab= "")
dev.copy(png,file="plot2.png",height=480, width=480)
dev.off()