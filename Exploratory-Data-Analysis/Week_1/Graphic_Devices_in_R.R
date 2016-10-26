## Coursera : DataScience Specialization
## Course   : Exploratory Data Analysis
## Activity : Week-1 Testing
## Author   : Marcelo Dominguez

#
# Graphic Devices in R
# 

quartz()
?Devices

library(datasets)
setwd("./")
par(mfrow=c(1,1))

with(faithful, plot(eruptions, waiting))  ## Make plot appear on screen device
title(main = "Old Faithful Geyser data")  ## Annotate with a title

dev.cur()

## Open PDF device; create 'myplot.pdf'
pdf(file = "./Week_1/out/myplot.pdf")  
## Create plot and send to a file (no plot appears on screen)
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data")  ## Annotate plot; still nothing on screen
dev.off()  ## Close the PDF file device

dev.cur()

# change devides: dev.set(1)

## Create plot on screen device
with(faithful, plot(eruptions, waiting))  
## Add a main title
title(main = "Old Faithful Geyser data")  
## Copy my plot to a PNG file
dev.copy(png, file = "./Week_1/out/geyserplot.png")  
dev.off()








