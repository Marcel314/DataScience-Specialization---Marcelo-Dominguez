## Coursera : DataScience Specialization
## Course   : Exploratory Data Analysis
## Activity : Peer Assessments /Course Project 1
## File     : Plot 3
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

# Convert to POSIX
data_2007$DateTime = as.POSIXct(data_2007$DateTime)

# PNG device
png("plot3.png")

# Plotting
plot(data_2007$DateTime, data_2007$Sub_metering_1, pch=".",xlab="",
     ylab="Energy sub metering", main="")
lines(data_2007$DateTime, data_2007$Sub_metering_1,col="black")
lines(data_2007$DateTime, data_2007$Sub_metering_2,col="blue")
lines(data_2007$DateTime, data_2007$Sub_metering_3,col="red")

#Add legend
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),   
       lwd=c(2,2,2),col=c( "black", "blue", "red"),bty="n") 
dev.off()