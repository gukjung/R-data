cov(1:5, 2:6)
cov(1:5, c(3,3,3,3,3))
cov(1:5, 5:1)
cov(1:5, c(5000,4000,3000,2000,1000))

cor(1:5, 5:1)
cor(1:5, c(5000,4000,3000,2000,1000))

#음료 자료로 상관관계 분석 drinking_water.csv
result <- read.csv("testdata/drinking_water.csv")
result
head(result)
summary(result)
sd(result$적절성)
sd(result$친밀도)
sd(result$만족도)

hist(result$적절성)
hist(result$친밀도)
hist(result$만족도)

cov(result$친밀도, result$적절성)
cov(result)

help(cor)
?cor
cor(result$친밀도, result$적절성)
cor(result$친밀도, result$만족도)
cor(result)
cor(result, method = 'pearson')

symnum(cor(result))

install.packages("corrgram")
library(corrgram)
corrgram(result)
corrgram(result, upper.panel = panel.conf)
corrgram(result, lower.panel = panel.conf)

install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)
chart.Correlation(result)
chart.Correlation(result, histogram = , pch="+")

#부모의 IO로 자식의 i 예측
x <- c(110,120,130,140,150)
y <- c(100,105,128,115,142)
cor(x, y)
x_dev <- x - mean(x)
y_dev <- y - mean(y)
dev_mul <- (x - mean(x)) * (y - mean(y))
square <- x_dev ** 2
df <- data.frame(x, y, x_dev, y_dev, dev_mul, square)
df
mean(df$x) #130
mean(df$y) #118
sum(df$dev_mul) # 940
sum(df$square) # 1000

# 기울기
940/1000 # 0.94
118 - 0.94 * 130 # 절편 -4.2
#yh = 0.94 * x + -4.2
yh
(0.94 * 110 + -4.2)
(0.94 * 150 + -4.2)
(0.94 * 90 + -4.2)

model <- lm(y ~ x)
plot(x, y)
abline(model, col = "blue")

predict(model, data.frame(x=c(50, 100,150, 200)))
