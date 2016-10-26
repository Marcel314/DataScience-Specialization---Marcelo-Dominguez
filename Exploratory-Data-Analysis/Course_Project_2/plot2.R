## Coursera : DataScience Specialization
## Course   : Exploratory Data Analysis
## Activity : Peer Assessments / Course Project 2
## File     : Plot 2
## Author   : Marcelo Dominguez

## Question (2)
## "Have total emissions from PM2.5 decreased in the Baltimore City, 
## Maryland (fips == "24510") from 1999 to 2008?"

# 1. Setup environment
setwd("./")
source("donwload_dataset.R")

# 2. 
# Read dataset - this first line will likely take a few seconds.
# 'PM2.5 Emissions Data file' & # 'Source Classification Code Table'

in_data_emission = readRDS("./in/summarySCC_PM25.rds") 
in_data_codes = readRDS("./in/Source_Classification_Code.rds")

# 3. Subseting data
in_data_emission_subset = in_data_emission[in_data_emission$fips == "24510", ] 

# 4. Agregate data
total_emissions_baltimore =  aggregate(Emissions ~ year, in_data_emission_subset,sum)

# 5. PNG Device configuration
png("./out/plot2.png",width=450,height=450,units="px",bg="transparent")

# 6. Plotting
barplot(
  total_emissions_baltimore$Emissions,
  names.arg=total_emissions_baltimore$year,
  col="green",
  border=TRUE,
  xlab="Year",
  ylab="PM2.5 Emissions",
  main="Total Emissions in Baltimore City from 1999 to 2008",
)
dev.off()
