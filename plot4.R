#########################
# generating plot4.png  #
#########################

df <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)
df2007 <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")


df2007$Global_active_power <- as.character(df2007$Global_active_power)
df2007$Global_reactive_power <- as.character(df2007$Global_reactive_power)
df2007$Voltage <- as.character(df2007$Voltage)

df2007$Sub_metering_1 <- as.character(df2007$Sub_metering_1)
df2007$Sub_metering_2 <- as.character(df2007$Sub_metering_2)
df2007$Sub_metering_3 <- as.character(df2007$Sub_metering_3)

df2007$gap <- as.numeric(df2007$Global_active_power)
df2007$grp <- as.numeric(df2007$Global_reactive_power)
df2007$volt <- as.numeric(df2007$Voltage)
df2007$sub_m_1 <- as.numeric(df2007$Sub_metering_1)
df2007$sub_m_2 <- as.numeric(df2007$Sub_metering_2)
df2007$sub_m_3 <- as.numeric(df2007$Sub_metering_3)

df2007$datetime <- paste(df2007$Date, df2007$Time)
df2007$strpt <- strptime(df2007$datetime, format = "%d/%m/%Y %H:%M:%S")

#  actual plotting starts here  #
par(mfrow=c(2,2))
plot(df2007$strpt,df2007$gap, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")
plot(df2007$strpt,df2007$volt, type = "l", ylab = "Voltage", xlab = "datetime")
plot(df2007$strpt,df2007$sub_m_1, type = "n",xlab = "", ylab = "Energy sub metering")
lines(df2007$strpt,df2007$sub_m_1)
lines(df2007$strpt,df2007$sub_m_2,col="red")
lines(df2007$strpt,df2007$sub_m_3,col="blue")
legend("topright",lwd=2, col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(df2007$strpt,df2007$grp, type = "l", ylab = "Global Reactive Power" ,xlab = "datetime")


## plotting to png file ##

png(file="plot4.png")
par(mfrow=c(2,2))
plot(df2007$strpt,df2007$gap, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")
plot(df2007$strpt,df2007$volt, type = "l", ylab = "Voltage", xlab = "datetime")
plot(df2007$strpt,df2007$sub_m_1, type = "n",xlab = "", ylab = "Energy sub metering")
lines(df2007$strpt,df2007$sub_m_1)
lines(df2007$strpt,df2007$sub_m_2,col="red")
lines(df2007$strpt,df2007$sub_m_3,col="blue")
legend("topright",lwd=2, col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(df2007$strpt,df2007$grp, type = "l", ylab = "Global Reactive Power" ,xlab = "datetime")

dev.off()










