# Code under MIT License by Michael Mayer and Lukas Widmer.
# See file LICENSE.
# Original code at https://github.com/luwidmer/fastR-website/blob/master/materials/2023-12-06%20BBS%20Next%20Gen/code/fastR-example-code/optimizebootstrap.R. # nolint
# Adapted by Daniel Sabanes Bove, March 2024.

library(tidyverse)
library(data.table)

n_patients <- 1000
bootstrap_n <- 5000
bootstrap_size <- 100

set.seed(1337)
population <- data.table(
  patient_id = 1:n_patients,
  dummy_measurement = runif(n_patients),
  analysis_flag = rbinom(n_patients, 1, 0.8) > 0
)
table(population$analysis_flag)

impl_1 <- function(population) {
  result <- NULL
  for (i in seq_len(bootstrap_n)) {
    bootstrap_data_rows <- sample(
      x = seq_len(nrow(population)),
      size = bootstrap_size,
      replace = TRUE
    )
    current_bootstrap <- population[bootstrap_data_rows, ]
    analysis_pop <- filter(current_bootstrap, analysis_flag == TRUE)
    current_result <- tibble(
      bootstrap_index = i,
      computed_output = median(analysis_pop$dummy_measurement)
    )
    result <- bind_rows(result, current_result)
  }
  return(result)
}

# second version of the function, impl_2, only updates vectors
# inside the loop and then creates a tibble once at the end
impl_2 <- function(population) {
  result <- NULL
  medians <- numeric(bootstrap_n)
  for (i in seq_len(bootstrap_n)) {
    bootstrap_data_rows <- sample(
      x = seq_len(nrow(population)),
      size = bootstrap_size,
      replace = TRUE
    )
    current_bootstrap <- population[bootstrap_data_rows, ]
    analysis_pop <- filter(current_bootstrap, analysis_flag == TRUE)
    medians[i] <- median(analysis_pop$dummy_measurement)
  }
  result <- tibble(
    bootstrap_index = seq_len(bootstrap_n),
    computed_output = medians
  )
  return(result)
}

# In a third version impl_3 only subset
# the column instead of the whole data.frame.
impl_3 <- function(population) {
  result <- NULL
  medians <- numeric(bootstrap_n)
  for (i in seq_len(bootstrap_n)) {
    bootstrap_data_rows <- sample(
      x = seq_len(nrow(population)),
      size = bootstrap_size,
      replace = TRUE
    )
    bootstrapped_analysis_flag <- population$analysis_flag[bootstrap_data_rows]
    bootstrapped_dummy_measurement <- population$dummy_measurement[bootstrap_data_rows]
    analysis_pop_measurements <- bootstrapped_dummy_measurement[bootstrapped_analysis_flag]

    medians[i] <- median(analysis_pop_measurements)
  }
  result <- tibble(
    bootstrap_index = seq_len(bootstrap_n),
    computed_output = medians
  )
  return(result)
}
