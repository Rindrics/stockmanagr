#' Functions to help searching lambda in ridge VPA

#' Pass multiple lambda to \code{run_ridge_vpa}
#'
#' This function is a component of \code{\link{make_rhotable}}
#' @inheritParams frasyr::vpa
#' @inheritParams frasyr::retro.est
#' @param lambda Vector of multiple lambdas
#' @param sigma_constraint \code{sigma.constraint} in \code{\link[frasyr]{vpa}}
#' @param fcurrent_year \code{fc.year} in \code{\link[frasyr]{vpa}}
#' @param ... Other args to pass \code{\link[frasyr]{vpa}}
apply_lambda_to_ridge <- function(lambda,
                                  sigma_constraint,
                                  fcurrent_year,
                                  n,
                                  ...) {
  lambda %>%
    purrr::map(.f = run_ridge_vpa,
               sigma_constraint = sigma_constraint,
               fcurrent_year = fcurrent_year,
               ...) %>%
    lapply(frasyr::retro.est, n = n) %>%
    sapply(pull_mohns_rho)
}

#' Convert Mohn's rho table to data frame
#'
#' This function is a component of \code{\link{make_rhotable}}
#' @inheritParams apply_lambda_to_ridge
#' @param rhotable Output of \code{\link{apply_lambda_to_ridge}}
tidy_rhotable <- function(rhotable, lambda) {
  assertthat::assert_that(
                all(rownames(rhotable) == c("N", "B", "SSB", "R", "F")))
  rhotable %>%
    t() %>%
    cbind(lambda) %>%
    magrittr::set_colnames(c("N", "B", "SSB", "R", "F", "lambda")) %>%
    as.data.frame() %>%
    tidyr::gather(key   = var,
                  value = rho,
                  N, B, SSB, R, F)
}

#' Make Mohn's rho table
#'
#' @inheritParams apply_lambda_to_ridge 
#' @export
make_rhotable <- function(lambda, sigma_constraint, fcurrent_year, n = NULL, ...) {
  lambda %>%
    apply_lambda_to_ridge(sigma_constraint = sigma_constraint,
                          fcurrent_year    = fcurrent_year,
                          n = n,
                          ...) %>%
    tidy_rhotable(lambda = lambda)
}

#' Plot Mohn's rho table for visual check
#'
#' Actual decision process should be automated!
#'
#' @param rhotable_df Table of Mohn's rho in data frame format
#' @param log_abs If TRUE, plot logarithm of absolute value
#' @export
plot_rhos <- function(rhotable_df, log_abs = TRUE) {
  rhotable_df %>%
    ggplot2::ggplot(ggplot2::aes(x     = lambda,
                                 y     = logabs(rho, convert = log_abs),
                                 group = var,
                                 color = var)) +
    ggplot2::geom_point() +
    ggplot2::geom_line()
}
