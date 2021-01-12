# 여 신생아의 몸무게의 평균이 남 신생아의 평균보다 낮다.
babydata = read.csv("testdata/babyboom.csv", header = T)
head(babydata, 2)
unique(babydata$gender)
(data = babydata[, c(2,3)])
(data = babydata[, c("gender","weight")])

# 집단 간에 분산이 같은지(등분산성) 확인

var.test(data$weight ~ data$gender) #p-value = 0.07526 > 0.05 이므로 등분산성 만족

shapiro.test(data$weight) #p-value = 0.0009944 정규성 만족x

mean(data$weight[data$gender == 1]) # 여아의 몸무게 평균 3132.444
mean(data$weight[data$gender == 2]) # 남아의 몸무게 평균 3375.308

t.test(data$weight ~ data$gender, mu=0, alternative="less", var.equal=TRUE)
# 결론 : p-value 0.06764 > 0.05 귀무가설 채택
# 여 신생아와 남 신생아의 몸무게 평균에 차이가 없다.

qt(0.05, df=42) # 임계치 -1.681952 t = -1.5229

#서로 댕응인 두 집단의 평균 차이 검정 (paired sample t-test)
#실습) 신경성 식욕부진증 치료 전후의 몸무게 자료에 대한 평균 차이 검정 수행
# anorexia.csv
adata <- read.csv("https://raw.githubusercontent.com/pykwon/Test-datas-for-R/master/anorexia.csv", header=T)
head(adata, 3)
str(adata)
#귀무 : 신경성 식욕부진증 치료법은 효과가 없다. 몸무게 평균에 차이가 없다.
#대립 : 신경성 식욕부진증 치료법은 효과가 있다. 몸무게 평균에 차이가 있다.

t.test(data$Prior, data$Post, paired = T) # 양측 검정
t.test(data$Prior, data$Post, paired = T, alternative = "less") # 단측 검정
# p-value = 0.002229 < 0.05 이므로 귀무가설 기각
# 신경성 식용부진증 치료법은 효과가 있다. 라고 판정한다.


# 비율검정정
adata
table(x)
prop.test()




