#########################
# generating plot1.png  #
#########################

df <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)
df2007 <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

df2007$Global_active_power <- as.character(df2007$Global_active_power)
df2007$gap <- as.numeric(df2007$Global_active_power)

hist(df2007$gap, xlab = "Global Active Power (kilowatts)",main ="Global Active Power",col = "red")

png(file="plot1.png")
hist(df2007$gap, xlab = "Global Active Power (kilowatts)",main ="Global Active Power",col = "red")
dev.off()
