pollutantmean <- function(directory, pollutant, id=1:332){
#Creating an empty dataframe
        collector<- data.frame(Date=character(0), sulfate=numeric(0), nitrate=numeric(0), ID=numeric(0))
#open the files and collect them in the data frame
        for (i in id) {
                
                op<-file.path("specdata",paste(sprintf("%03d",as.numeric(i)),".csv", sep=""))
                filedata <- read.csv(op)
                collector<-rbind(collector, filedata)
        }       
        
#Calculate the mean
        data<-collector[,pollutant]
        sprintf("%.3f",mean(data,na.rm = TRUE))
}