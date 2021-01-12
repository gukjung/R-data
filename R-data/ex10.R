# 카이제곱 이해 : 수식으로 작업
datas <- read.csv("https://raw.githubusercontent.com/pykwon/Test-datas-for-R/master/pass_cross.csv")
dim(datas)
head(datas, 3) #city - 1 privince - 0 pass - 1 fail - 0  지역 : 독립변수(범주형), 합격여부 - 종속변수(범주형)

#지역과 시험 합격여부 관련성 검증 < --  카이제곱 검정(교차분석)

table(datas$city)
table(datas$pass)


df <- table(datas$city, datas$pass)
#df <- table(datas$province, datas$fail)
df

library(dplyr)
datas[datas$city==0 & datas$pass==0, ]
count(datas[datas$city==0 & datas$pass==0, ])

datas[datas$city==1 & datas$pass==0, ]
count(datas[datas$city==1 & datas$pass==0, ])

subset(datas[datas$city==1 & datas$pass==0, ])
filter(datas[datas$city==1 & datas$pass==0, ])
datas %>% filter(datas[datas$city==0 & datas$pass==0, ])
df
margin.table(df, 1)
margin.table(df, 2)
margin.table(df)
addmargins(df)


# 가설설정
# 귀무가설 : 지역과 헙격여부는 관련이 없다. 독립적이다.
# 대립가설 : 지역과 헙격여부는 관련이 있다.
# 95% 신뢰구간에서 유의수준 0.05
# 카이제곱 = Σ(관측값 - 기대값)2(제곱) / 기대값
# 기대도수 = (각행의 주변값 * 각열의 주변값값) / 총합합
25 * 20 / 50 #10
25 * 30 / 50 #15

#        불합격 합격
#지방      10    15   <= 기대빈도
#도시      10    15   <= 기대빈도

xsq <- (13 - 10) ** 2/ 10 + (12 - 15) ** 2/ 15 +(7 - 10) ** 2 /10 +(18-15) **2 /15 #카이제곱 구하는 수식
xsq

#임계값? : 카이제곱표 이용. 자유도 :(x범주수 - 1) * (y범수주 - 1) 유의수준:0.05
#결론 : 카이제곱 값이 임계값의 왼쪽에 있으므로 귀무가설을 채택
# 지역과 합격여부는 관련이 없다. 라고 펀정한다


# r 함수로 작업
install.packages("gmodels")
library(gmodels)
datas <- read.csv("https://raw.githubusercontent.com/pykwon/Test-datas-for-R/master/pass_cross.csv")
CrossTable(datas$city, datas$pass, chisq = T)
#결론 : p(유의확률) 0.08326452  > 0.05(유의수준) 이므로 귀무가설 채택한다



