
"This script calculates the standard error for any numerical vector
from a csv file. This script takes an unquoted column name and a data file path.

Usage: quick_titanic_fare_se.R --file_path=<file_path> --var=<var>

Options:
--file_path=<file_path>   Path to the data file
--var=<var>               Unquoted column name of the numerical vector for which to calculate the se
" -> doc

library(docopt)
opt <- docopt(doc)
print(opt)
