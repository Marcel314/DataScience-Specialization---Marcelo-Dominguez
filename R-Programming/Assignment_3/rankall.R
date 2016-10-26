# DataScience Specialization - R Programming
# Assigment3 - Hospital Quality
# by Marcelo Domínguez
# @_marcelo_d 


# Configuration
# - Setting packages and working directory
# - Downloaded raw data and unzip to "./in" folder
setup <- function() {
  cat("Setup")
  install.packages("downloader")
  library(downloader)
  sapply(packages, require, character.only=TRUE, quietly=TRUE)
  setwd("./")
  path = getwd()
  path
  url = "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2FProgAssignment3-data.zip"
  datasetFile = "assignment-dataset.zip"
  download(url, dest=datasetFile, mode="wb") 
  if (file.exists("./in")) {
    unlink("./in",recursive=TRUE,force=TRUE)
  } else {
    dir.create("./in", showWarnings = FALSE, recursive = FALSE, mode = "0777")
  }
  unzip(datasetFile, exdir = "./in")
  cat("Setup: ok")
}

# Get outcome columnName
getOutcomeColumn <- function(outcome) {
  if (outcome == "heart attack") {
    outcome <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  } else if (outcome == "heart failure") {
    outcome <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  } else if (outcome == "pneumonia") {
    outcome <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  }
}

# rankall
#
# The function reads the outcome-of-care-measures.csv file and returns a 2-column data frame containing 
# the hospital in each state that has the ranking specified in num. 
# For example the function call rankall("heart attack", "best") would return a data frame containing the 
# names of the hospitals that are the best in their respective states for 30-day heart attack death rates. 
# The function should return a value for every state (some may be NA). 
# The first column in the data frame is named hospital, which contains the hospital name, and the second 
# column is named state, which contains the 2-character abbreviation for the state name. 
# Hospitals that do not have data on a particular outcome should be excluded from the set of hospitals
# when deciding the rankings.
#
# If the number given by num is larger than the number of hospitals in that state, 
# then the function should return NA.
rankall <- function(outcome, num="best") {
  
  ## Read outcome data
  measures = read.csv("./in/outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state, outcome and num parameters are valid
  if (!is.element(state,measures[,7])) {
    stop("invalid state")
  }
  
  if (!is.element(outcome,c('heart attack','heart failure','pneumonia'))) {
    stop("invalid outcome")
  }
  
  if (!is.element(num,c('best','worst'))) {
    if (!suppressWarnings(as.numeric(num)) <= nrow(measures)) {
      return(NA)
    } 
  } 
  
  ## Return hospital name in that state with the given rank 30-day death rate
  outcomeColumn = getOutcomeColumn(outcome)
  measures <- measures[measures$State==state,]
  measures[,outcomeColumn] <- suppressWarnings(as.numeric(measures[,outcomeColumn]))
  measures <- measures[order(measures[outcomeColumn], measures$"Hospital.Name"),]
  if (num == 'best') {
    name = as.character(measures$"Hospital.Name"[!is.na(measures[outcomeColumn])][1])
  } else if (num == 'worst') {
    name = as.character(tail(measures$"Hospital.Name"[!is.na(measures[outcomeColumn])],1))
  } else {
    name = as.character(measures$"Hospital.Name"[!is.na(measures[outcomeColumn])][num])
  }
  
  return(name)
}


