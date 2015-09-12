setwd("F:/Users/Athena/My Documents/DataAnalysis Coursea/4 - Exploratory Data Analysis/Data")
hpc <- read.csv("hpc.csv")

# Plot 4 - going down the (2,2) cols - plot 2, plot 3, like 2 with voltage, like 2 with global_reactive_power
hpc <- read.csv("hpc.csv")
png(filename="plot4.png")
par(mfrow = c(2,2))
hist(hpc$Global_active_power,breaks=16, col = 'red',main='')

plot(hpc$datetime, hpc$Voltage, type='l', xlab = '', ylab = 'Voltage')

plot(hpc$datetime, hpc$Sub_metering_1, type = 'o', xlab = '', ylab = 'Energy sub metering', 
     ylim = c(0, max(hpc$Sub_metering_1, hpc$Sub_metering_2, hpc$Sub_metering_3)))
lines(hpc$datetime, hpc$Sub_metering_2, type = 'o' , col = 'red')
lines(hpc$datetime, hpc$Sub_metering_3, type = 'o' , col = 'blue')
legend("topright", legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
       lty=c(1,1,1), lwd=c(2,2,2), col = c('black','red','blue'))

plot(hpc$datetime, hpc$Global_reactive_power, type='l', xlab = '', ylab = 'Global Reactive Power')
dev.off()
