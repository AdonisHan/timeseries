library(forecast)

zz = ts(matrix(1:24, 8 ,3), s = c(2001,1), f=4, n=c("a","b","c"))
class(zz)
z1 <- zz[,"a"]
z1
z2 <- zz[,"a"] + zz[,"b"]
z2
z3 <- zz[,"a"] ^2 / zz[,"b"]
z3
ts.plot(zz, lty=1:3, main = "Multiple TS Data")
legend("bottomright", c("a","b","c", lty = 1:3))

diff(zz,2)
library(forecast)
# install.packages('forecast', dependencies = TRUE) 이렇게설치할것 권자
# 안되면 # install.packages("devtools")
# devtools::install_github("robjhyndman/forecast")
# 바로 예제로 들어가기W
# Data: Airpassengers
head(AirPassengers) 
# 간단히 이야기하면 1949~1960년까지 국제 항공여객의 월별 자료를 기록한 것.

plot(AirPassengers)

# Diff
plot(diff(AirPassengers))
# Box-Cox Transformation
lambda <- BoxCox.lambda(AirPassengers)
# install.packages("devtools")
