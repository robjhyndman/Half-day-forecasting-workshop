# Lab 1

autoplot(qcement)
train <- window(qcement, end=c(2009,4))
test <- window(qcement, start=c(2010,1))
fc1 <- snaive(train, h=17)
checkresiduals(fc1)

# Lab 2

fc2 <- meanf(train, h=17)
fc3 <- rwf(train, drift=TRUE, h=17)
fc4 <- naive(train, h=17)
accuracy(fc1, test)
accuracy(fc2, test)
accuracy(fc3, test)
accuracy(fc4, test)

autoplot(fc1) +
  autolayer(test, series="Test data")

# Lab 3

fit <- auto.arima(train, lambda=0, 
                  stepwise=FALSE,
                  approximation=FALSE,
                  max.order = 9)
fc5 <- forecast(fit, h=17)
checkresiduals(fc5)
accuracy(fc5, test)
autoplot(fc5) + autolayer(test, series="Test")

# Lab 4

ausgdp <- ts(read.csv("gdpcknaaoq.csv")[,1],
             start=c(1959,3), frequency=4)
