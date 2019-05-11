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
