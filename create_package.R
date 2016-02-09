install.packages(c("devtools", "roxygen2", "testthat", "knitr"))
devtools::install_github("hadley/devtools")
install.packages("rstudioapi")
rstudioapi::isAvailable("0.99.149")

library(devtools)
library(roxygen2)
has_devel()
create("cats")
