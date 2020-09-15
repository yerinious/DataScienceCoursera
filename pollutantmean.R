pollutantmean <- function(directory,pollutant,id){
  data <- data.frame()
  
  filepath = paste("./", directory, "/", sep ="")
  datafiles <- list.files(path=filepath, pattern="*.csv")

  for (i in id){
    eachfile <- paste(filepath,datafiles[i],sep = "")
    readData <- read.csv(eachfile,header = TRUE)
    data <- rbind(data, readData)
  }
  meanValue <- mean(data[,pollutant], na.rm=TRUE)
  meanValue
}