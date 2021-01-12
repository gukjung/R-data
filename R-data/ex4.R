#제어문
x <- 10; y <- 5
if(x + y >= 10){
  print('참일 때')
}else{
  print('거짓일 때')
}

ifelse(x > 3, 'good', 'nice')

switch("age", id="hong", age=33)

name <- c("kor","eng","kor")
name
which(name=="kor") # index 반환

#반복문 - for
i <- 1:10
for(n in i){
  print(n)
  if(n %% 2 == 0) print(n)
}

#반복문 - while
i = 0
while(i<5){
  i=i+1
  print(i)
}

#break 없으면 무한루프프
i = 0
while(T){
  i=i+1
  print(i)
  if(i==5) break
}

cnt = 1
repeat{
  print(cnt)
  cnt = cnt + 2
  if(cnt > 10) break
}

#사용자 정의 함수
func1 <- function(arg1){
  print(arg1)
  return(arg1 + 10)
}

func1(10)

tri_func = function(a, h){
  re = a * h / 2
  cat('삼각형의 너비: ', re)
}

tri_func(5, 4)


#내장함수
set.seed(123)  #seed() 안에 값은 맘대로 넣으면 됨 set.seed기능은 난수 고정
               #정규분포포
a <- rnorm(1000, mean = 0, sd = 1)
mean(a)
hist(a)

b = runif(10, min=0, max=100000) #군등분포포
mean(b)
hist(b)

sample(0:100, 10)


vec <- c(1, -2, -3, 4)
mean(vec)
sum(vec)

sum((vec - mean(vec)) ** 2 / (length(vec) - 1)) #분산 = 평균이 0일때 1은 1떨어져있고 -2는 -2떨어져있음 -3,4도(평균에서 이만큼 떨어져있음) x - x(bar)
                                                #sigma(x-x(bar))제곱 / n-1
var(vec) # 분산

sqrt(sum((vec - mean(vec)) ** 2 / (length(vec) - 1))) #sqrt는 분산
sd(vec) #표준편차   #sqrt(sigma(x-x(bar))제곱 / n-1)
table(vec)

vec <- c(1,1, -2, -3, 4, 30:50)
table(vec)










