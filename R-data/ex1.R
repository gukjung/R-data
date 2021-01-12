## 변수와 자료 유형
# controll + shift + c 하면 범위 주석걸림

va <- 1
va <- 2
va2 = 3
va2 -> 3
va4.abc = 4

cat(va, va2, va4.abc)

print(va, va2 , va4.abc)

# cat은 여러개 출력가능 print는 하나만 출력가능(function 안에서는 print)

a = 1
A = 1
cat(a, A)

b = 2 
c = a + b
print(c)
(c = a + b)



kbs <- 9
object.size(kbs)
typeof(kbs) #수치형 double
mbc = as.integer(kbs) #integer 문자형
typeof(mbc)
is(mbc)

aa = 3
typeof(aa)
bb = 3L
typeof(bb)  #숫자뒤에 문자오면 integer


str = '홍길동'
typeof(str)

bb = TRUE
typeof(bb)


cc = 5.3 - 3i
typeof(cc)

length(NA) #결측값
is.na(NA)
length(NaN) # Not a Number
length(NULL) # 데이터 값이 없음
sum(2, 3)
sum(2, 3, NA)
sum(2, 3, NA, na.rm = TRUE)
sum(2, 3, NA, na.rm = T)

sum(2, 3, NULL)
sum(2, 3, NaN) #연산 안됨

0/0
Inf #무한대
Inf + Inf
Inf - Inf
Inf * 0 


#factor(요인형 변수)
kbs = c("second", "first", "thrid", "second")
kbs
typeof(kbs)
is.character(kbs)
is.factor(kbs)

mbc = as.factor(kbs)
mbc
levels(mbc)
summary(mbc) #빈도수
plot(mbc)
is.character(mbc)
is.factor(mbc)

#함수
f = function(){
  return("good")
} #괄호 안해서 실행

f()
typeof(f) #타입이 closure면 function!!!

a <- 5
ls()  #내가 쓰고있는 변수 확인가능
rm(a)
rm(list=ls())  #변수를 삭제하지만 참조하고있는 메모리는 살아있음
gc() #변수와 메모리 전부다 삭제 가비지컬렉터터

# controll + L 하면 콘솔 지워짐


data()

# package : data + function + 알고리즘
dim(available.packages()) #r에 있는 패키지 수 알아보는 법
install.packages("plyr")
library(plyr)
search()
ls("package:plyr")  #패키지 구성
lsf.str("package:plyr") #패키지 함수 구성을 볼수있음
data(package="plyr")  # 제공해주는 dataset을 볼 수 있음
baseball
remove.packages("plyr")
library("plyr")

Nile
head(Nile)
hist(Nile, freq = F)
lines(density(Nile))

help("mean")
?sum

getwd()
# setwd("c:/...") #작업공간 변경 가능







