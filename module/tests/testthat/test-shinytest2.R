library(shinytest2)

test_that("{shinytest2} recording: module", {
  app <- AppDriver$new(variant = platform_variant(), name = "module", height = 695,
      width = 1235)
  app$set_inputs(`hist1-var` = "disp")
  app$set_inputs(`hist1-bins` = 11)
  app$set_inputs(`hist1-bins` = 12)
  app$set_inputs(`hist1-bins` = 13)
  app$expect_values()
  app$expect_screenshot()
})
