# 3가지 교육방법을 적용해 1개월 간 교육받은 각 50명씩의 교육생에 대한 실기시험 실시 후
# 각 실기 시험의 팽균에 차이가 있는지 검증하라.
# 귀무 : 세집단 간 실기시험의 평균에 차이가 없다.
# 대립 : 세집단 간 실기시험의 평균에 차이가 있다.

data <- read.csv("testdata/three_sample.csv")
head(data)
#NA제거
data <- subset(data, !is.na(score), c(method, score))
head(data, 3)
summary(data)

plot(data$score)
boxplot(data$score)
length(data$score)

data2 <- subset(data2, score <= 100)
lenght(data2$score)
boxplot(data2$score)
head(data2$score)
table(data2$method)

data2$method2[data2$method == 1]
data2$method2[data2$method == 2]
data2$method2[data2$method == 3]
table(data2$method2)
x <- table(data2$method2)
y <- tapply(data2$score, data2$method2, mean)
df <- data.frame(교육방법=x, 성적=y)
df

#정규성 검정
shapiro.test(data$score)

#등분산성 : 세 집단 간에 분포의 모양이 동질적
bartlett.test(score ~ method, data = data2)

#밀도차트
install.packages("lattice")
library(lattice)
densityplot(score ~ (method), data = data2)



# anova 방법1
result <- aov(score ~ method, data = data)
result
summary(result)

# anova 방법2

lmodel <- lm(score ~ method, data = data2)
anova(lmodel)

#anova 방법3 : oneway.test()
oneway.test(score ~ method, data, var.equal = T)

#참고 : 세 집단이 정규성을 띄지 않는 경우
kruskal.test(score ~ method, data = data)

#참고 : 세 집단이 정규분포를 따르지만 등분산성을 만족하지 않는 경우
oneway.test(score ~ method, data = data, var.equal = F)

# 사후 검정 : 세 집단의 평균에 차이 유무만 알려줌. 각 집단 간 평균을 알 수 없다.
TukeyHSD(result)

# 사후 검정 시각화
plot(TukeyHSD(result))

install.packages("shiny")
library(shiny)






