#Histograma con la frecuencia de la variable Global Active Power

hist(df2$Global_active_power,main = "Global Active Power",
     xlab = "Global Active Power (Kilowatts",col = "red")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()