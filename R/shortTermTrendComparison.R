#' Generates a short-term trading signal based on EMA crossovers, that is if the 10 week is above the 20, its bullish, opposite being true means bearish
#'
#' Uses the 10-week and 20-week EMAs to determine whether a stock is in a
#' short-term bullish or bearish trend.
#'
#' @param ticker A stock ticker symbol (for example, "AAPL", "IBM")
#'
#' @return A sentence stating that the stock is in a bullish trend if the 10-week EMA is above the 20-week EMA,
#'         otherwise it is in a bearish trend, 20 above the 10.
#'
#' @export
shortTermSignal <- function(ticker) {
  
  # Get weekly OHLC data
  data <- getStockWeekly(ticker)
  
  # Extract closing prices
  closePrices <- data[, 4]   # 4th column = Close
  
  # Calculate EMAs
  ema10Week <- calculateEma(closePrices, 10)
  ema20Week <- calculateEma(closePrices, 20)
  
  # Compare the most recent values
  if (tail(ema10Week, 1) > tail(ema20Week, 1)) {
    return("The stock is currently in a short-term bullish trend!")
  } else {
    return("The stock is currently in a short-term bearish trend!")
  }
}