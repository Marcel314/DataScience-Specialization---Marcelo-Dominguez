corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations

  source("complete.R")
  
  complete_cases = complete(directory)
  cases_above_threshold = complete_cases[complete_cases$nobs > threshold,1]
  all_files = list.files(path = directory, full.names = TRUE)
  correlations = rep(NA,length(cases_above_threshold))
  
  for (i in cases_above_threshold) {
    file_data = (read.csv(all_files[i]))
    complete_cases = complete.cases(file_data)
    valid_sulfate_data = file_data[complete_cases, 2]
    valid_nitrate_data = file_data[complete_cases, 3]
    correlations[i] = cor(x = valid_sulfate_data, y = valid_nitrate_data)
  }
  
  correlations = correlations[complete.cases(correlations)]
}