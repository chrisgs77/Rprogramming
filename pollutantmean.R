pollutantmean<-function(directory,pollutant,id=1:332){
  outdata<-c()
  for(z in id){
    path<-getwd()
    x<-read.csv(file=paste(path,"/",directory,"/",
      sprintf("%03d",z),".csv",sep=''))
    data<-x[pollutant]
    outdata<-c(outdata,data[!is.na(data)])
  }
  mean(outdata)
}

complete<-function(directory,id=1:332){
  outdata<-data.frame(id=numeric(0),nobs=numeric(0))
  for(z in id){
    path<-getwd()
    x<-read.csv(file=paste(path,"/",directory,"/",
                           sprintf("%03d",z),".csv",sep=''))
    xcomp<-x[complete.cases(x),]
    outdata<-rbind(outdata,data.frame(id=z,nobs=nrow(xcomp)))
  }
  outdata
}

corr<-function(directory,threshold=0){
  cout<-c()
  for(z in 1:332){
    rows<-complete(directory,z)
    if(rows$nobs>threshold) {
      x<-read.csv(file=paste(path,"/",directory,"/",
                             sprintf("%03d",z),".csv",sep=''))
      xcomp<-x[complete.cases(x),] 
      co<-cor(xcomp$sulfate,xcomp$nitrate)
      cout<-c(cout,co)
    }
  }
  cout
}

