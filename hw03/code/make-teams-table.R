#=================================================================================
#title: make-teams-table
# description: a short description of what the script is about
# input(s): what are the inputs required by the script?
# output(s): what are the outputs created when running the script?
#=================================================================================
setwd("C:/Users/eriko/stat133/stat133-hws-fall17/hw03/code")
library(dplyr)
#Raw data and dictionaries
dat1 <- read.csv("../data/nba2017-roster.csv")
dat2 <- read.csv("../data/nba2017-stats.csv")

#Adding new variables
dat2 <- mutate(dat2,missed_fg=dat2$field_goals_atts - dat2$field_goals_made, 
               missed_ft=dat2$points1_atts-dat2$points1_made,
               points= 3*dat2$points3_made +2*dat2$points2_made+dat2$points1_made,
               rebounds = dat2$off_rebounds + dat2$def_rebounds,
               efficiency= (points+rebounds+dat2$assist+dat2$steals+
                              dat2$blocks- missed_fg - missed_ft - dat2$turnovers)
               /dat2$games_played)
sink(file = "../output/efficiency-summary.txt")
summary(dat2)
sink()
#Merging Tables
dat <- merge(dat1,dat2)
colnames(dat)[20] <- "free_throws"

#Creating nba2017-teams.csv
team <- summarize(group_by(dat,team),Experience=round(sum(experience),digits = 2),
                  Salary=sum(round(salary*(10^-6),digits = 2)),
                  Points3=sum(points3_made),Points2=sum(points2_made),
                  Free_throws=sum(free_throws),Points=sum(points),
                  Off_rebounds=sum(off_rebounds),Def_rebounds=sum(def_rebounds),
                  Assists=sum(assists),Steals=sum(steals),Blocks=sum(blocks),
                  Turnovers=sum(turnovers),Fouls=sum(fouls),
                  Efficiency=sum(efficiency))
team <- data.frame(team,row.names = team$team)
sink(file = "../data/teams-summary.txt")
summary(team)
sink()
write.csv(team,file = "../data/nba2017-teams.csv")
#Some graphics
##use stars() to get a star plot of the teams
stars(team[ ,-1],labels = as.character(team$team))
##use ggplot() to get a scatterplot of experience and salary
pdf(file = "../image/experience_salary.pdf")
ggplot(team,aes(x=Experience,y=Salary))+geom_point()+geom_text(aes(label=team))
dev.off()
