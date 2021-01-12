##명목형 변수로 도수분포표 작성
df <- read.csv('testdata/ex_studentlist.csv')
df
head(df, 3)
df[1:3, 1:8]

# 혈액형을 나타내는 변수의 빈도 수
freq <- table(df$bloodtype)
freq

rfreq <- prop.table(freq)
rfreq

rtable <- rbind(freq, rfreq)
rtable

#rtable <- addmargins(rtable, margin = 1)
#rtable <- addmargins(rtable, margin = 2)
rtable <- addmargins(rtable)
rtable

# 연속형 변수로 도수분포표 작성
head(df, 2)
# 연속형 데이터에 대한 구간 설정 cut()
faHeight <- cut(df$height, breaks = 4)
faHeight

faHeight = table(faHeight)
faHeight
faHeight <- rbind(faHeight, prop.table(faHeight))
faHeight
rownames(faHeight)[2] <- '키비율'
faHeight

cumFreq <- cumsum(faHeight[2, ])
cumFreq

faHeight = rbind(faHeight, cumFreq)
faHeight
rownames(faHeight) <- c('도수','상대도수','누적도수')
faHeight

faHeight <- addmargins(faHeight, margin = 2)
faHeight


# 정규표현식
ex_str <- 'abc한국12ABC345abc123-4567하이'
ex_str
sub("abc", 'kbs_mbc', ex_str) #sub(pattern, replce, target)
gsub("abc", 'kbs_mbc', ex_str)
gsub("[0-9]", '수', ex_str)
gsub("[0-9]{2}", '수', ex_str)

install.packages("stringr")
library("stringr")
str_extract(ex_str,"ab")
str_extract_all(ex_str,"ab")
str_extract_all(ex_str,"[0-9]")
str_extract_all(ex_str,"\\d")
str_extract_all(ex_str,"[^0-9]")
str_extract_all(ex_str,"[^0-9]{2,4}")
str_extract_all(ex_str,"[a-zA-z]+")
str_extract_all(ex_str,"[가-힣]+")








