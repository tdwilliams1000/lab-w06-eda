source("../lab.R", chdir = TRUE)
library(testthat)

warning('Problem 1 not checked automatically')

test_that("2.1. How many observations?", {
    expect_identical(problem2.1, 2930L)
})

test_that("2.2. How many variables?", {
    expect_identical(problem2.2.factors, 46L)
    expect_identical(problem2.2.numerics, 35L)
})

test_that("2.2. Missing values", {
    expect_identical(problem2.4, 0L)
})

warning('Problem 3 not checked automatically')
