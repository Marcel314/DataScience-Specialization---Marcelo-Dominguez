## Coursera : DataScience Specialization
## Course   : Exploratory Data Analysis
## Activity : Peer Assessments /Course Project 1
## File     : Plot 1
## Author   : Marcelo Dominguez

# Setup environment
#setwd("./ExData_Plotting1")
setwd("./")
input_file = "household_power_consumption.txt"

# Read input data
data = read.table(file=input_file,header=TRUE, na.strings = "?",dec = ".",sep=";",
                  colClasses = c(rep("character",2), rep("numeric",7)))

# Subset readed data
data_2007 = data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Create a new column
data_2007$DateTime = strptime(paste(data_2007$Date,data_2007$Time),"%d/%m/%Y %H:%M:%S")

# PNG device
png("plot1.png")

# Plotting
hist(data_2007$Global_active_power,col="red", xlab="Global Active Power(kilowatts)",
     ylab="Frequency", main="Global Active Power")
dev.off()



