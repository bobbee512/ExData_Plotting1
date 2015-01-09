## Exploratory Data Analysis Project #1 -- Plot 1
## This script uses household power consumption data.  The data set is too large 
## for my systems to load and so I reduced the size by loading it into Excel, 
## eliminating all but the required data, and saving this data as a .csv file.  Thus
## the script begins by loading the .csv file. 
##
## THIS IS THE CODE FOR PLOT1:
## EDA_Project_1_Plot1.R and the corresponding plot1.png are shown.  Plot1 is a histogram of the Global Active Power. 

  plot1 <- function(){
  
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
  
  par(mfrow = c(1,1))  ## put one graphic on the device
  par(mar = c(4, 4, 1, 2)) ## play around with the margins

## Create histogram and label it
  
  hist(consumption$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
  
  dev.copy(png, file = "./data/plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "transparent")  ## copy my plot to a PNG file

  dev.off()   ## Close the PNG device
  
}
