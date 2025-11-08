<!-- README.md is generated from README.Rmd. Please edit that file -->

# histomaker Package

<!-- badges: start -->

<!-- badges: end -->

The goal of histomaker is to easily plot a histogram using user-specified data and be able to change aethetics efficiently!

## Installation

Package installation can be done directly by calling `devtools::install_github("kelsey-mcguire/histomaker")`

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(histomaker)

# EXAMPLES USE REPRODUCIBLE RANDOM DATASET (BELOW)
set.seed(333)
random_data <- data.frame(id = 1:132, values = rnorm(n=132, mean = 23, sd = 7))

# EXAMPLE 1: NO AESTHETICS APPLIED
histo_function(random_data, values, 3)
```

<img src="man/figures/README-example-1.png" width="100%"/>

``` r

# EXAMPLE 2: AESTHETICS APPLIED
histo_function(random_data, values, 5, fill_colour = "hotpink")
```

<img src="man/figures/README-example-2.png" width="100%"/>
