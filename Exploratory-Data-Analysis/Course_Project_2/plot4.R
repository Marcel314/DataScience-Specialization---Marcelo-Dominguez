## Coursera : DataScience Specialization
## Course   : Exploratory Data Analysis
## Activity : Peer Assessments / Course Project 2
## File     : Plot 4
## Author   : Marcelo Dominguez

## Question (4)
## "Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?"

# 1. Setup environment
setwd("./")
library(ggplot2)
source("donwload_dataset.R")

# 2. 
# Read dataset - this first line will likely take a few seconds.
# 'PM2.5 Emissions Data file' & # 'Source Classification Code Table'

in_data_emission = readRDS("./in/summarySCC_PM25.rds") 
in_data_codes = readRDS("./in/Source_Classification_Code.rds")

# 3. Subseting coal combustion related data
coal_related = grepl("coal", in_data_codes$SCC.Level.Four, ignore.case=TRUE) 
combustion_related = grepl("comb", in_data_codes$SCC.Level.One, ignore.case=TRUE)
coal_combustion = (combustion_related & coal_related)
combustion_SCC = in_data_codes[coal_combustion,]$SCC
combustion_data = in_data_emission[in_data_emission$SCC %in% combustion_SCC,]

# 4. PNG Device configuration
png("./out/plot4.png",width=480,height=480,units="px",bg="transparent")

# 5. Plotting
plot4 = ggplot(combustion_data,aes(factor(year),Emissions/10^5)) + geom_bar(stat="identity")
plot4 = plot4 + geom_line() + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions"))
plot4 = plot4 + ggtitle("Coal Combustion Source Emissions Across US from 1999-2008")

print(plot4)
dev.off()