corr <- function(directory, threshold =0){
  data <- c()
  
  filepath = paste("./", directory, "/", sep ="")
  datafiles <- list.files(path=filepath, pattern="*.csv")
  
  for (i in 1:332){
    completecasenum <- complete(directory,i)$nobs
    if (completecasenum > threshold){
      completecase <- paste(filepath,datafiles[i],sep = "")
      readcase <- read.csv(completecase,header = TRUE)
      readcase <- na.omit(readcase)
      sulfate <- readcase[,"sulfate"]
      nitrate <- readcase[,"nitrate"]
      corValue <- cor(sulfate,nitrate)
      data <- c(data, corValue)
    }
  }
  data
}