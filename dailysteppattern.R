dailysteppattern <- function () {
  
  # This accounts for a limitation in RStudio
  options("max.print" = 9999999)
  
  #load libraries needed
  library(ggplot2)
  library(grid)
  
  #load data into function
  activity <- read.csv("~\\R\\datasciencecoursera\\RepData_PeerAssessment1\\activity.csv")
  #remove NA
  stepdata <- activity[!is.na(activity$steps),]
  #sum step data by day
  meanstepinterval <- aggregate(steps ~ interval, data = stepdata, mean)
  maxsteps <- meanstepinterval$interval[meanstepinterval$steps == max(meanstepinterval$steps)]
  
  #plot
  ggplot(data = meanstepinterval) + geom_point(mapping= aes(x = interval, y = steps)) +
    labs(title = "Average Steps per Interval from Watch Data") +
    xlab("Time Interval") +
    ylab("Average Steps per Interval")
  abline(v = maxsteps, col = "red", lty = 4)
 
  
}