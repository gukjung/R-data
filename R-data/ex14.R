# 분산분석 : 세 집단 이상의 평균(비율) 차이 검정
#지역별 나이 차이에 대한 검정 실시
#귀무 : 지역에 따라 나이의 평균은 차이가 없다
#대립 : 지역에 따라 나이의 평균은 차이가 있다

ad <- read.csv("testdata/agedata.csv", header = T)
ad
head(ad)
unique(ad$scale) # 1 2 3  = 지역 3개임
str(ad)
ad$scale <- factor(ad$scale)  #scale을 int에서 factor로 바꿈(범주형으로)
str(ad)

# 방법1 : anova() 함수 사용용
lmodel <- lm(age ~ scale, data=ad)
lmodel
anova(lmodel) #분산 분석표 출력
150.1/2
75.047 / 205.030
#임계값을 구해 귀무 채택 여부 판정
cri <- qf(1-0.05, 2, 147)
cri
(cri <- qf(1-0.05, 2, 147)) #3.057621 f-value 0.3660294 귀무 채택
# p-value 0.6941 > 0.05

# 방법2 : oneway.test() 함수사용
oneway.test(age ~ scale, data=ad, var.equal = TRUE)
# F = 0.36603, num df = 2, denom df = 147, p-value = 0.6941








