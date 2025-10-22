
<!-- README.md is generated from README.Rmd. Please edit that file -->

# demopkg

<!-- badges: start -->

[![R-CMD-check](https://github.com/danielinteractive/demopkg/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/danielinteractive/demopkg/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of `demopkg` is to illustrate how to build and publish an R
package.

## Installation

You can install the development version of `demopkg` from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("danielinteractive/demopkg")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(demopkg)

print_hello()
#> [1] "Hello, world!"
sum_two_numbers(4, 1)
#> [1] 5
```
