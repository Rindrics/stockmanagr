#' Select good lambda with minimum absolute of Mohn's rho of given variable
#'
#' @param mohns_rho_tbl Output of \code{\link{make_rhotable}}
#' @param select_by_retro_bias_of Character string of variable one of
#' \describe{
#'   \item{"N"}{number of fishes}
#'   \item{"B"}{biomass}
#'   \item{"SSB"}{spawning stock biomass}
#'   \item{"R"}{recruitment}
#'   \item{"F"}{fishing mortality coefficient}
#' }
#' @param n_returned Number of lambdas to be returned. \code{n_returned = 2} is
#' appropriate for finding candidates in the first run with large step,
#' and \code{n_returned} is for deciding the best value in the final run with
#' small step.
#' @export
select_good_lambda <- function(mohns_rho_tbl, select_by_retro_bias_of,
                               n_returned) {
  assertthat::assert_that(
                all(colnames(mohns_rho_tbl) == c("lambda", "var", "rho")))
  tbl_single_var <- mohns_rho_tbl %>%
    dplyr::filter(var == select_by_retro_bias_of) %>%
    dplyr::mutate(abs_rho = abs(rho))

  rho_threshold <- tbl_single_var %>%
    dplyr::arrange(abs_rho) %>%
    dplyr::slice(1:n_returned) %>%
    dplyr::pull(abs_rho) %>%
    max()

  tbl_single_var %>%
    dplyr::filter(abs_rho <= rho_threshold) %>%
    dplyr::pull(lambda)
}
