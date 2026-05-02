#' Gets the weekly data of a stock using the OHLC data
#'
#' Downloads weekly OHLC data for a given stock ticker.
#'
#' @param ticker A stock ticker symbol (for example, "AAPL", or "IBM")
#'
#' @return Weekly OHLC data as an xts object
#'
#' @export
getStockWeekly <- function(ticker) {
  quantmod::getSymbols(ticker, auto.assign = FALSE, periodicity = "weekly")
}
