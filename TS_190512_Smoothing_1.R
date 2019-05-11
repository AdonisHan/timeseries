library(forecast)
data("AirPassengers")
m3 = filter(AirPassengers, filter = rep(1/3,3))
m6 = filter(AirPassengers, filter = rep(1/6,6))
m12 = filter(AirPassengers, filter = rep(1/12,12))
plot(AirPassengers,main="AirPassenger original")
par(mfrow=c(4,1))
plot(m3,main="AirPassenger 3-poing Moving average")
plot(m6,main="AirPassenger 6-poing Moving average")
plot(m12,main="AirPassenger 12-poing Moving average")

dd1 <- matrix(c(1342,1442,1252,1343, 1425,1362,1456,1272, 
                1243,1359,1412,1253, 1201,1478,1322,1406, 
                1254,1289,1497,1208 ))
dd1.ts = ts(data=dd1,start=c(2016,1), frequency = 4)
dd1.ts
plot(dd1.ts, main="Random Variation Time Series")

# Simple Moving Average Smoothing - Red color
# dd1 Random Variation time series - Black color
## ff is Simple Moving Average Smoothing
ff = filter(dd1.ts, filter = rep(1,4)/4, method="convolution", side="1")
plot(dd1.ts, main="simple Moving average Smoothing:dd1")
abline(h=mean(dd1), col="red")


# Residaul's Auto Correlation
# ff[-1:-3]
res_sma_smothing <- ff[-1:-3, ]
res_rvts <- dd1.ts[-1:-3, ]
res <- res_sma_smothing - res_rvts

tsdisplay(res, main="Residual by Moving Average: dd1")
Box.test(res)

# ff is Simple Moving Average Smoothing
# Forcast
forecast_smoothing <- forecast(ff,h=1)
forecast_smoothing

# Test - Mean Error, RMSE MAE MAPE etc
accuracy(forecast_smoothing)
