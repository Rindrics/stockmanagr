#' Run ridge VPA
#'
#' @inheritParams frasyr::vpa
#' @param sigma_constraint Equals to \code{sigma.const} in \code{\link[frasyr]{vpa}}
#' @param fcurrent_year Equals to \code{fc.year} in \code{\link[frasyr]{vpa}}
#' @param ... Other arguments to pass to \code{\link[frasyr]{vpa}}
#' @export
run_ridge_vpa <- function(sigma_constraint, lambda, dat, fcurrent_year, ...) {
  cat(paste0("lambda = ", lambda, "..."))
  result <- frasyr::vpa(fc.year          = fcurrent_year,
                        sigma.constraint = sigma_constraint,
                        lambda           = lambda,
                        tune             = TRUE,
                        ...)
  cat("done.\n")
  invisible(result)
}

#' Pull Mohn's rho from output of ridge VPA
#'
#' @param result_ridge_vpa Output of \code{link[frasyr]{vpa}}
pull_mohns_rho <- function(result_ridge_vpa) {
  result_ridge_vpa$mohn
}
