## library()

## calling data from csv file and save in 'wholeData'
fileName = file.choose()
temp <- read.csv(fileName, nrows = 10)
classes <- sapply(temp, class)
wholeData <- read.csv(fileName, colClasses = classes)

## check the data
names(wholeData)
nrow(wholeData)
ncol(wholeData)
head(wholeData)
tail(wholeData)

## run for quiz
wholeData$Ozone[47]
sum(is.na(wholeData$Ozone))
mean(wholeData$Ozone, na.rm = TRUE)

tempData <- subset(wholeData,wholeData$Ozone > 31)
head(tempData)
tempData <- subset(tempData, tempData$Temp > 90)
mean(tempData$Solar.R)

tempData <- subset(wholeData, wholeData$Month == 6)
mean(tempData$Temp)

tempData <- subset(wholeData, wholeData$Month == 5)
head(tempData)
max(tempData$Ozone, na.rm = TRUE)

# basic problems
x <- c(4, TRUE)
class(x)
