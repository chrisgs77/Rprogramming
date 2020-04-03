myfunction <- function () {
  x<-rnorm(100)
  mean(x)
}
hw<-read.csv("hw1_data.csv")
names(hw)
hw[1:2,]
hw2<-hw[hw$Ozone>31,]
hw2<-hw[hw$Ozone>31 & hw$Temp>90,]
hw3<-hw[hw$Month==6,]
hw4<-hw[hw$Month==5,]
library(swirl)
install_from_swirl("R Programming")
