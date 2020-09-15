complete <- function(directory, id){
  data <- data.frame()
  
  filepath = paste("./", directory, "/", sep ="")
  datafiles <- list.files(path=filepath, pattern="*.csv")
  
  for (i in id){
    eachfile <- paste(filepath,datafiles[i],sep = "")
    readData <- read.csv(eachfile,header = TRUE)
    readData <- na.omit(readData)
    temp <- list(i,nrow(readData))
    data <- rbind(data,temp)
  }
  names(data) <- c("id","nobs")
  data
}

