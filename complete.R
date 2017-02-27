complete<-function (directory, id=1:332){
        #Creating an empty dataframe
        #collector<- data.frame(Date=character(0), sulfate=numeric(0), nitrate=numeric(0), ID=numeric(0))
        collector<- data.frame(id=numeric(0), nobs=numeric(0))
        #open the files and collect them in the data frame
        nobs<- function(id) {
                
                op<-file.path("specdata",paste(sprintf("%03d",as.numeric(id)),".csv", sep=""))
                return(sum(complete.cases(read.csv(op))))

        }      
        
        #find the nobs
        return(data.frame(id=id, nobs=sapply(id, nobs)))
}