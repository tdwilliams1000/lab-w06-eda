#' ---
#' title: "Data Science Methods, Lab for Week 99"
#' author: "Your Name"
#' email: Your Email
#' output:
#'   html_document:
#'     toc: true
#' ---

#' In this lab, we'll be looking at a set of housing sales data assembled by Dean De Cock of Truman State University in Missouri.  The dataset has been widely used for learning about predictive modeling or machine learning.  But we'll focus on using the techniques from today's notes to get a handle on a dataset with dozens of variables.  
#' 
#' De Cock's paper documenting the dataset is here:  <http://jse.amstat.org/v19n3/decock.pdf>.  The abstract notes notes some major features of the dataset:  
#' > This paper presents a data set describing the sale of individual residential property in Ames, Iowa from 2006 to 2010. The data set contains 2930 observations and a large number of explanatory variables (23 nominal, 23 ordinal, 14 discrete, and 20 continuous) involved in assessing home values. 
#' 
#' We'll be accessing the dataset using the `AmesHousing` package.  It'll be useful to have the documentation for `AmesHousing::ames_raw` open, because it gives short descriptions of the many variables in the dataset:  <https://cran.r-project.org/web/packages/AmesHousing/AmesHousing.pdf>.  You can find a full codebook for the dataset at <http://jse.amstat.org/v19n3/decock/DataDocumentation.txt>. 
#' 

## Setup
## **IMPORTANT**: Add all dependencies to `DESCRIPTION`
library(tidyverse)
library(skimr)
library(visdat)

library(AmesHousing)

dataf = make_ames()

## To check your answers locally, run the following: 
## testthat::test_dir('tests')


#' # Problem 1 #
#' We'll start with Peng and Matsui's step 1, "Formulate your question."  The Ames dataset is often used to teach predictive modeling tasks, where the goal is to predict the final selling price.  So our question will be *which variables in the dataset are mostly highly correlated with sale price?* 
#' 
#' 1. Look through the short descriptions in `?ames_raw` (or online, <https://cran.r-project.org/web/packages/AmesHousing/AmesHousing.pdf>).  Which variable reports the actual sale price? 
#' 
#' 
#' 
#' 2. As you were looking through the variable descriptions, you probably noticed a few variables that might be good predictors of sale price.  List two or three here. 
#' 
#' 

#' # Problem 2 #
#' We've already loaded the data, so let's jump to step 3, "Check the packaging," and 5, "Check your 'n's." Use `skimr::skim()` and `vis_dat` functions to answer the following questions.  To report the values that you find, replace the value assigned to the `problem` variable.  
#' 
#' 1. The paper abstract (see above) reports 2930 rows.  How many observations (rows) are in our version of the dataset?  
#' 
problem2.1 = 1.7e15 # that's 1.7 x 10^15

#' 2. The abstract also reports 80 "explanatory variables (23 nominal, 23 ordinal, 14 discrete, and 20 continuous)."  In R, factors are used for both nominal and ordinal; and numerics are used for both discrete and continuous. How many of each are in our version?  
#' 
problem2.2.factors = 7
problem2.2.numerics = 12

#' 3. Explain any discrepancies here. 
#' 
#' 
#' 
#' 4. How many variables have missing values?  
#' 
problem2.4 = 937


#' # Problem 3 #
#' `summarize()` is a tidyverse function that collapses multiple rows of data into a single row.  Like `mutate()`, it respects groups constructed by `group_by()`.  Here's an example: 
#' 
dataf %>% 
    group_by(MS_Zoning) %>% 
    summarize(Sale_Price = mean(Sale_Price)) %>% 
    ungroup()

#' 1. Examine the full codebook, at <http://jse.amstat.org/v19n3/decock/DataDocumentation.txt>.  What do the values of MS_Zoning represent? 
#' 
#' 
#' 
#' 2. Run the following two expressions.  Why do they give different results? 
#' 
dataf %>% 
    group_by(MS_Zoning) %>% 
    filter(Sale_Price > 100000) %>% 
    summarize(Sale_Price = mean(Sale_Price)) %>% 
    ungroup()

dataf %>% 
    group_by(MS_Zoning) %>% 
    summarize(Sale_Price = mean(Sale_Price)) %>% 
    filter(Sale_Price > 100000) %>% 
    ungroup()
#' 
#' 
#' 
#' 

- Huebner et al.
    - duplicate records
        - distinct()
    - direction of coding (quality? some others?)
    - ceilings and floors using skimr
    - missing data
- correlation
    - filtering 
        - select_if() version
        - to select continous and factor vars
    - Spearman correlation
    - top_n()
