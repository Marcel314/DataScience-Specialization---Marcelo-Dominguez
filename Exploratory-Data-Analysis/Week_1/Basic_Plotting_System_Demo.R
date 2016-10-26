## Coursera : DataScience Specialization
## Course   : Exploratory Data Analysis
## Activity : Week-1 Testing
## Author   : Marcelo Dominguez

#
# 8. Base plotting demostration
#


# Data
x = rnorm(100)
y = rnorm(100)
z = rpois(100,2)
w = rpois(100,2)
r = rpois(100,2)

## Single Grpah


par(mar=c(4,4,2,2))
plot(x,y,xlab="Label X",ylab="Label Y", pch = c(20,21),col=c(2,3))
title("Sample ScatterPlot")
text(-2,-2,"By @Marcel")
legend("topright",legend = c("Won","Lost"),pch = c(20,21),title = "Sample Legend",col=c(2,3))
# Lineal regression line
fit <- lm(x ~ y)
fit
abline(fit)
# Lines
abline(h = 1.0, col=1)
abline(h = 1.1, lwd=1, col=2)
abline(h = 1.2, lwd=2, col="blue")
abline(h = 1.3, lwd=3, col="yellow")
abline(v = -2.5, lwd=4,  col="gray")
abline(v = -2.6, lwd=5, col="darkgray")

## Setup N Graphs


par(mfrow=c(2,2))
par(mar=c(4,4,2,2))

plot(x,y,col="lightgray",lwd=2, pch=15)
plot(x,z,col="gray",lwd=2,pch=16)
plot(x,y,col="darkgray",lwd=2,pch=17)
plot(x,y,lwd=2,pch=18)


## 
par(mfrow=c(1,1))
x = rnorm(100)
y = x + rnorm(100)
g = gl(2,10,labels=c("Male","Female"))
str(g)
plot(x,y)
plot(x,y,type="n")
points(x[g == "Female"],y[g == "Female"],col="red", pch=19)
points(x[g == "Male"],y[g == "Male"],col="blue", pch=19)



