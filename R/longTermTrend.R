#' Generates a long-term trading signal based on the 200-week EMA, that is if the stock is trading above the 200 ema, 
#' its considered bullish, otherwise bearish
#' 
#' Determines whether a stock is in a long-term bullish or bearish trend by
#' comparing the most recent closing price to the 200-week EMA. If the price is
#' above the 200-week EMA, the trend is considered bullish; otherwise, it is bearish.
#'
#' @param ticker A stock ticker symbol (for example, "AAPL", "IBM")
#'
#' @return A sentence stating whether the stock is currently in a long-term
#'         bullish or bearish trend.
#'
#' @export
longTermSignal <- function(ticker) {
  
  # Get weekly OHLC data
  data <- getStockWeekly(ticker)
  
  # Extract closing prices
  closePrices <- data[, 4]   # 4th column = Close
  
  # Calculate 200-week EMA
  ema200 <- calculateEma(closePrices, 200)
  
  # Most recent price and EMA value
  latestPrice <- tail(closePrices, 1)
  latestEma200 <- tail(ema200, 1)
  
  # Compare price vs EMA200
  if (latestPrice > latestEma200) {
    return("The stock is currently in a long-term bullish trend!")
  } else {
    return("The stock is currently in a long-term bearish trend!")
  }
}