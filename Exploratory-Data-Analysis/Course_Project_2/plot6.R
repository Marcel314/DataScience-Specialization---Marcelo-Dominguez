## Coursera : DataScience Specialization
## Course   : Exploratory Data Analysis
## Activity : Peer Assessments / Course Project 2
## File     : Plot 6
## Author   : Marcelo Dominguez

## Question (6)
## "Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle 
## sources in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?"

# 1. Setup environment
setwd("./")
library(ggplot2)
source("donwload_dataset.R")

# 2. 
# Read dataset - this first line will likely take a few seconds.
# 'PM2.5 Emissions Data file' & # 'Source Classification Code Table'
in_data_emission = readRDS("./in/summarySCC_PM25.rds") 
in_data_codes = readRDS("./in/Source_Classification_Code.rds")

# 3. Subseting data: vehicles data
data_vehicles = grepl("vehicle", in_data_codes$SCC.Level.Two, ignore.case=TRUE)
data_vehicles_SCC = in_data_codes[data_vehicles,]$SCC
data_vehicles_NEI = in_data_emission[in_data_emission$SCC %in% data_vehicles_SCC,]

# 4. Subseting data: for city = "Baltimore City"
data_vehicles_baltimore = data_vehicles_NEI[data_vehicles_NEI$fips=="24510",]
data_vehicles_baltimore$city = "Baltimore City"

# 5. Subseting data: for city = "Los Angeles County"
data_vehicles_LA = data_vehicles_NEI[data_vehicles_NEI$fips=="06037",]
data_vehicles_LA$city = "Los Angeles County"

# 6. Creating data frame with dato from "Baltimore City" and "Las Angeles Country"
plot_6_data = rbind(data_vehicles_baltimore,data_vehicles_LA)

# 7. PNG Device configuration
png("./out/plot6.png",width=640,height=480,units="px",bg="transparent")

# 8. Plotting
plot6 = ggplot(plot_6_data,aes(x=factor(year), y=Emissions, fill=city)) 
plot6 = plot6 + geom_bar(aes(fill=year),stat="identity") 
plot6 = plot6 + guides(fill=FALSE) + theme_bw()  
plot6 = plot6 + xlab("year")  
plot6 = plot6 + ylab(expression('Total PM'[2.5]*" Emissions"))
plot6 = plot6 + ggtitle("Total Emissions from motor vehicle in Baltimore City vs Los Angeles (from 1999 to 2008)") 
plot6 = plot6 + facet_grid(scales="free", space="free", .~city) 


print(plot6)
dev.off()





