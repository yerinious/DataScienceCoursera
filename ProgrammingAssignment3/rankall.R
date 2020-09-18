rankall <- function(outcome, num = "best"){
  # load data from csv file
  data <- read.csv("outcome-of-care-measures.csv", 
                   colClasses = "character")
  
  # check if outcome is valid and filter data
  dataForOutcome <- data[order(data$Hospital.Name),]
  
  
  if (outcome == "heart attack"){
    dataForOutcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack <- as.numeric(dataForOutcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    dataForOutcome <- dataForOutcome[!is.na(dataForOutcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),]
    dataForOutcome <- dataForOutcome[order(dataForOutcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, decreasing = FALSE),]
    
  } else if (outcome == "heart failure"){
    dataForOutcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure <- as.numeric(dataForOutcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
    dataForOutcome <- dataForOutcome[!is.na(dataForOutcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),]
    dataForOutcome <- dataForOutcome[order(dataForOutcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, decreasing = FALSE),]
    
  } else if (outcome == "pneumonia"){
    dataForOutcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia <- as.numeric(dataForOutcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
    dataForOutcome <- dataForOutcome[!is.na(dataForOutcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),]
    dataForOutcome <- dataForOutcome[order(dataForOutcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, decreasing = FALSE),]
    
  } else {
    stop("invalid outcome")
  }
  
  # create empty data frame
  returnData <- data.frame()
  
  # get each ranked hospital from every state
  states <- unique(dataForOutcome$State)
  states <- states[order(states)]
  for (ST in states){
    dataInState <- dataForOutcome[dataForOutcome$State == ST,]
    
    # make num value as integer
    if (num == "best"){
      ranking <- 1
    } else if (num == "worst") {
      ranking <- nrow(dataInState)
    } else {
      ranking <- as.numeric(num)
    }
    
    hospital <- dataInState[ranking,"Hospital.Name"]
    forReturn <- c(hospital, ST)
    returnData <- rbind(returnData,forReturn)
  }
  names(returnData) <- c("hospital", "state")
  returnData[order(returnData$state),]
}