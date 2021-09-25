source("../lab.R", chdir = TRUE)
library(testthat)

warning('Problem 1 not checked automatically')

test_that('2.2. Fixing names', {
    expect_equal(names(dataf), 
                 {ames_raw %>% 
                         names() %>% 
                         make.names() %>% 
                         tolower()})
})

test_that("3.1. How many observations?", {
    expect_equal(problem3.1, 2930L)
})

test_that("3.2. How many variables?", {
    expect_equal(problem3.2.factors, 0L)
    expect_equal(problem3.2.characters, 45L)
    expect_equal(problem3.2.numerics, 37L)
})

test_that("3.4. Missing values", {
    expect_equal(problem3.4, 27L)
})

warning('Problem 4 not checked automatically')

test_that('5. Duplicate rows', {
    expect_equal(n_duplicate, 0L)
})

test_that('6.2. Count of houses by exterior condition', {
    expect_equal(nrow(ex_cond_count), 5L)
})

test_that('6.4. Exterior condition factor as an integer', {
    correct_levels = c('Po', 'Fa', 'TA', 'Gd', 'Ex')
    correct_int = as.integer(fct_relevel(ames_raw$`Exter Cond`, 
                                         correct_levels))
    expect_identical(char_to_int(ames_raw$`Exter Cond`), 
                     correct_int)
})

test_that('6.7. Apply `char_to_int` to several columns', {
    expect_identical(char_to_int(ames_raw$`Exter Cond`), dataf$exter.cond)
    expect_identical(char_to_int(ames_raw$`Bsmt Cond`), dataf$bsmt.cond)
    expect_identical(char_to_int(ames_raw$`Heating QC`), dataf$heating.qc)
    expect_identical(char_to_int(ames_raw$`Garage Cond`), dataf$garage.cond)
})


test_that('7.1. Dimensions of cor_matrix', {
    expect_identical(dim(cor_matrix), c(41L, 41L))
})

test_that('7.4. Top 10 variables', {
    expect_equal(top_10$covar, 
                 c('saleprice', 'overall.qual', 'gr.liv.area', 
                   'garage.cars', 'year.built', 'garage.area', 
                   'garage.yr.blt', 'full.bath', 'total.bsmt.sf', 
                   'year.remod.add'))
})
