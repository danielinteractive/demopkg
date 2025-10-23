library(shinytest2)
packageVersion("shinytest2")

# Basic operation.
app <- AppDriver$new("../app")

app$get_screenshot()

# Can use then together with testthat.
library(testthat)

test_that("plot looks as expected", {
  app$set_inputs(cut = "Fair")
  app$wait_for_value(output = "plot")
  plot_result <- app$get_value(output = "plot")
  expect_snapshot(plot_result)
})

# For Help:
?AppDriver
