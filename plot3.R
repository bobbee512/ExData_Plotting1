## Exploratory Data Analysis Project #1 -- Plot 3
## This script uses household power consumption data.  The data set is too large 
## for my systems to load and so I reduced the size by loading it into Excel, 
## eliminating all but the required data, and saving this data as a .csv file.  Thus
## the script begins by loading the .csv file. 
##
## THIS IS THE CODE FOR PLOT2:
## Plot1.R and the corresponding plot2.png are shown.  Plot2 is a line chart of the global Active Power 
## over two days (2007-02-02 and 2007-02-02) 

plot3 <- function(){
  
  ## set the working directory for R script and project data
  
  setwd("C:\\Users\\Owner\\Dropbox\\Coursera Data Science Specialization\\Exploratory Data Analysis\\Data\\")  
  
  ## put all output in subdirectory named "data"
  
  ## Check to see if a directory named "data" exists and
  ## if it does not exist, create it.
  
  if (!file.exists("data")) {
    dir.create("data")
  }
  
  ##consumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
  
  consumption <- read.csv("Project_1_data.csv", header = TRUE)  
  
  consumption$DateTime <- paste(consumption$Date, consumption$Time)
  consumption$DateTime <- strptime(consumption$DateTime, format = "%m/%d/%Y %H:%M:%S")
  
  par(mfrow = c(1,1))  ## put one graphic on the device
  par(mar = c(4, 4.5, 1, 3.1)) ## play around with the margins
  
  ## Create line chart and label it
  
  plot(consumption$DateTime, consumption$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
    
  lines(consumption$DateTime, consumption$Sub_metering_1, col = "black")
  lines(consumption$DateTime, consumption$Sub_metering_2, col = "red")
  lines(consumption$DateTime, consumption$Sub_metering_3, col = "blue")
  
  legend("topright", lty = 1, yjust = .1, xjust = 0, x.intersp - 1, adj = c(0, 0.5), y.intersp = .8, cex = .9, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  dev.copy(png, file = "./data/plot3A.png", width = 480, height = 480, units = "px", pointsize = 10, bg = "transparent") ## copy my plot to a PNG file
  dev.off()   ## Close the PNG device
  
#  png(filename = "./data/plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "transparent") ## copy my plot to a PNG file
}
