#자료구조 - vector, matrix, array, list, dataframe
# 1. vector - 1차원 구조
year = 2020
name = '홍길동'
is.vector(year)
is.vector(name)
is(year) #numeric은 double임임
is(name)

seq(1, 5)
1:5
seq(1, 5 , 2)
seq(1, 10, length.out = 2)

rep(1:3, each=3)
rep(1:3, 3)

a = c(1,2,3,-5,-2,2)
is.vector(a)

v1 = c(13, -5, 20:23, -2:3)
v1
v1[1]  #얜 다른 언어랑 다르게 1부터 출발
#v1[0]
v1[-1] #1번 빼고 전부다
v1[c(2,4)]
v1[-c(2,4)]

a = 1:3
b = 4:6
cat(a, ' ', b)
a + b
a * b
c(1,3,'5')
c(1,3,T)
c(1,3,F)
c(1.2,3,F)


#martrix : 행렬 구조
a = 1:8
dim(a)
dim(a) = c(2, 4)
a
typeof(a)
mode(a)
class(a)

m <- matrix(1:5)
m
m <- matrix(1:9, nrow = 3)
m
m <- matrix(1:9, nrow = 3, byrow = T)
m <- matrix(1:10, nrow = 2)
m <- matrix(1:10, nrow = 3)
m
m[1,]
m[,3]
m[1,3]
m[1,c(2,4)]

a = matrix(c(1,2,3,4), 2, 2)
a
b = matrix(5:8, 2)
b

a + b
a * b
a %*% b #행렬곱

# array : 다차원 배열

d = c(1:12)
d
dim(d)
arr1 = array(d)
arr1
dim(arr1)

arr2 = array(c(1:12), dim = c(6, 2))
dim(arr2)

arr3 = array(c(1:12), dim = c(3,2, 2)) # 3행 2열 2면
arr3
dim(arr3)

arr3[,,1] # 면
arr3[,1,1] # 1면 1열
arr3[1,,1] # 1면 1행
arr3[1,1,1] # 1면 1행 1열

#List : 서료 다른 자료를 키, 값으로 저장
li <- list("1", "이순신", 95, "2","홍길동", 75)
li
class(li)
unli <- unlist(li)
unli

num = list(c(1:5), c(6:10), c("a","b","c"))
num
num[1] #리턴타입
class(num[1])

num[[1]] #리턴타입의 인티져
class(num[[1]])
num[1][2]

#DataFrame : 컬럼단위로 type이 다른 여러 행의 자료를 담는 자료구조
no = c(1,2,3)
name = c("hong","lee","kim")
pay = c(200,250,300)
df = data.frame(bunho=no,irum=name,imkum=pay)
df
class(df)

m<-matrix(c(1,"hong",100,2,"lee",80,3,"kim",90),3,by = T)
mdf = data.frame(m)
mdf

txtdf <- read.table('testdata/emp.txt', header = T) # txt 부를대는 table # t안주면 열데이터로 생각함
txtdf
class(txtdf)

txtdf2 <- read.csv('testdata/emp.txt', header = T, sep = "") #t안주면 열데이터로 생각함
txtdf2


csvdf <- read.csv('testdata/emp.csv', header = T, sep = "") #t안주면 열데이터로 생각함
csvdf

data()
head(iris)
tail(iris)
dim(iris)
class(iris)

## 파일로 저장###

mdf
write.table(mdf, 'output/mydata1.txt')
write.csv(mdf, 'output/mydata1.csv')




install.packages("xlsx")
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_31')
library(xlsx)
# xlsx::write.xlsx()
write.xlsx(mdf, 'output/mydatal.xlsx')

