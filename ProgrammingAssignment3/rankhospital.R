rankhospital <- function(state, outcome, num = "best"){
    # load data from csv file
    data <- read.csv("outcome-of-care-measures.csv", 
                     colClasses = "character")
    
    # check if state is valid and filter data
    if (state %in% data$State){
        dataInState <- data[data$State == state,]
    } else {
        stop("invalid state")
    }
    
    # initially order by alphabet
    dataInState <- dataInState[order(dataInState$Hospital.Name),]
    
    # check if outcome is valid and filter data
    if (outcome == "heart attack"){
        dataInState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack <- as.numeric(dataInState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
        dataInState <- dataInState[!is.na(dataInState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),]
        dataInState <- dataInState[order(dataInState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, decreasing = FALSE),]
        
    } else if (outcome == "heart failure"){
        dataInState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure <- as.numeric(dataInState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
        dataInState <- dataInState[!is.na(dataInState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),]
        dataInState <- dataInState[order(dataInState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, decreasing = FALSE),]
        
    } else if (outcome == "pneumonia"){
        dataInState$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia <- as.numeric(dataInState$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
        dataInState <- dataInState[!is.na(dataInState$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),]
        dataInState <- dataInState[order(dataInState$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, decreasing = FALSE),]
        
    } else {
        stop("invalid outcome")
    }
    
    # make num value as integer
    if (num == "best"){
        num = 1
    } else if (num == "worst") {
        num = nrow(dataInState)
    } else {
        num = as.integer(num)
    }
    
    # return hospital name if num is valid
    if (num <= nrow(dataInState)){
        dataInState$Hospital.Name[num]
    } else {
        NA
    }
}