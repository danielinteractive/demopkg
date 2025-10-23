source("bootstrap.R")

library(profvis)
try_impl <- impl_3
profile <- profvis({
  set.seed(1337)
  results <- try_impl(population)
})
print(profile)
