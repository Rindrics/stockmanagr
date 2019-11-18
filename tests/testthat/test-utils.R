context("Util functions")

test_that("logabs() return logarithm of absolute", {
  expect_equal(logabs(exp(2),  convert = TRUE),  2)
  expect_equal(logabs(exp(-2), convert = TRUE), -2)
  expect_equal(logabs(1,       convert = TRUE),  0)
  expect_equal(logabs(2,       convert = TRUE),  0.6931472, tolerance = 1e-07)
})

test_that("logabs() return input value as is", {
  expect_equal(logabs(exp(2),  convert = FALSE),  exp(2))
  expect_equal(logabs(exp(-2), convert = FALSE),  exp(-2))
  expect_equal(logabs(1,       convert = FALSE),  1)
  expect_equal(logabs(2,       convert = FALSE),  2)
})
