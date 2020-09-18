best <- function(state, outcome){
    #read data from csv file
    data <- read.csv("outcome-of-care-measures.csv", 
                      colClasses = "character")
    
    # choose data in given state
    if (state %in% data$State){
        dataInState <- data[data$State == state,]
    } else {
        stop("invalid state")
    }    
    
    # initially order by alphabet
    dataInState <- dataInState[order(dataInState$Hospital.Name),]
    
    # choose data in given outcome 
    if (outcome == "heart attack"){
        dataForOutcome <- 
            as.numeric(dataInState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
        dataInState <- dataInState[!is.na(dataInState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),]
    } else if (outcome == "heart failure"){
        dataForOutcome <- 
            as.numeric(dataInState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
        dataInState <- dataInState[!is.na(dataInState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),]
    } else if (outcome == "pneumonia"){
        dataForOutcome <- 
            as.numeric(dataInState$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
        dataInState <- dataInState[!is.na(dataInState$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),]
    } else {
        stop("invalid outcome")
    }
    
    # get row value of lowest mortality rate
    minMotalityRow <- which.min(dataForOutcome)
    
    # get hospital name
    dataInState[minMotalityRow,]$Hospital.Name
}