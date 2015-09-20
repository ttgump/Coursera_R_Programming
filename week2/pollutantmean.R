setwd("~/Documents/Courses/Coursera_R/")

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  # set working directory
  if(grepl("specdata", directory)) {
    directory <- ("./specdata")
  }
  
  # setup file names
  all_files <- list.files(directory)
  file_paths <- paste(directory, all_files, sep="/")
  
  # read data
  data <- c()
  for(i in id) {
    current <- read.csv(file_paths[i], header=T)
    data <- c(data, current[complete.cases(current[,pollutant]), pollutant])
  }
  result <- mean(data)
  return(round(result, 3))
}