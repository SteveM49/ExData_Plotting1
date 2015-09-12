setwd("F:/Users/Athena/My Documents/DataAnalysis Coursea/4 - Exploratory Data Analysis/Data")
hpc <- read.csv("hpc.csv")

# Plot 3 - overlay sub_metering_1 _2 _3 in black red and blue, add legend
png(filename="plot3.png")
plot(hpc$datetime, hpc$Sub_metering_1, type = 'o', xlab = '', ylab = 'Energy sub metering', 
     ylim = c(0, max(hpc$Sub_metering_1,hpc$Sub_metering_2,hpc$Sub_metering_3)))
lines(hpc$datetime, hpc$Sub_metering_2, type = 'o' , col = 'red')
lines(hpc$datetime, hpc$Sub_metering_3, type = 'o' , col = 'blue')
legend("topright", legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
       lty=c(1,1,1), lwd=c(2,2,2), col = c('black','red','blue'))
dev.off()

