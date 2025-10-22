test_that("sum_two_numbers works", {
  expect_equal(sum_two_numbers(4, 1), 5)
  expect_equal(sum_two_numbers(-2, 2), 0)
  expect_equal(sum_two_numbers(0, 0), 0)
})
