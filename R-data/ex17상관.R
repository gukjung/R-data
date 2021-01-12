# 단순회귀분석 : 독립변수(x)1(연속형), 종속변수(y)1(연속형)

women
# 키 자료로 몸무게 예측 모델 작성
# 귀무가설 : 키와 몸무게는 관련이 있다
# 대립가설 : 키와 몸무게는 관련이 없다


cor(women) # 0.995
plot(weight ~ height, data = women)

fit <- lm(weight ~ height, data = women)
fit
head(women, 2)
(3.45 * 58 + -87.52)
(3.45 * 68 + -87.52)

#요약 통걔량
summary(fit)
3.45/0.09114
37.85 ** 2

#1) 정규성 : 독립변수들의 잔차항이 정규분포를 따라야 한다.
#2) 독립성 : 독립변수들 간의 값이 서로 관련성이 없어야 한다.
#3) 선형성 : 독립변수의 변화에 따라 종속변수도 변화하나 일정한 패턴을 가지면 좋지 않다.
#4) 등분산성 : 독립변수들의 오차(잔차)의 분산은 일정해야 한다. 특정한 패턴 없이 고르게 분포되어야 한다.
#5) 다중공선성 : 독립변수들 간에 강한 상관관계로 인한 문제가 발생하지 않아야 한다.
#예) 나이와 학년이 신체 구조에 미치는 영향(교집합이 매우 커 다중공선성 우려). 아래 그림 참조.

par(mfrow=c(2,2))
plot(fit)
plot(fit, which = c(4,6))

#선형성을 만족하지 못할 경우
fit2 <- lm(weight ~ height + I(height ^ 2) , data = women)
summary(fit2)
plot(fit2)

#----------------------
#iris data로 회귀식
head(iris,3)
cor(iris$Sepal.Length, iris$Sepal.Width) #-0.1175698
cor(iris$Sepal.Length, iris$Petal.Length) #0.8717538

# 상관관계가 약한 변수로 모델 작성
result <- lm(formula = Sepal.Length ~ Sepal.Width, data = iris)
summary(result) # p-value:0.1519, multiple r-squared : 0.01382

result2 <- lm(formula = Sepal.Length ~ Petal.Width, data = iris)
summary(result2)  # p-value:2.2e-16, multiple r-squared :  0.669 # 1에 가까워짐

#-------------------------------
# car data로 회귀식
head(cars, 3)
cor(cars)
mo <- lm(dist ~ speed, cars) # 두 변수간 인과관계가 있으므로 회귀분석
mo
names(mo)
residuals(mo)[1,4]
confint(mo)
coef(mo)

head(cars, 3)
coef(mo)[1] + coef(mo)[2] * 7
coef(mo)[1] + coef(mo)[2] * 10

predict(mo, newdata = data.frame(speed=10))#예측값
predict(mo, newdata = data.frame(speed=10), interval = 'confidence')
predict(mo, newdata = data.frame(speed=10), interval = 'predict') #오차항

#신뢰구간의 신뢰대 표시
par(mfrow=c(1,1))
plot(dist ~ speed, data = cars)
abline(mo)
pt <- predict(mo, interval='confidence')
lines(cars$speed, pt[,2], col='red')
lines(cars$speed, pt[,3], col='blue')

summary(mo)

# 모델의 유의성을 위해 anova() 사용
# 완전모형
full <- lm(dist ~ speed, data = cars)
full
# 축소모형
reduced <- lm(dist ~ 1, data = cars)
reduced

anova(reduced, full) # 두 모델을 비교 89.567 1.49e-12 ***














