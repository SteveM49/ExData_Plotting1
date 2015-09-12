# Introduction
# 
# This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets.
# In particular, we will be using the “Individual household electric power consumption Data Set” which I have made available 
# on the course web site:
#         
#         Dataset: Electric power consumption [20Mb]
# 
# Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of 
# almost 4 years. Different electrical quantities and some sub-metering values are available.
# 
# The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
#         
#         Date: Date in format dd/mm/yyyy
# Time: time in format hh:mm:ss
# Global_active_power: household global minute-averaged active power (in kilowatt)
# Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# Voltage: minute-averaged voltage (in volt)
# Global_intensity: household global minute-averaged current intensity (in ampere)
# Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). 
# It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). 
# It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). 
# It corresponds to an electric water-heater and an air-conditioner.
# Loading the data
# 
# When loading the dataset into R, please consider the following:
#         
# The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate of how much memory the 
# dataset will require in memory before reading into R. Make sure your computer has enough memory 
# (most modern computers should be fine).
# 
# We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from 
# just those dates rather than reading in the entire dataset and subsetting to those dates.
# 
# You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() 
# functions.
# 
# Note that in this dataset missing values are coded as ?.
# 
# Making Plots
# 
# Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. 
#Your task is to reconstruct the following plots below, all of which were constructed using the base plotting system.
# 
# First you will need to fork and clone the following GitHub repository: https://github.com/rdpeng/ExData_Plotting1
# 
# For each plot you should
# 
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
# 
# Name each of the plot files as plot1.png, plot2.png, etc.
# 
# Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, 
# i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data 
# so that the plot can be fully reproduced. You must also include the code that creates the PNG file.
# Add the PNG file and R code file to the top-level folder of your git repository (no need for separate sub-folders)
# When you are finished7with the assignment, push your git repository to GitHub so that the GitHub version of your 
# repository is up to date. There should be four PNG files and four R code files, a total of eight files in the top-level folder of the repo.
# 
# The four plots that you will need to construct are shown below.

# Code follows



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
rm(large,small)

# Now plot the graphs on the screen so I can tweak them

# Plot 1
hist(hpc$Global_active_power,breaks=16, main = 'Global Active Power', col = 'red')

# Plot 2
plot(hpc$datetime, hpc$Global_active_power, type='l', xlab = '', ylab = 'Global Active Power (kilowatts)', 
     main = 'Global Active Power (kilowatts)')

# Plot 3 - overlay sub_metering_1 _2 _3 in black red and blue, add legend
plot(hpc$datetime, hpc$Sub_metering_1, type = 'o', xlab = '', ylab = 'Energy sub metering', 
        ylim = c(0, max(hpc$Sub_metering_1,hpc$Sub_metering_2,hpc$Sub_metering_3)))
lines(hpc$datetime, hpc$Sub_metering_2, type = 'o' , col = 'red')
lines(hpc$datetime, hpc$Sub_metering_3, type = 'o' , col = 'blue')
legend("topright", legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
       lty=c(1,1,1), lwd=c(2,2,2), col = c('black','red','blue'))

# Plot 4 - going down the (2,2) cols - plot 2, plot 3, like 2 with voltage, like 2 with global_reactive_power
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
     
# now make png files with the four plots

# Plot 1
png(filename="plot1.png")
hist(hpc$Global_active_power,breaks=16, main = 'Global Active Power', col = 'red')
dev.off()

# Plot 2
png(filename="plot2.png")
plot(hpc$datetime, hpc$Global_active_power, type='l', xlab = '', ylab = 'Global Active Power (kilowatts)', 
     main = 'Global Active Power (kilowatts)')
dev.off()

# Plot 3 - overlay sub_metering_1 _2 _3 in black red and blue, add legend
png(filename="plot3.png")
plot(hpc$datetime, hpc$Sub_metering_1, type = 'o', xlab = '', ylab = 'Energy sub metering', 
     ylim = c(0, max(hpc$Sub_metering_1,hpc$Sub_metering_2,hpc$Sub_metering_3)))
lines(hpc$datetime, hpc$Sub_metering_2, type = 'o' , col = 'red')
lines(hpc$datetime, hpc$Sub_metering_3, type = 'o' , col = 'blue')
legend("topright", legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
       lty=c(1,1,1), lwd=c(2,2,2), col = c('black','red','blue'))
dev.off()

# Plot 4 - going down the (2,2) cols - plot 2, plot 3, like 2 with voltage, like 2 with global_reactive_power
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




# Reviewing the Assignments
# 
# Keep in mind this course is about exploratory graphs, understanding the data, and developing strategies. 
# Here's a good quote from a swirl lesson about exploratory graphs: 
# "They help us find patterns in data and understand its properties. They suggest modeling strategies and help 
# to debug analyses. We DON'T use exploratory graphs to communicate results."
# 
# The rubrics should always be interpreted in that context.
# 
# As you do your evaluation, please keep an open mind and focus on the positive. The goal is not to deduct points 
# over small deviations from the requirements or for legitimate differences in implementation styles, etc. 
# Look for ways to give points when it's clear that the submitter has given a good faith effort to do the project, 
# and when it's likely that they've succeeded. Most importantly, it's okay if a person did something differently from 
# the way that you did it. The point is not to see if someone managed to match your way of doing things, but to see if 
# someone objectively accomplished the task at hand.
# 
# To that end, keep the following things in mind:
# 
# DO
# 
# Review the source code.
# Keep an open mind and focus on the positive.≤/li>
# When in doubt, err on the side of giving too many points, rather than giving too few.
# Ask yourself if a plot might answer a question for the person who created it.
# Remember that not everyone has the same statistical background and knowledge.
# DON'T:
# 
# Deduct just because you disagree with someone's statistical methods.
# Deduct just because you disagree with someone's plotting methods.
# Deduct based on aesthetics.
# Please submit the URL pointing to your GitHub repository containing the completed R code for this assignment.
# BI Link<code>MathPreviewEdit: Rich
# 
# Evaluation/feedback on the above work
# 
# Note: this section can only be filled out during the evaluation phase.
# Was a valid GitHub URL containing a git repository submitted? 
# 
# 0 points: A valid GitHub URL was NOT submitted (or URL is broken) 
# 1 point: The submitted URL points to a GitHub repository 
# 
# Does the GitHub repository contain at least one commit beyond the original fork? 
# 
# 0 points: No, there are no commits beyond the original fork 
# 1 point: Yes, there is at least one commit beyond the original fork 
# 
# Overall evaluation/feedback
# 
# Note: this section can only be filled out during the evaluation phase.
# Please examine the plot files in the GitHub repository. Do the plot files appear to be of the correct 
# graphics file format?
# 
# 0 points: No, at least one of the files appears to be in the wrong format 
# 1 point: Yes, all of the files appear to be in the correct format
# 
# Please view the image file for Plot 1 from the GitHub repository. Does the plot appear correct?
# 
# 0 points: No, the plot appears incorrect in at least 1 major discrepancy from the reference plot 
# (e.g. wrong data), or at least 2 minor discrepancies (e.g. x-label is incorrect, title is incorrect),  
# or the plot was not viewable
# 1 point: The plot is mostly correct with at most one minor discrepancy from the reference plot
# 
# Please evaluate the code for Plot 1, but do not run the code on your computer. 
# Does the code appear to create the plot reference plot given in the assignment?
# 
# 0 points: The code does not create the reference plot, or is not viewable/present in repository
# 1 point: The code is mostly correct, but does not reproduce the reference plot exactly
# 2 points: The code reproduces the reference plot exactly
# 
# Please view the image file for Plot 2 from the GitHub repository. Does the plot appear correct?
# 
# 0 points: No, the plot appears incorrect in at least 1 major discrepancy from the reference plot (e.g. wrong data), or at least 2 minor discrepancies (e.g. x-label is incorrect, title is incorrect),  or the plot was not viewable
# 1 point: The plot is mostly correct with at most one minor discrepancy from the reference plot
# 
# Please evaluate the code for Plot 2, but do not run the code on your computer. Does the code appear to create the 
# plot reference plot given in the assignment?
# 
# 0 points: The code does not create the reference plot, or is not viewable/present in repository
# 1 point: The code is mostly correct, but does not reproduce the reference plot exactly
# 2 points: The code reproduces the reference plot exactly
# 
# Please view the image file for Plot 3 from the GitHub repository. Does the plot appear correct?
# 
# 0 points: No, the plot appears incorrect in at least 1 major discrepancy from the reference plot (e.g. wrong data), 
# or at least 2 minor discrepancies (e.g. x-label is incorrect, title is incorrect),  or the plot was not viewable
# 1 point: The plot is mostly correct with at most one minor discrepancy from the reference plot
# 
# Please evaluate the code for Plot 3, but do not run the code on your computer. Does the code appear to create the 
# plot reference plot given in the assignment?
# 
# 0 points: The code does not create the reference plot, or is not viewable/present in repository
# 1 point: The code is mostly correct, but does not reproduce the reference plot exactly
# 2 points: The code reproduces the reference plot exactly
# 
# Please view the image file for Plot 4 from the GitHub repository. Does the plot appear correct?
# 
# 0 points: No, the plot appears incorrect in at least 1 major discrepancy from the reference plot (e.g. wrong data), 
# or at least 2 minor discrepancies (e.g. x-label is incorrect, title is incorrect),  or the plot was not viewable
# 1 point: The plot is mostly correct with at most one minor discrepancy from the reference plot
# 
# Please evaluate the code for Plot 4, but do not run the code on your computer. Does the code appear to create the plot 
# reference plot given in the assignment?
# 
# 0 points: The code does not create the reference plot, or is not viewable/present in repository
# 1 point: The code is mostly correct, but does not reproduce the reference plot exactly
# 2 points: The code reproduces the reference plot exactly
# 
# Please use the space below to provide constructive feedback to the student who submitted the work. Point out the submission's strengths as well as areas in need of improvement. You may also use this space to explain your grading decisions.
# 
# You've written 0 words


