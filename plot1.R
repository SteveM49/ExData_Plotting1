setwd("F:/Users/Athena/My Documents/DataAnalysis Coursea/4 - Exploratory Data Analysis/Data")
hpc <- read.csv("hpc.csv")

# Plot 1
png(filename="plot1.png")
hist(hpc$Global_active_power,breaks=16, main = 'Global Active Power', col = 'red')
dev.off()
