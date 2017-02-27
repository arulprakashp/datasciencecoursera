pollutantmean <- function(directory, pollutant, id=1:332){
#Creating an empty dataframe
        collector<- data.frame(Date=character(0), sulfate=numeric(0), nitrate=numeric(0), ID=numeric(0))
#open the files and collect them in the data frame
        for (i in id) {
                
                if (i < 10) {
                        
                        op<-paste(directory,"/","00",paste(i,".csv",sep=""),sep="")
                        filedata <- read.csv(op)
                        collector<-rbind(collector, filedata)

                
                } else if (i>=10 & i<=99) {
                        
                        op<-paste(directory,"/","0",paste(i,".csv",sep=""),sep="")
                        filedata <- read.csv(op)
                        collector<-rbind(collector, filedata)

                } else {
                        
                        op<-paste(directory,"/",paste(i,".csv",sep=""),sep="")
                        filedata <- read.csv(op)
                        collector<-rbind(collector, filedata)

                }
        }       
        
#Calculate the mean
        data<-collector[,pollutant]
        round(mean(data,na.rm = TRUE), digits = 3)
}