
<!-- README.md is generated from README.Rmd. Please edit that file -->

# histomaker Package

<!-- badges: start -->

<!-- badges: end -->

The goal of histomaker is to easily plot a histogram using
user-specified data and be able to change aethetics efficiently!

## Installation

Package installation can be done directly by calling
`devtools::install_github("kelsey-mcguire/histomaker")`

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(histomaker)
## basic example code

# EXAMPLES USE RANDOM DATASET (BELOW)
## create a random dataset that has an ID and value column where values are distributed normally
random_data <- data.frame(id = 1:132, values = rnorm(n=132, mean = 23, sd = 7))

# EXAMPLE 1: NO AESTHETICS APPLIED
## apply the histogram function, employing a bin width of 3 displaying the distribution of values
ex1 <- histo_function(random_data, values, 3)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
#> ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
#> ✔ forcats   1.0.0     ✔ readr     2.1.5
#> ✔ ggplot2   4.0.0     ✔ stringr   1.5.2
#> ✔ lubridate 1.9.4     ✔ tibble    3.3.0
#> ✔ purrr     1.1.0     ✔ tidyr     1.3.1
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
#> ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
#> 
#> Attaching package: 'rlang'
#> 
#> 
#> The following objects are masked from 'package:purrr':
#> 
#>     %@%, flatten, flatten_chr, flatten_dbl, flatten_int, flatten_lgl,
#>     flatten_raw, invoke, splice
#> 
#> 
#> 
#> Attaching package: 'testthat'
#> 
#> 
#> The following objects are masked from 'package:rlang':
#> 
#>     is_false, is_null, is_true
#> 
#> 
#> The following object is masked from 'package:purrr':
#> 
#>     is_null
#> 
#> 
#> The following objects are masked from 'package:readr':
#> 
#>     edition_get, local_edition
#> 
#> 
#> The following object is masked from 'package:tidyr':
#> 
#>     matches
#> 
#> 
#> The following object is masked from 'package:dplyr':
#> 
#>     matches

# EXAMPLE 2: AESTHETICS APPLIED
## corrected histogram column name to get a returned plot showing the distribution of height ranges
ex2 <- histo_function(random_data, values, 5, fill_colour = "hotpink")
```
