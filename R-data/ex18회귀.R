# 다중회귀 (독립변수 복수)
state.x77
colnames(state.x77)
states <- as.data.frame(state.x77[,c('Murder','Population','Illiteracy','Income','Frost')])
head(states)
dim(states)
cor(states)

# 다중회귀모델
fit <- lm(Murder ~ Population+Illiteracy+Income+Frost, data = states)
fit
summary(fit)

par(mar=c(1,1,1,1))
par(mfrow=c(2,2))
plot(fit)


# 다중 공산성 : 독립변수들 간에 강한 상관관계가 나타나는 문제.
install.packages('car', dependencies = T) # 종속적인 모든 패키지를 자동으로 설치해라
library(car)
vif(fit) #분산 팽창 요인을 구해서 이 값이 10을 넘으면 다중 분산성에 문제가 있다고 판단한다.
#문제가 있는 요인을 제거할 수 있다.
vif(fit) > 10

# 이상치 관측 시각화
influencePlot(fit)

boxplot(states$Murder, horizontal = T)

# 선형성
boxTidwell(Murder ~ Population+Illiteracy, data=states)

#Pr(>|z|) 0.7468, 0.5357 > 0.05 이므로 선형성 만족

#등분산성 만족 여부
ncvTest(fit) # p = 0.18632 > 0.05 이므로 등분산성 만족

spreadLevelPlot(fit) #Murder에 대해 1.209626배를 적용하면 등분산성 만족


# 독립(예측) 변수 선택택
fit1 <- lm(Murder ~ .,data=states)
summary(fit1) #income, frost는 p-values > 0.05

fit2 <- lm(Murder ~  Population+Illiteracy,data=states)
summary(fit2)

#AIC 통계량 : 설명력이 우수한 모델을 선택
AIC(fit1, fit2)
#       df     AIC
#fit1   6     241.6429
#fit2   4     237.656

#AIC 작업을 자동 처리
#backward : 모든 변수를 넣고 기여도가 낮은 변수부터 하나씩 제거하는 방법
full_model <- lm(Murder ~ .,data=states)
reduced_model <- step(full_model, direction = "backward")
summary(reduced_model)

#forward : 유익한 변수부터 하나씩 추가
min_model <- lm(Murder ~ 1,data=states)
fwd_model <- step(min_model, direction = "forward",
                  scope = (Murder ~ Population+Illiteracy+Income+Frost), trace = 1)
summary(fwd_model)

# all subset regressin :
install.packages("leaps")
library(leaps)
m <- leaps::regsubsets(Murder ~ Population+Illiteracy+Income+Frost,
                       data=states, nbest=4)
m
summary(m)
summary(m)$bic
summary(m)$adjr2
plot(m, scale="adjr2", main = "변수 선택 차트")


#---------------모델 생성 및 평가를 위해 train/test dataset 분리 --------------------
nrow(iris)
set.seed(12)
sam_tt <- sample(1:nrow(iris), nrow(iris) * 0.7, replace = T)
NROW(sam_tt)
train <- iris[sam_tt, ] #학습데이터터
test <- iris[sam_tt, ] #검정데이터
dim(train)
dim(test)
head(train, 2)
install.packages("iris")
library(iris)
model <- lm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width, data = train)


# vif
# shapiro.test()
# 독립성 검정
library(car)
car::durbinWatsonTest(model) # D-W Statisti(0~4중에서 2에 근사하면 좋음) 2.189593
#ncvTest()

anova(model)
summary(model)
#predict
pred <- predict(model, test)
pred[1:3]

head(test[,1], 2)
head(pred, 2)

#원격 db의 jikwon 테이블에 근무년수(x)에 대한 연봉(y)을 이용하여 선형회귀분석 모델을
# 작성한 후 근무년수를 입력하면 예상연봉이 나올 수 있도록 하라.
# lm 모델 만들고 jikwon_pay가 종속변수 



func <- function(){
  ibsa <- readline("근무년수를 입력:")
  ibsa <- as.numeric(ibsa)
  newdata <- data.frame(jikwon_libsail=ibsa)
  predict(lm, newdata=newdata)
}

fucn()











