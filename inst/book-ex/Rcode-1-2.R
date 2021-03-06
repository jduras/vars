series <-  rnorm(1000)
y.st <- filter(series, filter=c(0.6, -0.28),
               method='recursive')
ar2.st <- arima(y.st, c(2, 0, 0), include.mean=FALSE,
                transform.pars=FALSE, method="ML")
ar2.st$coef
polyroot(c(1, -ar2.st$coef))
Mod(polyroot(c(1, -ar2.st$coef)))
root.comp <- Im(polyroot(c(1, -ar2.st$coef)))
root.real <- Re(polyroot(c(1, -ar2.st$coef)))
# Plotting the roots in a unit circle
x <- seq(-1, 1, length = 1000)
y1 <- sqrt(1- x^2)
y2 <- -sqrt(1- x^2)
plot(c(x, x), c(y1, y2), xlab='Real part',
     ylab='Complex part', type='l',
     main='Unit Circle', ylim=c(-2, 2), xlim=c(-2, 2))
abline(h=0)
abline(v=0)
points(Re(polyroot(c(1, -ar2.st$coef))),
       Im(polyroot(c(1, -ar2.st$coef))), pch=19)
legend(-1.5, -1.5, legend="Roots of AR(2)", pch=19)
