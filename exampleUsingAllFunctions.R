library(stockHelper)

getStockWeekly("SBUX")

calculateEma(1:50, 10)

shortTermSignal("SBUX")

longTermSignal("SBUX")

plotShortTermTrend("SBUX")

plotShortTermTrend("SBUX", days=765)