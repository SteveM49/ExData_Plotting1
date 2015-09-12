setwd("F:/Users/Athena/My Documents/DataAnalysis Coursea/4 - Exploratory Data Analysis/Data")

large <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors = FALSE)
small <- large[large$Date=='1/2/2007' | large$Date == '2/2/2007',]
#install.packages('lubridate')
library(lubridate)
small$date <- dmy(small$Date)
small$time <- hms(small$Time)
# much futzing to get datetime is omitted
small$datetime <- ymd_hms(paste(as.character(small$date),small$Time))
names(small)
hpc <- small[,c(10:12,2:9)]

write.csv(hpc,"hpc.csv")
