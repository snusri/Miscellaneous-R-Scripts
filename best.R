best <- function(state, outcome) {
        ## Read outcome data
        dat <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
        ## Check that state and outcome are valid
        if (!state %in% dat$State){
                stop("Invalid State")
        }
        
        
        if (!((outcome == "heart failure") | (outcome == "heart attack") | (outcome == "pneumonia"))){
                stop("Invalid outcome")
        }
        ## Return hospital name in that state with lowest 30-day death
        
        col <- if (outcome == "heart failure") {
                17
        }
        else if (outcome == "heart attack"){
                11
        }
        else if ( outcome == "pneumonia"){
                23
        }
        
        
        dat<-dat[dat$State == state,]
        dat[, col] <-suppressWarnings(as.numeric(dat[, col]))
        dat[, 2] <- as.character(dat[, 2])
        hosp <- dat[order(dat[, col], dat[, 2], na.last = TRUE), ]
        hosp[1, 2]
}
        

        ## rate
