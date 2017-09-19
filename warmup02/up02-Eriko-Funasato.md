warmup2
================
Eriko Funasato
September 16, 2017

load the objects
================

load("nba2017-salary-points.RData")

list the available objects
==========================

ls() \#quantitative variable summary(salary) hist(salary) boxplot(salary) d &lt;- density(frequency) plot(d) \#\#the typical value in salary is the mean which is 6187014 \#\#the spread range &lt;- max(salary)-min(salary) range IQR = 9250000-1286160 sd &lt;- sd(salary) variance &lt;- sd^2 variance

categorical variable
====================

factor(position) table(position) frequency &lt;- table(position) rel.frequency &lt;- table(position)/length(position) rel.frequency barplot(frequency)
