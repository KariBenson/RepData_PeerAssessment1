stepsperday <- function() {
 
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
     newstep <- aggregate(steps ~ date, data = stepdata, sum)
     newstepmean <- sprintf("%.4f",mean(newstep$steps))
     newstepmedian <- median(newstep$steps)
     
     #plot
       ggplot(data = newstep, aes(x = steps)) + geom_histogram() +
        labs(title = "Distribution of Total Steps per Day from Watch Data") +
         xlab("Total Steps per Day") +
         ylab("Frequency of step count")      
         
 }