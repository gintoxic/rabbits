tinyCirle<-function(radius.x,
                    radius.y,
                    centerPoint=c(0,0))
{
 
  # radius.x=5
  # radius.y=4 
  # centerPoint=c(1,1)
  
  npts=360
  circ<-seq(0,2*pi,len=npts)
  circle<-matrix(c(centerPoint[1]+radius.x * cos(circ), 
                   centerPoint[2]+radius.y*sin(circ), rep(1,npts)),
                 nrow=npts)
  circle<-rbind(circle, circle[1,])
  dimnames(circle)<-list(NULL, c("x","y","hc"))
  return(circle)
  
}


tinyCirleSegment<-function(radius.x,
                           radius.y,
                           centerPoint=c(0,0), 
                           angle=180)
{
  
  # radius.x=0.1 
  # radius.y=0.1 
  # centerPoint=c(1,1)
  # angle=45

  npts=360
  circ<-seq(0,2*pi,len=npts)
  circle<-matrix(c(centerPoint[1]+radius.x * sin(circ), 
                   centerPoint[2]+radius.y * cos(circ)),
                 nrow=npts)
 
  circle<-rbind(centerPoint,circle[1:angle,],centerPoint)
  dimnames(circle)<-list(NULL, c("x","y"))
  return(circle)
}


tinyPieChart=function(radius.x, 
                      radius.y,
                      percentage=0.5, 
                      centerPoint=c(0,0), 
                      colVec=c("blue", "orange"))
{
  angle<-percentage*360
  a<-tinyCirle(radius.x=radius.x, radius.y=radius.y, centerPoint=centerPoint)
  b<-tinyCirleSegment(radius.x=radius.x, radius.y=radius.y,angle=angle, centerPoint=centerPoint)
  polygon(a, col=colVec[1])
  polygon(b, col=colVec[2])
  
}
plot(1,1)
tinyPieChart(radius.x=0.1, radius.y=0.3, centerPoint=c(0.8,1))
tinyPieChart(radius.x=0.1, radius.y=0.3,percentage=1,  centerPoint=c(1.2,1))


