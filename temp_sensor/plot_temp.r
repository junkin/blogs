plot_temp<-function() {
 data<-read.csv("./temp_data.csv")
 header=FALSE
 names(data)<-c("datetime","temp")
 data$hour<-substr(as.character(data[,1]), 12,19)
 x<-smooth.spline(data[,2])
 jpeg('brand.jpg')
 plot(data[,2], ylab="Tempertaure (f)",xlab="Time",xaxt='n',col="red")
 points(x$y, type="l", col="black",lwd=2)
 axis(side=1, at=seq(0,35000,8000)+1, labels=as.character(data[seq(0,35000,8000)+1,3]))
 mtext("@bigdataapps", side=1, adj=1, cex=1.0, col="grey")
 abline(v=c(1:length(data$hour))[data$hour=="07:08:22"],col="green")
 abline(v=c(1:length(data$hour))[data$hour=="22:15:00"],col="blue")
 leg.txt=c("Blue: shuts off heater for the night", "Green: Turns on heater for the day")
 legend(25000,54,c("woke up","went to bed"),col=c("green","blue"),lwd=3)

 dev.off()
}