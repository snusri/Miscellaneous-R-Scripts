corr <- function(directory, threshold = 0)
        dat <- list.files(directory, full.names = TRUE)
        airpol <- vector(mode = "numeric", length = 0)
        
        for (i in 1:length(dat)){
                cmplt <- read.csv(dat[i])
                cmplt_sum <- sum((!is.na(cmplt$sulfate)) & (!is.na(cmplt$nitrate)))
                if (cmplt_sum > threshold){
                        tmp <- cmplt[which(!is.na(cmplt$sulfate)), ]
                        subcmplt <- tmp[which(!is.na(tmp$nitrate)), ]
                        airpol <- c(airpol, cor(subcmplt$sulfate, subcmplt$nitrate))
                }
                airpol
        }
        
        
        