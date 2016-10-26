## Coursera : DataScience Specialization
## Course   : Exploratory Data Analysis
## Activity : Peer Assessments / Course Project 2
## File     : Plot 3
## Author   : Marcelo Dominguez

## Question (3)
## "Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008?"

# 1. Setup environment
setwd("./")
library(ggplot2)
source("donwload_dataset.R")

# 2. 
# Read dataset - this first line will likely take a few seconds.
# 'PM2.5 Emissions Data file' & # 'Source Classification Code Table'

in_data_emission = readRDS("./in/summarySCC_PM25.rds") 
in_data_codes = readRDS("./in/Source_Classification_Code.rds")

# 3. Subseting data (Baltimore)
in_data_emission_subset = in_data_emission[in_data_emission$fips == "24510", ] 

# 4. Agregate data
total_emissions_baltimore_with_type =  aggregate(Emissions ~ year + type, in_data_emission_subset,sum)

# 5. PNG Device configuration
png("./out/plot3.png",width=480,height=480,units="px",bg="transparent")

# 6. Plotting
plot3 = ggplot(total_emissions_baltimore_with_type, aes(year, Emissions, color = type))
plot3 = plot3 + geom_line() + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions"))
plot3 = plot3 + ggtitle('Total Emissions in Baltimore City by Source Type')

print(plot3)
dev.off()