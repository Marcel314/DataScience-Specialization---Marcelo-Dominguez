
## Coursera : DataScience Specialization
## Course   : Exploratory Data Analysis
## Activity : Week-1 Testing
## Author   : Marcelo Dominguez


#
# 3. Exploratory Graphs
#
setwd("./")
pollution = read.csv(file = "Week_1/in/avgpm25.csv", colClasses=c("numeric","character","factor","numeric","numeric"))
dim(pollution)
head(pollution)

# Number of counties wiht pm25 > 12 ?
pollution$pm25[pollution$pm25 > 12.0]
length(as.list(pollution$pm25[pollution$pm25 > 12.0]))

# Simple summaries of data / one dimension
summary(pollution$pm25)             

boxplot(pollution$pm25, col="blue")
abline(h=12,col="red")

hist(pollution$pm25, col = "green", breaks=100)
rug(pollution$pm25)
abline(v=12,lwd=3,col="red")
abline(v=median(pollution$pm25),lwd=3,col="magenta")

barplot(table(pollution$region), col = "wheat", main = "Number of Counties in Each Region")

# Simple summaries of data / two dimensions
boxplot(pm25 ~ region, data = pollution, col = "red")

par(mfrow = c(2, 1), mar = c(4, 4, 2, 1))
hist(subset(pollution, region == "east")$pm25, col = "green")
hist(subset(pollution, region == "west")$pm25, col = "blue")

with(pollution, plot(latitude, pm25, col=region))
abline(h = 12, lwd = 2, lty = 2)

par(mfrow = c(1, 2), mar = c(5, 4, 2, 1))
with(subset(pollution, region == "west"), plot(latitude, pm25, main = "West"))
with(subset(pollution, region == "east"), plot(latitude, pm25, main = "East"))


#
# Plotting Systems
#

library(lattice)
state <- data.frame(state.x77, region = state.region)
state
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4, 1))

install.packages("ggplot2")
library(ggplot2)
data(mpg)
qplot(displ, hwy, data = mpg)


