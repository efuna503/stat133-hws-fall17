### 2) Functions
#' @title remove_missing()
#' @description returns the input vector without missing values
#' @parameter vector x
#' @param na.rm whether to remove missing values
#' @return the vector without the missing value NA in the vector
#' @example 
#' @remove_missing vector a
a <- c(1, 4, 7, NA, 10)
remove_missing <- function(x){
  x <- x[!is.na(x)]
  return(x)
}
remove_missing(a)



#' @title  get_minimum
#' @description a function to find the minimum value 
#' @parameter x numeric vector
#' @param na.rm whether to remove missing values
#' @return  the minimum in a vector
#' @example 
#' @get_minimum(a)
get_minimum <- function(x,na.rm=TRUE){
  if(na.rm==TRUE){
    x <- remove_missing(x)}else{
      x=x
    }
  if(is.numeric(x)){
      min <- sort(x)[1]
  return(min)
  } else{
    stop("non-numeric vector")
  }
}
a <- c(1, 4, 7, NA, 10)
get_minimum(a, na.rm = TRUE)




#' @get_maximum
#' @description a function that takes a numeric vector to find the maximum value
#' @parameter x numeric vector
#' @param na.rm whether to remove missing values
#' @return maximum value
#' @example 
#' @get_maximum(a)
get_maximum <- function(x,na.rm=TRUE){
  if(na.rm==TRUE){
    x <- remove_missing(x)}else{
      x=x
    }
  if(is.numeric(x)){
    max <- sort(x,decreasing = TRUE)[1]
    return(max)
  }else{
    stop("non-numeric vector")
  }
}
a <- c(1, 4, 7, NA, 10)
get_maximum(a, na.rm = TRUE)



#' @get_range()
#' @description get_minimum() and get_maximum() to compute the overall range
#' @parameter x numeric vector
#' @param na.rm whether to remove missing values
#' @return overall range
#' @example 
#' @get_range(a)
get_range <- function(x,na.rm=TRUE){
  if(na.rm==TRUE){
    x <- remove_missing(x)}else{
      x=x
    }
  if(is.numeric(x)){
    range <- get_maximum(x)-get_minimum(x)
    return(range)
  }else{
    stop("non-numeric vector")
  }
}
a <- c(1, 4, 7, NA, 10)
get_range(a, na.rm = TRUE)




#' @get_median()
#' @description a function that compute the median of the input vector
#' @parameter x numeric vector
#' @param na.rm whether to remove missing values
#' @return the median of the vector
#' @example 
#' @get_median(a)
get_median <- function(x,na.rm=TRUE){
  if(na.rm==TRUE){
    x <- remove_missing(x)}else{
      x=x
    }
  if(is.numeric(x)){
    if(length(x)%%2==0){
      med <- (x[length(x)/2]+x[length(x)/2 + 1])/2
    }else{
      med <- x[(length(x)+1)/2]
    }
  }else{
    stop("non-numeric vector")
  }
  return(med)
}
a <- c(1, 4, 7, NA, 10)
get_median(a, na.rm = TRUE)





#' @get_average()
#' @description a function that compute the average of input vector
#' @parameter x numeric vector
#' @param na.rm whether to remove missing values
#' @return the average of the vector
#' @example 
#' @get_average(b)
sum <- 0
get_average <- function(x,na.rm=TRUE){
  if(na.rm==TRUE){
    x <- remove_missing(x)
  }else{
    x=x
  }
  
  if(is.numeric(x)){
    for(i in 1:length(x)){
      sum=x[i]+sum
    }
  }else{
      stop("non-numeric vector")
    }
  return(sum/length(x))
}
a <- c(1, 4, 7, NA, 10)
get_average(a, na.rm = TRUE)




#' @get_stdev()
#' @description e a function that compute the standard deviation of the input.
#' @parameter x numeric vector
#' @param na.rm whether to remove missing values
#' @return the standard deviation of the vector x
#' @example 
#' @get_stdev(a)
sum <- 0
get_stdev <- function(x,na.rm=TRUE){
  if(na.rm==TRUE){
    x <- remove_missing(x)
  }else{ x=x  }
  
  if(is.numeric(x)==TRUE){
  for(i in 1:length(x)){
    sum <-  (x[i]-get_average(x))^2 + sum
    }
  }else{
  stop("non-numeric vector")
  }
  return(sqrt(sum/(length(x)-1)))
}
a <- c(1, 4, 7, NA, 10)
get_stdev(a, na.rm = TRUE)





#' @get_quartile1()
#' @description a function that compute the first quartile of the input vector.
#' @parameter x numeric vector
#' @param na.rm whether to remove missing values
#' @return the first quartile of the vector x
#' @example 
#' @get_quartile1(a)
get_quartile1 <- function(x, na.rm=TRUE){
  if(na.rm == TRUE){
    x <- remove_missing(x)
  }else{
    x=x
  }
  if(is.numeric(x)==TRUE){
    q1 <- quantile(x,0.25)
  }else{
    stop("non-numeric vector")
  }
  return(q1[[1]])
}
a <- c(1, 4, 7, NA, 10)
get_quartile1(a, na.rm = TRUE)





#' @get_quartile3()
#' @description e a function that compute the third quartile of the input vector
#' @parameter x numeric vector
#' @param na.rm whether to remove missing values
#' @return the third quartile of vector x
#' @example 
#' @get_quartile3()
get_quartile3 <- function(x,na.rm=TRUE){
  if(na.rm==TRUE){
    x <- remove_missing(x)
  }else{
    x=x
  }
  if(is.numeric(x)){
    q3=quantile(x,0.75)
  }else{
    stop("non-numeric vector")
  }
  return(q3[[1]])
} 
a <- c(1, 4, 7, NA, 10)
get_quartile3(a, na.rm = TRUE)





#' @count_missing()
#' @description e a function thatcalculates the number of NA.
#' @parameter x numeric vector
#' @param na.rm whether to remove missing values
#' @return the number of missing value in vector x
#' @example 
#' @count_missing(a)
count_missing <- function(x){
  num <- sum(is.na(x))
  return(num)
}
count_missing(a)




#' @summary_stats()
#' @description a function that returns a list of summary statistics
#' @parameter x numeric vector 
#' @param na.rm whether to remove missing values
#' @return a list of the summary statistic of the vector x
#' @example 
#' @summary_stats(a)
summary_stats <- function(x){
  list(minimum=get_minimum(x),
       percent10=quantile(x,0.1,na.rm = TRUE)[[1]],
       quartile1=get_quartile1(x),
       median=get_median(x),
       mean=get_average(x),
       quartile3=get_quartile3(x),
       percent90=quantile(x,0.9,na.rm = TRUE)[[1]],
       maximum=get_maximum(x),
       range=get_range(x),
       stdev=get_stdev(x),
       missing=count_missing(x))
} 
summary_stats(a)




#' @print_stats()
#' @description a function that prints the values in a nice format.
#' @parameter x list of summary stats
#' @param  na.rm whether to remove missing values
#' @return the nicely printed result of the summary stats
#' @example
#' @print_stats(stats)
stats <- summary_stats(a)
print_stats <- function(x){
  for(i in 1:length(x)){
    cat(sprintf("%-12s:%s",names(x)[i],format(x[[i]],nsmall = 4)),fill=TRUE,
        append = TRUE)
    }
}
print_stats(stats)




#' @rescale100
#' @description to compute a rescaled vector with a potential scale from 0 to 100
#' @parameter x numeric vector, xmin a minimum, xmax a maximum
#' @param na.rm whether to remove missing values
#' @return the rescaled vector of x 
#' @example 
#' @rescale100(b,xmin=0,xmax=20)
rescale100 <- function(x,xmin,xmax){
  z <- c(rep(NA,length(x)))
  for(i in 1:length(x)){
    z[i] = 100 * (x[i] - xmin) / (xmax - xmin) 
  }
 return(z)
} 
b <- c(18, 15, 16, 4, 17, 9)
rescale100(b, xmin = 0, xmax = 20)




#' @drop_lowest()
#' @description e a function that returns a vector dropping the lowest value.
#' @parameter x numeric vector
#' @param  na.rm whether to remove missing values
#' @return a vector of length n-1 after dropping the lowest value
#' @example 
#' @drop_lowest(b)
drop_lowest <- function(x){
  x <- x[x != sort(x,decreasing = FALSE)[1]]
  return(x)
}
b <- c(10, 10, 8.5, 4, 7, 9)
drop_lowest(b)




#' @score_homework()
#' @description function that compute a single homework value. 
#' @parameter numeric vector x
#' @param optional logical argument drop,whether the lowest should be dropped
#' @return the average value of the homework vector
#' @example 
#' @score_homework(hws)
score_homework <- function(x,drop=TRUE){
  if(drop==TRUE){
    x <- drop_lowest(x)
  }else{
    x <- x
  }
  score <- get_average(x)
  return(score)
}
hws <- c(100, 80, 30, 70, 75, 85)
score_homework(hws, drop = TRUE)
score_homework(hws, drop = FALSE)


#' @score_quiz()
#' @description  a function that compute a single quiz value
#' @parameter numeric vector x
#' @param optional argument drop, whether the lowest score should be dropped
#' @return the average of the quiz vector
#' @example 
#' @score_quiz(quizzes)
score_quiz <- function(x,drop=TRUE){
  if(drop==TRUE){
    x <- drop_lowest(x)
  }else{
    x <- x
  }
  get_average(x)
}
quizzes <- c(100, 80, 70, 0)
score_quiz(quizzes, drop = TRUE)
score_quiz(quizzes, drop = FALSE)


#' @score_lab()
#' @description a function that takes a numeric value returns the lab score
#' @parameter numeric value x(lab attendance)
#' @return a numeric value of lab score
#' @example 
#' @score_lab(#)
score_lab <- function(x){
  if(x<=6){lab <- 0}
  else if(x==7){lab <- 20}
  else if(x==8){lab <- 40}
  else if(x==9){lab <- 60}
  else if(x==10){lab <- 80}
  else{lab <- 100}
  return(lab)
}
score_lab(12)
score_lab(10)
score_lab(6)




