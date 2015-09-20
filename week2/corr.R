setwd("~/Documents/Courses/Coursera_R/")

corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  # set working directory
  if(grepl("specdata", directory)) {
    directory <- ("./specdata")
  }
  
  # setup file names
  all_files <- list.files(directory)
  file_paths <- paste(directory, all_files, sep="/")
  
  # get complete table
  complete_table <- complete("specdata", 1:332)
  
  select_id <- complete_table[complete_table$nobs > threshold, "id"]
  corr_vector <- c()
  j <- 1
  for(i in select_id) {
    current <- read.csv(file_paths[i], header=T)
    corr_vector[j] <- cor(current$sulfate, current$nitrate, use="complete.obs")
    j <- j+1
  }
  return(corr_vector)
}