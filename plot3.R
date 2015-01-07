#########################
# generating plot3.png  #
#########################

df <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)

df2007 <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

df2007$Sub_metering_1 <- as.character(df2007$Sub_metering_1)
df2007$Sub_metering_2 <- as.character(df2007$Sub_metering_2)
df2007$Sub_metering_3 <- as.character(df2007$Sub_metering_3)

df2007$sub_m_1 <- as.numeric(df2007$Sub_metering_1)
df2007$sub_m_2 <- as.numeric(df2007$Sub_metering_2)
df2007$sub_m_3 <- as.numeric(df2007$Sub_metering_3)

df2007$datetime <- paste(df2007$Date, df2007$Time)
df2007$strpt <- strptime(df2007$datetime, format = "%d/%m/%Y %H:%M:%S")


plot(df2007$strpt,df2007$sub_m_1, type = "n",xlab = "", ylab = "Energy sub metering")
lines(df2007$strpt,df2007$sub_m_1)
lines(df2007$strpt,df2007$sub_m_2,col="red")
lines(df2007$strpt,df2007$sub_m_3,col="blue")
legend("topright",lwd=2, col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


png(file="plot3.png")
plot(df2007$strpt,df2007$sub_m_1, type = "n",xlab = "", ylab = "Energy sub metering")
lines(df2007$strpt,df2007$sub_m_1)
lines(df2007$strpt,df2007$sub_m_2,col="red")
lines(df2007$strpt,df2007$sub_m_3,col="blue")
legend("topright",lwd=2, col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

