## Exploratory Data Analysis Project #1 -- Plot 4
## This script uses household power consumption data.  The data set is too large 
## for my systems to load and so I reduced the size by loading it into Excel, 
## eliminating all but the required data, and saving this data as a .csv file.  Thus
## the script begins by loading the .csv file. 
##
## THIS IS THE CODE FOR PLOT4:
## Plot4.R and the corresponding plot4.png are shown.  Plot4 is a combination of 4 charts including
## the plot2 line chart of the Global Active Power, plot3 line chart of the Energy sub-metering and
## two new charts, Voltage and Global Inactive Power.

plot4 <- function(){
  
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
  
  par(mfrow = c(2,2))  ## put 4 graphics on the device
  par(mar = c(4.5, 7, .5, .5)) ## play around with the margins
  
  ## create 4 plots
    
  plot(consumption$DateTime, consumption$Global_active_power, type = "n", ylab = "Global Active Power", xlab = "")
  
  lines(consumption$DateTime, consumption$Global_active_power)
  
  plot(consumption$DateTime, consumption$Voltage, type = "n", ylab = "Voltage", xlab = "datetime")
  
  lines(consumption$DateTime, consumption$Voltage)
  
  plot(consumption$DateTime, consumption$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
  
  lines(consumption$DateTime, consumption$Sub_metering_1, col = "black")
  lines(consumption$DateTime, consumption$Sub_metering_2, col = "red")
  lines(consumption$DateTime, consumption$Sub_metering_3, col = "blue")
  
  legend("topright", bty = "n", lty = 1, yjust = 0, xjust = 1, x.intersp = 0, adj = c(0, 0), y.intersp = .4, cex = .8, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(consumption$DateTime, consumption$Global_reactive_power, type = "n", ylab = "Global_reactive_power", xlab = "datetime")
  
  lines(consumption$DateTime, consumption$Global_reactive_power)
  
  dev.copy(png, file = "./data/plot4.png", width = 480, height = 480, units = "px", pointsize = 8, bg = "transparent") ## copy my plot to a PNG file
  dev.off()   ## Close the PNG device
  
  #  png(filename = "./data/plot4.png", width = 480, height = 480, units = "px", pointsize = 8, bg = "transparent") ## copy my plot to a PNG file
}
