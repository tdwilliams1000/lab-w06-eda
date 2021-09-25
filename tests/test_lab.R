source("../lab.R", chdir = TRUE)
library(testthat)

warning('Problem 1 not checked automatically')

PROBLEM 2

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
    expect_equal(nrow(exter.cond), 5L)
})

test_that('6.4. Exterior condition factor as an integer', {
    correct_levels = c('Po', 'Fa', 'TA', 'Gd', 'Ex')
    correct_int = as.integer(fct_relevel(ames_raw$`Exter Cond`, correct_levels))
    expect_identical(char_to_int(ames_raw$`Exter Cond`), 
                     correct_int)
})

test_that('6.7. Apply `char_to_int` to several columns', {
    expect_identical(char_to_int(ames_raw$`Exter Cond`), dataf$exter.cond)
    expect_identical(char_to_int(ames_raw$`Bsmt Cond`), dataf$bsmt.cond)
    expect_identical(char_to_int(ames_raw$HeatingQC), dataf$heatingqc)
    expect_identical(char_to_int(ames_raw$`Garage Cond`), dataf$garage.cond)
})


PROBLEM 7

# test_that('6.1. `dataf_smol` contains all the factor and numeric variables from `dataf`', {
#     expect_identical(dataf_smol, select(dataf_fct, where(is.factor), where(is.numeric)))
# })


# test_that('6.4. Top 10 variables most strongly correlated with sale price', {
#     top_10_soln = structure(list(covar = c("Sale_Price", "Gr_Liv_Area", "Garage_Cars", 
#                                            "Year_Built", "Garage_Area", "Full_Bath",
#                                            "Total_Bsmt_SF", "Year_Remod_Add", 
#                                            "First_Flr_SF", "Fireplaces"), 
#                                  Sale_Price = c(1, 0.723342036109249, 
#                                                 0.701545429698005, 0.680822358625856, 
#                                                 0.660474678142175, 0.634160817015663, 
#                                                 0.606564291637224, 0.601453915476304, 
#                                                 0.581535848633275, 0.526137194835603
#                                  )), 
#                             row.names = c(NA, -10L), 
#                             class = c("tbl_df", "tbl", "data.frame"
#                             ))
#     
#     expect_equal(top_10, top_10_soln)
# })
