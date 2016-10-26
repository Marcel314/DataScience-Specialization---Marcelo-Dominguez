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

# Function that reads csv file and returns a character vector with the name of the hospital that 
# has the best (lowest) 30-day mortality for the specified 'outcome' in that 'state'.
# - hospital name = value of 'Hospital.Name' column
# - outcomes = values “heart attack” “heart failure" or “pneumonia”
# - Hospitals that do not have data on a particular outcome should be excluded from the set of hospitals when deciding the rankings.
best <- function(state, outcome) {
  
  ## Read outcome data
  measures = read.csv("./in/outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  if (!is.element(state,measures[,7])) {
    stop("invalid state")
  }
   
  if (!is.element(outcome,c('heart attack','heart failure','pneumonia'))) {
    stop("invalid outcome")
  }
  
  ## Return hospital name in that state with lowest 30-day death rate
  
  # outcome column name
  outcomeColumn = getOutcomeColumn(outcome)
  # measurements by given state
  measures <- measures[measures$State==state,]
  # measurements by given state and given outcome
  measures[,outcomeColumn] <- suppressWarnings(as.numeric(measures[,outcomeColumn]))
  measures <- measures[order(measures[outcomeColumn], measures$"Hospital.Name"),]
  name = head(as.character(measures$"Hospital.Name"[!is.na(measures[outcomeColumn])]),1)
  name
}