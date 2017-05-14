complete <- function(directory, id = 1:332) {
        files_all <- list.files(directory, full.names = TRUE)
        airpol <- data.frame()
        
        for(i in id) {
                read_files <- read.csv(files_all[i])
                nobs <- sum(complete.cases(read_files))
                cmplt <- data.frame(i, nobs)
                airpol <- rbind(airpol, cmplt)
                
        }
        
        colnames(airpol) <- c("id", "nobs")
        airpol
}