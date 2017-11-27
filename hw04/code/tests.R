# Script containing unit tests
#library(testthat)
#source('functions.R')

context("Remove missing")
test_that("the NA in the vector is removed",{
  a <- c(1, 2, 3)
  b <- c(1, 2, 3, NA)
  expect_equal(remove_missing(a),a)
  expect_equal(remove_missing(b),a)
})

context("Get minimum")
test_that("the function give the minimum of vector",{
  a <- c(1, 2, 3)
  b <- c(1, 2, 3, NA)
  expect_equal(get_minimum(a),1)
  expect_equal(get_minimum(b),1)
})

context("Get maximum")
test_that("the result is maximum",{
  a <- c(1, 2, 3)
  b <- c(1, 2, 3, NA)
  expect_equal(get_maximum(a),3)
  expect_equal(get_maximum(b),3)
})

context("Get range")
test_that("get range works",{
  a <- c(1, 2, 3)
  b <- c(1, 2, 3, NA)
  expect_equal(get_range(a),2)
  expect_equal(get_range(b),2)
})

context("Get median")
test_that("get median works",{
  a <- c(1, 2, 3)
  b <- c(1, 2, 3, NA)
  expect_equal(get_median(a),2)
  expect_equal(get_median(b),2)
})

context("Get average")
test_that("get average works",{
  a <- c(1, 2, 3)
  b <- c(1, 2, 3, NA)
  expect_equal(get_average(a),2)
  expect_equal(get_average(b),2)
})

context("Get Standard deviation")
test_that("get_stdev works",{
  a <- c(1, 2, 3)
  b <- c(1, 2, 3, NA)
  expect_equal(get_stdev(a),sd(a))
  expect_equal(get_stdev(b),sd(a))
})

context("Get quartile one")
test_that("get_quartile1 works",{
  a <- c(1, 2, 3)
  b <- c(1, 2, 3, NA)
  expect_equal(get_quartile1(a),quantile(a,0.25)[[1]])
  expect_equal(get_quartile1(b),quantile(b,0.25,na.rm = TRUE)[[1]])
})

context("Get quartile three")
test_that("get_quartile3 works",{
  a <- c(1, 2, 3)
  b <- c(1, 2, 3, NA)
  expect_equal(get_quartile3(a),quantile(a,0.75)[[1]])
  expect_equal(get_quartile3(b),quantile(b,0.75,na.rm = TRUE)[[1]])
})

context("Count missing")
test_that("count missing works",{
  a <- c(1, 2, 3)
  b <- c(1, 2, 3, NA)
  expect_equal(count_missing(a),0)
  expect_equal(count_missing(b),1)
})

context("Summary stats")
test_that("summarystats give a list",{
  a <- c(1, 2, 3)
  b <- c(1, 2, 3, NA)
  expect_true(is.list(summary_stats(a)))
  expect_true(is.list(summary_stats(b)))
})

context("Rescale")
test_that("rescale works",{
  b <- c(18, 15, 16, 4, 17, 9)
  
  expect_equal(rescale100(b, xmin = 0, xmax = 20),c(90,75,80,20,85,45))
})

context("Drop lowest")
test_that("drop lowest works",{
  b <- c(10, 10, 8.5, 4, 7, 9)
  expect_equal(drop_lowest(b), c(10.0 ,10.0, 8.5, 7.0, 9.0))
})

context("Score homeworks")
test_that("score_homeworks works by optional argument drop",{
  hws <- c(100, 80, 30, 70, 75, 85)
  expect_equal(score_homework(hws,drop=TRUE),82)
  expect_equal(score_homework(hws,drop=FALSE),220/3)
})


context("Score quiz")
test_that("score quiz works with optional argument drop",{
  quizzes <- c(100, 80, 70, 0)
  expect_equal(score_quiz(quizzes,drop = TRUE),250/3)
  expect_equal(score_quiz(quizzes,drop = FALSE),62.5)
})

context("SCore lab")
test_that("score lab works with different attendance range",{
  expect_equal(score_lab(12),100)
  expect_equal(score_lab(10),80)
  expect_equal(score_lab(6),0)
})