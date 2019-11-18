#' Convert value to logarithm of absolute
#'
#' @param x The value to be converted
#' @param convert If FALSE, x will be returned without conversion
logabs <- function(x, convert) {
  if (convert == FALSE) return(x)
  log(abs(x))
}
