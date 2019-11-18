context("Select good lambda after running exploratory ridge VPA")

# Make lambda table
set.seed(1234)
lambda     <- seq(0.1, 1, by = 0.1)
var        <- c("N", "B", "SSB", "R", "F")
rho_table  <- expand.grid(lambda, var) %>%
  magrittr::set_colnames(c("lambda", "var")) %>%
  dplyr::mutate(var = as.character(var)) %>%
  dplyr::rowwise() %>%
  dplyr::mutate(rho = rnorm(1)) # Distribution pattern of rho is different from actual situation

test_that("select two best lambdas", {
  # Note that lambdas returned are not neighbors because the rho values are dummy
  expect_equal(select_good_lambda(rho_table,
                                  select_by_retro_bias_of = "N",
                                  n_returned = 2),
               c(0.2, 0.5))

  expect_equal(select_good_lambda(rho_table,
                                  select_by_retro_bias_of = "B",
                                  n_returned = 2),
               c(0.4, 0.6))

  expect_equal(select_good_lambda(rho_table,
                                  select_by_retro_bias_of = "SSB",
                                  n_returned = 2),
               c(0.1, 0.9))

  expect_equal(select_good_lambda(rho_table,
                                  select_by_retro_bias_of = "F",
                                  n_returned = 2),
               c(0.4, 1.0))

  expect_equal(select_good_lambda(rho_table,
                                  select_by_retro_bias_of = "B",
                                  n_returned = 2),
               c(0.4, 0.6))

})

test_that("select one best lambdas", {

  expect_equal(select_good_lambda(rho_table,
                                  select_by_retro_bias_of = "N",
                                  n_returned = 1),
               0.2)

  expect_equal(select_good_lambda(rho_table,
                                  select_by_retro_bias_of = "B",
                                  n_returned = 1),
               0.4)

  expect_equal(select_good_lambda(rho_table,
                                  select_by_retro_bias_of = "SSB",
                                  n_returned = 1),
               0.9)

  expect_equal(select_good_lambda(rho_table,
                                  select_by_retro_bias_of = "F",
                                  n_returned = 1),
               0.4)

  expect_equal(select_good_lambda(rho_table,
                                  select_by_retro_bias_of = "B",
                                  n_returned = 1),
               0.4)

})
