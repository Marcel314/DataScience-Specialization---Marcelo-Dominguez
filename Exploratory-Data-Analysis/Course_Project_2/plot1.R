## Coursera : DataScience Specialization
## Course   : Exploratory Data Analysis
## Activity : Peer Assessments / Course Project 2
## File     : Plot 1
## Author   : Marcelo Dominguez

## Question (1)
## "Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?"

# 1. Setup environment
setwd("./")
source("donwload_dataset.R")

# 2. 
# Read dataset - this first line will likely take a few seconds.
# 'PM2.5 Emissions Data file' & # 'Source Classification Code Table'
in_data_emission = readRDS("./in/summarySCC_PM25.rds") 
in_data_codes = readRDS("./in/Source_Classification_Code.rds")

# 3. Agregate by sum the total emissions by year
total_emissions_by_year <- aggregate(Emissions ~ year,in_data_emission, sum)

# 4. PNG Device configuration
png("./out/plot1.png",width=400,height=400,units="px",bg="transparent")

# 5. Plotting
barplot(
  (total_emissions_by_year$Emissions)/10^6,
  names.arg=total_emissions_by_year$year,
  col="blue",
  border=TRUE,
  xlab="Year",
  ylab="PM2.5 Emissions",
  main="Total PM2.5 Emissions From All US Sources",
)
dev.off()

