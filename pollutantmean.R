pollutantmean <- function (directory, pollutant, id = 1:332) {
        
        files_all <- list.files(directory, full.names = TRUE)
        
        airpol <- data.frame()
        
        for(i in id) {
                airpol <- rbind(airpol, read.csv(files_all[i]))
        }
        
        mean(airpol[ ,pollutant], na.rm = TRUE)
}