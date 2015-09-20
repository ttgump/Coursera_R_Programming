setwd("~/Documents/Courses/Coursera_R/")

complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  # set working directory
  if(grepl("specdata", directory)) {
    directory <- ("./specdata")
  }
  
  # setup file names
  all_files <- list.files(directory)
  file_paths <- paste(directory, all_files, sep="/")
  
  # read data and ge result
  result <- data.frame(id=numeric(), nobs=numeric(), stringsAsFactors=F)
  j <- 1
  complete_number <- c()
  for(i in id) {
    current <- read.csv(file_paths[i], header=T)
    complete_number[j] <- sum(complete.cases(current))
    j <- j+1
  }
  result <- data.frame(id=id, nobs=complete_number, stringsAsFactors=F)
  return(result)
}