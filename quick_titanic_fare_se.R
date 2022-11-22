# author: Tiffany Timbers
# date: 2020-01-15

"This script calculates the standard error for any numerical vector
from a csv file. This script takes an unquoted column name and a data file path.

Usage: quick_titanic_fare_se.R --file_path=<file_path> --var=<var>

Options:
-f <file_path> --file_path=<file_path>   Path to the data file
-v=<var> --var=<var>                     Unquoted column name of the numerical vector for which to calculate the se
" -> doc

library(tidyverse)
library(testthat)
library(docopt)

opt <- docopt(doc)

main <- function(file_path, var) {

  # read in data
  data <- read_csv(file_path)

  # print out statistic of variable of interest
  out <- data %>%
    pull({{var}}) %>%
    sterror()
  print(out)
}

#' calculate standard error
#'
#' @param x a vector of numeric values
#' @return the standard error of x as a numeric vector of length one
#' @examples
#' sterror(mtcars$hp)
sterror <- function(x) {
  sd(x, na.rm = TRUE) / sqrt(length(x))
}

test_that("sterror should return 0 if vector values are all the same", {
    expect_equal(sterror(c(1, 1, 1)), 0)
})

main(opt[["file_path"]], opt[["var"]])
