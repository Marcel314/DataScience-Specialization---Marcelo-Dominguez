#If the unzipped file does not exist, download and unzip it
if (!file.exists("househhold_power_consumption.txt")) {
  #download zip file
  url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, destfile="householdpoweruse.zip")
  downloadDate<-date()
  
  #unzip file
  unzip("householdpoweruse.zip") #unzips to "household_power_consumption.txt"
} 