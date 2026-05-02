#' Plots weekly closing prices with 10-week and 20-week EMAs
#'
#' Creates a line chart showing the stock's weekly closing prices along with
#' the 10-week and 20-week EMAs used in the short-term trend signal.
#'
#' @param ticker A stock ticker symbol (for example, "AAPL", "IBM")
#'
#' @param days Number of days of history to include in the plot (default: 365)
#'
#' @return A plot visualizing the price and EMA trend comparison.
#'
#' @export
plotShortTermTrend <- function(ticker, days = 365) {

  data <- getStockWeekly(ticker)

  cutoff <- Sys.Date() - days
  data <- data[zoo::index(data) >= cutoff]

  closePrices <- data[, 4]

  ema10 <- calculateEma(closePrices, 10)[,1]
  ema20 <- calculateEma(closePrices, 20)[,1]

  aligned <- na.omit(merge(closePrices, ema10, ema20))

  if (nrow(aligned) == 0) {
    stop("No data available after aligning EMAs.")
  }

  # extract aligned values
  dates <- zoo::index(aligned)
  closePrices <- as.numeric(aligned[,1])
  ema10 <- as.numeric(aligned[,2])
  ema20 <- as.numeric(aligned[,3])

  # plot price
  plot(dates, closePrices, type = "l", col = "black", lwd = 2,
       main = paste("Short-Term Trend for", ticker),
       ylab = "Price", xlab = "Date")

  # add EMAs
  lines(dates, ema10, col = "limegreen", lwd = 2)
  lines(dates, ema20, col = "red", lwd = 2)

  # legend
  legend("topleft",
         legend = c("Price", "10-week EMA", "20-week EMA"),
         col = c("black", "limegreen", "red"),
         lwd = 2)

  invisible(NULL)
}
