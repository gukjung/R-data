#시각화
stu <- read.csv('testdata/ex_studentlist.csv')
stu
names(stu)
typeof(stu)
class(stu)


# 세로 막대
barplot(stu$grade)
barplot(stu$grade, ylim = c(0,5), col = rainbow(15), main = '제목이야')

rm(list=ls())  #변수를 삭제하지만 참조하고있는 메모리는 살아있음
gc()

par(mfrow=c(2,2))
barplot(stu$grade, col = c(1,2,3))
title(main = '1열열')
barplot(stu$age, col = c(1,2,3))
title(main = '2열')
barplot(stu[,4], col = c(1,2,3))
title(main = '3열')

par(mfrow=c(1,1))

#점차트
dotchart(stu$grade)
dotchart(stu$grade, pch = 1:2, cex = 1.5)

# 파이차트 - 데이터양이 많으면 별로
df = na.omit(stu) # csv파일에 na값을 날림
pie(df$age, labels = df$age, lty = 1)
title("원그래프")

# 상자차트
boxplot(stu$height, range = 1) #range 최대,최소값
boxplot(stu$height, range = 1, notch = T)
abline(h=170, lty=3, col='blue')







