#단일 집단평균 분석
#단일 모집단의 평균에 대한 가설점정
# 단일집단의 평균이 어떤 특정한 집단의 평균과 차이가 있는지 검정하는 방법.
#t.test 함수를 사용한다.

#정규분포 처럼 종모양을 갖춤 - 선형작업:정규성
#실습1) 단일 표본 t 검정
n <- 30
mu <- 0
set.seed(0)
x <- rnorm(n, mean = mu)
x
mean(x) #0.02195079 
shapiro.test(x) # 정규분포 확인 :W = 0.97521, p-value = 0.6888 > 0.05 정규분포 따름
t.test(x)
qt(1 - 0.025, n -1)

#*실습) 여아 신생아 몸무게의 평균 검정 수행
#여아 신생아의 몸무게는 평균이 2800(g) 으로 알려져 왔으나 이보다 더 크다는 주장이 나왔다.
# 표본으로 여아 18명을 뽑아 체중을 측정하였다고 할 때 새로운 주장이 맞는지 검정해보자
# data : babyboom.csv

data <- read.csv("testdata/babyboom.csv")
head(data, 5)
mean(data$gender==1) #여아
mean(data$gender==2) #남아
str(data)
(tmp <- subset(data, gender == 1))
tmp
typeof(tmp)
dim(tmp) #여아 18명
weight <- tmp[[3]]
avg <- mean(weight)
s_dev <- sd(weight)
n <- length(weight)
hO <- 2800
(t_value <- (avg - hO) / (s_dev / sqrt(n)))
#[1] 2.233188

alpha <- 0.05 #유의 수준
(c_u <- qt(1-alpha, df = n-1)) #임계치 1.739607
#우측 검정에서 통계랑 t값이 2.233188이 임계값 1.739607보다 오른쪽에 있으니 귀무가설 reject

(p_value <- 1 - pt(t_value, df = n - 1)) #[1] 0.01963422

t.test(weight, mu=2800, alternative = "greater")
# t = 2.2332, df = 17, p-value = 0.01963
#결론 = p-value = 0.01963 < 0.05 귀무가설 기각, 대립가설설 채택

# 시각화!!!!one sample t-test 평균 예제 도표 작성
par(mar=c(0,1,1,1))
x <- seq(-3, 3, by = 0.001)
y <- dt(x, df = n - 1)
plot(x, y, type="l", axes=F, ylim=c(-0.02, 0.38))
abline(h=0)

polygon(c(c_u, x[x > c_u], 3), c(0, y[x > c_u], 0), col=2)
text(c_u, -0.02, expression(t[0.05]==1.74))
text(1.8, 0.2, expression(alpha==0.05), cex=0.8)
arrows(1.8, 0.18, 1.8, 0.09, length=
         0.05)

polygon(c(t_value, x[x > t_value], 3), c(0, y[x > t_value], 0), density=20, angle = 45)
text(t_value, -0.02, paste("t=", round(t_value, 3)), pos=4)
text(2.65, 0.1, expression(plain(P)(T > 2.23)==0.019), cex=0.8)
arrows(2.7, 0.08, 2.5, 0.03, length=0.05)


