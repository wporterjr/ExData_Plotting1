## Coursera Exploratory Data Analysis Week 1 Project
## May 7, 2014
## Plot 1

setwd("~/Documents/Coursera/ExpDataAnalysis")

## Load in data frame
Df <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")

## Add a formatdate column in date format
Df$formatdate <- as.Date(Df$Date, "%d/%m/%Y")
head(Df$formatdate)
# [1] "2006-12-16" "2006-12-16" "2006-12-16" "2006-12-16" "2006-12-16" "2006-12-16"

## Define the dates of interest
targetDates <- as.Date(c("2/1/2007", "2/2/2007"), "%m/%d/%Y")
targetDates
# [1] "2007-02-01" "2007-02-02"

## Subset the dataframe with the dates of interest
targetDf <- subset(Df, formatdate %in% targetDates)
unique(targetDf$formatdate)
# [1] "2007-02-01" "2007-02-02"

## save the data frame in case we need it later
save(targetDf, file = "PlotData.RData")

## Save as PNG with dim 480 x 480

png("output/plot1.png", height = 480, width = 480)

hist(targetDf$Global_active_power, col="red",
     breaks = 12,
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()
