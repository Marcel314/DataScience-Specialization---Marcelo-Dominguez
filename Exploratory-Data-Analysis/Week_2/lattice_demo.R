## Coursera : DataScience Specialization
## Course   : Exploratory Data Analysis
## Activity : Week-2 Testing Lattice
## Author   : Marcelo Dominguez

## 
## Lattice Plotting System
##

library(datasets)
library(lattice)
head(airquality)
class(airquality)

# Intro
xyplot(Ozone ~ Wind, data=airquality)
airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5, 1))

# Lattice behaviour
p <- xyplot(Ozone ~ Wind, data = airquality)
print(p)
xyplot(Ozone ~ Wind, data = airquality) ## Auto-printing

# Lattice Pannel Functions
set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50) 
y <- x+f-f*x+rnorm(100,sd=0.5)
f <- factor(f, labels = c("Group 1", "Group 2"))
xyplot(y ~ x | f, layout = c(2, 1)) ## Plot with 2 panels

# Custom panel functions

xyplot(y ~ x | f, panel = function(x, y, ...) {
  ## First call the default panel function for 'xyplot' panel.abline(h = median(y), lty = 2) 
  panel.xyplot(x, y, ...)
  ## Add a horizontal line at the median
  panel.abline(h = median(y), lty = 2)
})

xyplot(y ~ x | f, panel = function(x, y, ...) {
  ## First call the default panel function for 'xyplot' panel.abline(h = median(y), lty = 2) 
  panel.xyplot(x, y, ...)
  ## Overlay a simple linear regression line
  panel.lmline(x, y, col = 2) 
})


