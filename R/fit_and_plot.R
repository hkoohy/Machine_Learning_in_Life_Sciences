#' To fit a LR model into cummulated data, and plot it. It will require hits from the get_normliazed_number_of_hits function.
#' @param hits and years
#' @return nothing will be return. A scatter plot will be done and a line will be fitted into it.
#' @export
#' @author hk
fit_and_plot <- function(hits, years){
  x <- years[1:11]
  y <- hits[1:11]
  plot(y ~ x, xlim=c(1990,2017), ylim=c(0, 1.3), lwd=5, pch=5, xlab=c('Years'), ylab = c('% Publications in Pubmed using a ML technique'),
       cex.axis=1.5, cex.lab=1.5)
  # fit a linear reg
  lm1 <- lm(y ~ x)
  cat("First lm: \n")
  print(lm1)
  x1 <- c(1990, 2000)
  y1 <- predict(lm1, newdata=data.frame(x=x1))
  lines(y1~x1, lwd=3, col='red')
  
  # second part
  x <- years[11:27]
  y <- hits[11:27]
  lm2 <- lm(y~x)
  cat('Second lm: \n')
  print(lm2)
  
  x2 <- c(2000, 2017)
  y2 <- predict(lm2, newdata=data.frame(x=x2))
  points(y ~ x, xlim=c(1990,2017), ylim=c(0, 1.3), lwd=5, pch=4)
  lines(y2 ~ x2, lwd=3, col='red')
} #fit_and_plot#

