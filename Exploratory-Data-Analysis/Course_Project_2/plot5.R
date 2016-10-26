## Coursera : DataScience Specialization
## Course   : Exploratory Data Analysis
## Activity : Peer Assessments / Course Project 2
## File     : Plot 5
## Author   : Marcelo Dominguez

## Question (5)
## "How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?"

# 1. Setup environment
setwd("./")
library(ggplot2)
source("donwload_dataset.R")

# 2. 
# Read dataset - this first line will likely take a few seconds.
# 'PM2.5 Emissions Data file' & # 'Source Classification Code Table'

in_data_emission = readRDS("./in/summarySCC_PM25.rds") 
in_data_codes = readRDS("./in/Source_Classification_Code.rds")

# 3. Subseting data
baltimore_MV = subset(in_data_emission, fips == "24510" & type=="ON-ROAD")
aggregated_data = aggregate(Emissions ~ year, baltimore_MV, sum)

# 4. PNG Device configuration
png("./out/plot5.png",width=480,height=480,units="px",bg="transparent")

# 5. Plotting
plot5 = ggplot(aggregated_data,aes(factor(year),Emissions)) + geom_bar(stat="identity")
plot5 = plot5 + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions"))
plot5 = plot5 + ggtitle("Motor Vehicle Source Emissions in Baltimore City from 1999-2008")

print(plot5)
dev.off()