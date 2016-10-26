## Coursera : DataScience Specialization
## Course   : Exploratory Data Analysis
## Author   : Marcelo Dominguez

input_data_url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
input_data_file = "./in/exdata%2Fdata%2FNEI_data.zip"

if (!file.exists("in")) {
  dir.create("in")
}

if (!file.exists(input_data_file)) {
  download.file(url=input_data_url, destfile = input_data_file,method="curl")
  unzip(input_data_file, exdir="./in")
}