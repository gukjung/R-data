install.packages("multilinguer")
library(multilinguer)
install_jdk()
install.packages(c('stringr', 'hash', 'tau', 'Sejong', 'RSQLite', 'devtools'), type = "binary")
install.packages("remotes")
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))
library("KoNLP") #최종적으로 "KoNLP" 패키지를 불러옵니다
sentence <- "내 친구 이름은 홍길동, 홍길동의 동생이 방에서 슬쩍 나온다"
extractNoun(sentence)

SimplePos22(sentence)
SimplePos09(sentence)
ss <- SimplePos09(sentence)

#명사만 얻어오려면
library(stringr)
abc <- str_match(ss, '([가-힣+]/N)')
abc

mo <- MorphAnalyzer(sentence)
mo
sum(supply(mo, length))




#워드 클라우드

install.packages("wordcloud")
library(wordcloud)
Sys.setenv(JAVA_HOME='C:/Program Files/Java/jdk-14.0.1')
library(rJava)
ss= "
아시아경제 김혜민 기자 국민의힘 사모펀드 특별위원회는 8일 여권 인사들와 옵티머스 사모펀드와의 비리 의혹이 제기되고 있는데 대해 문재인 대통령이 지금 당장 수사기관에 철저한 수사를 지시해야 한다고 촉구했다.
유의동 국민의힘 사모펀드 특위위원장을 비롯한 위원들은 이날 오전 국회에서 기자회견을 열고 검찰의 성역없는 수사를 요청했다.
아시아경제 김혜민 기자 국민의힘 사모펀드 특별위원회는 8일 여권 인사들와 옵티머스 사모펀드와의 비리 의혹이 제기되고 있는데 대해 문재인 대통령이 지금 당장 수사기관에 철저한 수사를 지시해야 한다고 촉구했다.
유의동 국민의힘 사모펀드 특위위원장을 비롯한 위원들은 이날 오전 국회에서 기자회견을 열고 검찰의 성역없는 수사를 요청했다.
아시아경제 김혜민 기자 국민의힘 사모펀드 특별위원회는 8일 여권 인사들와 옵티머스 사모펀드와의 비리 의혹이 제기되고 있는데 대해 문재인 대통령이 지금 당장 수사기관에 철저한 수사를 지시해야 한다고 촉구했다.
유의동 국민의힘 사모펀드 특위위원장을 비롯한 위원들은 이날 오전 국회에서 기자회견을 열고 검찰의 성역없는 수사를 요청했다.
"

data <- extractNoun(ss)
data
data <- gsub("\\d+","",data)
data
data <- Filter(function(x){nchar(x) >= 2})
data

words <- table(data)
words

install.packages("RColorBrewer")
library(RColorBrewer)   

display.brewer.all()

cols <- brewer.pal(9, "Set3")

windowsFonts(font=windowsFont("돋움"))

Worldcloud::wordcloud(names(words), freq = words, min.freq=1,
                      random.order = F, random.color = T,
                      colors = cols)

