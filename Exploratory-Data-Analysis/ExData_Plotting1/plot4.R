## Coursera : DataScience Specialization
## Course   : Exploratory Data Analysis
## Activity : Peer Assessments /Course Project 1
## File     : Plot 4
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
png("plot4.png")


# Plotting layout (2 rows x 2 columns)
par(mfrow= c(2,2), mar=c(4,4,2,1))

# Plot: Row 1 - Column 1
plot(data_2007$DateTime, data_2007$Global_active_power,pch=".",xlab="",ylab="Global Active Power (kilowatts)", main="")
lines(data_2007$DateTime, data_2007$Global_active_power)

# Plot: Row 1 - Column 2
plot(data_2007$DateTime,data_2007$Voltage, pch=".",xlab="datetime", ylab="Voltage", main="")
lines(data_2007$DateTime,data_2007$Voltage)

# Plot: Row 2 - Column 1
plot(data_2007$DateTime, data_2007$Sub_metering_1, pch=".",xlab="",ylab="Energy sub metering", main="")
lines(data_2007$DateTime, data_2007$Sub_metering_1,col="black")
lines(data_2007$DateTime, data_2007$Sub_metering_2,col="blue")
lines(data_2007$DateTime, data_2007$Sub_metering_3,col="red")

# Plot: Row 2 - Column 2
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),lwd=c(2,2,2),col=c( "black", "blue", "red"),bty="n")
plot(data_2007$DateTime, data_2007$Global_reactive_power,pch=".",xlab="",main="")
lines(data_2007$DateTime, data_2007$Global_reactive_power)

dev.off()





