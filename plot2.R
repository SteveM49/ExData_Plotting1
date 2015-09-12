setwd("F:/Users/Athena/My Documents/DataAnalysis Coursea/4 - Exploratory Data Analysis/Data")
hpc <- read.csv("hpc.csv")

# Plot 2
hpc <- read.csv("hpc.csv")
png(filename="plot2.png")
plot(hpc$datetime, hpc$Global_active_power, type='l', xlab = '', ylab = 'Global Active Power (kilowatts)', 
     main = 'Global Active Power (kilowatts)')
dev.off()
