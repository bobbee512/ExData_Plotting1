## Exploratory Data Analysis Project #1 -- Plot 2
## This script uses household power consumption data.  The data set is too large 
## for my systems to load and so I reduced the size by loading it into Excel, 
## eliminating all but the required data, and saving this data as a .csv file.  Thus
## the script begins by loading the .csv file. 
##
## THIS IS THE CODE FOR PLOT2:
## Plot1.R and the corresponding plot2.png are shown.  Plot2 is a line chart of the global Active Power 
## over two days (2007-02-02 and 2007-02-02) 

plot2 <- function(){
  
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
  
  ## Create combined date/time field for x axis
  
  consumption$DateTime <- paste(consumption$Date, consumption$Time)
  consumption$DateTime <- strptime(consumption$DateTime, format = "%m/%d/%Y %H:%M:%S")

  ##  head(consumption)
  
  ##  par(mfrow = c(1,1))  ## put one graphic on the device
  ##  par(mar = c(4, 4, 1, 2)) ## play around with the margins
  
  ## Create line chart and label it
  
  plot(consumption$DateTime, consumption$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
  
  lines(consumption$DateTime, consumption$Global_active_power)

  dev.copy(png, file = "./data/plot2.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "transparent")  ## copy my plot to a PNG file
  
  dev.off()   ## Close the PNG device
  
}
