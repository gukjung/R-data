rm(list=ls())  #변수를 삭제하지만 참조하고있는 메모리는 살아있음
gc() #변수와 메모리 전부다 삭제 가비지컬렉터터

#표본 추출
#단순 임의 추출 : 모집단으로부터 샘플을 균등하게 임의 추출(비복원, 복원)
set.seed(1)

sample(1:10, 5) # 비복원(중복 데이터 없음)
sample(1:10, 5, replace = T) # 복원(중복 데이터 허용용)

#층화 임의 추출 : 모집단이 여러 개의 계층으로 구성되어 있을 떼 각 계층 요소값을 임의 추출(연령대, 지역별...)
install.packages("sampling")
library(sampling)
str(iris) #150행 5열

head(iris, 3)
aa <- strata("Species", size = c(3,3,3), method = 'srswor', data = iris)
aa
getdata(iris, aa)

aa <- strata("Species", size = c(3,1,1), method = 'srswor', data = iris) #srswor 비복원
aa
getdata(iris, aa)


iris$Species2 <- rep(1:2, 75)
head(iris, 5)

aa <- strata("Species", size = c(1,1,1,1,1,1), method = 'srswr', data = iris) #srswr 복원
aa
getdata(iris, aa)

bb <- strata(c("Species","Species2"), size = c(3,1,1,1,2,2), method = 'srswr', data = iris) #srswr 복원
bb
getdata(iris, bb)

iris <- iris[, 6]
head(iris, 3)

#계통 추출 : 모집단의 임의 위치에서 출발하여 매 n번째 항목을 추출하는 방법
install.packages("doBy")
library(doBy)
x <- data.frame(x=1:10)
x
sampleBy(~1, frac = 0.3, data = x, systematic = T)
sampleBy(~1, frac = 0.2, data = x, systematic = T)
sampleBy(~1, frac = 0.4, data = x, systematic = T)

sampleBy(~Species, frac = 0.1, data = iris)
sampleBy(~Species, frac = 0.1, data = iris, replace = FALSE, systematic = TRUE)




