#' Calculates an exponential moving average (EMA) for a provided stock
#'
#' Computes an EMA for a given numeric or xts (a time‑indexed data structure) price series.
#'
#' @param x A numeric vector or xts object containing price data
#' @param n The number of periods to use for the EMA calculation
#'
#' @return An xts object or numeric vector containing the EMA values
#'
#' @export
calculateEma <- function(x, n = 10) {
  TTR::EMA(x, n = n)
}