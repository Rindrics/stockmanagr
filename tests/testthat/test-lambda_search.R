context("Lambda_search in ridge VPA")

test_that("tidy_rhotable works", {
  varnames   <- c("N", "B", "SSB", "R", "F")
  tbl_before <- 
    matrix(c(-2.118404, -2.157943, -2.132014, -2.098733, -2.163787, -2.149476,
             -2.170569, -2.325621, -2.001638, -2.049405, -2.022278, -1.982812,
             -2.011176, -1.990908, -2.009495, -2.143974, -1.734855, -1.801517,
             -1.769050, -1.714198, -1.659488, -1.629757, -1.642751, -1.740918,
             -2.407814, -2.407694, -2.410137, -2.407485, -2.705792, -2.700279,
             -2.718490, -2.931349, -1.045139, -1.105103, -1.087987, -1.040322,
             -1.055663, -1.014287, -1.021474, -1.120341),
           nrow = 5) %>%
    magrittr::set_rownames(varnames)

  lambda    <- seq(0.1, 0.8, by = 0.1)
  tbl_after <- tidy_rhotable(tbl_before, lambda = lambda)
  expect_equal(colnames(tbl_after), c("lambda", "var", "rho"))
  expect_equal(nrow(tbl_after), ncol(tbl_before) * nrow(tbl_before))
  expect_equal(unique(tbl_after$lambda), lambda)
  expect_equal(unique(tbl_after$var), varnames)
})
