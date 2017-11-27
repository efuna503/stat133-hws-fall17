#=================================================================================
# title: clean-data-script.R
# description: deal with the rawdata
# input(s): the data from the cvs table rawscores.csv
# output(s): data calculated by using function on to the rawscore
#=================================================================================
## read in the CSV file with the raw scores
source(file = 'functions.R')
library(dplyr)
dat <- read.csv(file = '../data/rawdata/rawscores.csv',stringsAsFactors = FALSE)

## sink() the structure str() of the data frame to summary-rawscores.txt
sink('../output/summary-rawscores.txt')
str(dat)
summary_stats(dat)
print_stats(dat)
sink()

## write a for() loop to replace all missing values NA with zero.
for(i in 1:ncol(dat)){
  dat[,i][is.na(dat[,i])] <- 0
}
dat

## use rescale100() to rescale QZ1: 0 is the minimum, and 12 is the max.
rescale100(dat$QZ1,xmin = 0,xmax = 12)

## use rescale100() to rescale QZ2: 0 is the minimum, and 18 is the max
rescale100(dat$QZ2,xmin = 0,xmax = 18)

## use rescale100() to rescale QZ3: 0 is the minimum, and 20 is the max.
rescale100(dat$QZ3,xmin = 0,xmax = 20)

## use rescale100() to rescale QZ4: 0 is the minimum, and 20 is the max.
rescale100(dat$QZ4,xmin = 0,xmax = 20)

## use rescale100() to add a variable Test1 by rescaling EX1: 0 is the min and 80 the max
dat <- mutate(dat,Test1=rescale100(dat$EX1,xmin = 0,xmax = 80))

## use rescale100() to add a variable Test2 by rescaling EX2: 0 is the min 90 the max
dat <- mutate(dat,Test2=rescale100(dat$EX2,xmin = 0,xmax = 90))

## add a variable Homework to the data frame of scores
Homework <- apply(dat[,1:9],1,score_homework)
dat <- mutate(dat,Homework)

## add a variable Quiz to the data frame of scores
Quiz <- apply(dat[,11:14],1,score_quiz)
dat <- mutate(dat,Quiz)

## lab
lab <- lapply(dat[ ,10],FUN = score_lab)
lab <- as.numeric(lab)
dat$ATT <- lab

## add a variable Overall to the data frame of scores
hw <- lapply(dat$Homework,function(x)x*0.3) 
qz <- lapply(dat$Quiz,function(x)x*0.15)
t1 <- lapply(dat$Test1,function(x)x*0.2)
t2 <- lapply(dat$Test2,function(x)x*0.25)
lab <- lapply(dat$ATT,function(x)x*0.1)
Overall <- lapply(seq_along(lab),function(x)unlist(lab[x])+unlist(hw[x])+unlist(qz[x])
  +unlist(t1[x])+unlist(t2[x]))
dat <- mutate(dat,Overall=as.numeric(Overall))

## calculate a variable Grade
g=c()
for(i in 1:334){
  if(dat$Overall[i]>=0 & dat$Overall[i]<50){g[i]="F"}
  else if(dat$Overall[i]>=50 & dat$Overall[i]<60){g[i]="D"}
  else if(dat$Overall[i]>=60 & dat$Overall[i]<70){g[i]="C-"}
  else if(dat$Overall[i]>=70 & dat$Overall[i]<77.5){g[i]="C"}
  else if(dat$Overall[i]>=77.5 & dat$Overall[i]<79.5){g[i]="C+"}
  else if(dat$Overall[i]>=79.5 & dat$Overall[i]<82){g[i]="B-"}
  else if(dat$Overall[i]>=82 & dat$Overall[i]<86){g[i]="B"}
  else if(dat$Overall[i]>=86 & dat$Overall[i]<88){g[i]="B+"}
  else if(dat$Overall[i]>=88 & dat$Overall[i]<90){g[i]="A-"}
  else if(dat$Overall[i]>=90 & dat$Overall[i]<95){g[i]="A"}
  else{g="A+"}
}
dat <- mutate(dat,g)


##  write a for loop in which you use your functions summary_stats() and print_stats()
sink('../output/Lab-stats.txt')
summary_stats(dat$ATT)
print_stats(dat$ATT)
sink()

sink('../output/Homework-stats.txt')
summary_stats(dat$Homework)
print_stats(dat$Homework)
sink()

sink('../output/Quiz-stats.txt')
summary_stats(dat$Quiz)
print_stats(dat$Quiz)
sink()

sink('../output/Test1-stats.txt')
summary_stats(dat$Test1)
print_stats(dat$Test1)
sink()

sink('../output/Test2-stats.txt')
summary_stats(dat$Test2)
print_stats(dat$Test2)
sink()

sink('../output/Overall-stats.txt')
summary_stats(dat$Overall)
print_stats(dat$Overall)
sink()

sink('../output/summary-cleanscores.txt')
str(dat)
sink()

write.csv(dat,'../data/cleandata/cleanscores.csv')

