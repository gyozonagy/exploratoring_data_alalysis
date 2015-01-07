df <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)

df2007 <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")
df2007$Global_active_power <- as.character(df2007$Global_active_power)



df2007$gap <- as.numeric(df2007$Global_active_power)


df2007$datetime <- paste(df2007$Date, df2007$Time)
df2007$strpt <- strptime(df2007$datetime, format = "%d/%m/%Y %H:%M:%S")

plot(df2007$strpt,df2007$gap, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")

png(file="plot2.png")
plot(df2007$strpt,df2007$gap, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
