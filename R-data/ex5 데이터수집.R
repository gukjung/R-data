#데이터 수집 : 파일, DB, 시스템 로그, 웹, ......

#web scraping

#---- rvest 패키지를 이용하여 HTML 읽어 오기 샘플---tag가 유동적----
#  rvest 패키지가 지원하는 함수
# css, xpath로 원하는 부분 추출 함수 제공: 
# html_node() : 결과 1개 - id는 얘로 해야 함
# html_nodes() : 결과 복수 개
# html_table() : table tag 읽기
# html_test() : 텍스트 추출
# html_name() : attribute의 이름을 얻음
# html_attr() : attribute를 추출
# html_tag(): tag 이름을 얻음
# html_children() : 해당 요소의 하위 요소를 추출

#https://www.melon.com/song/popup/lyricPrint.htm?songId=11111

install.packages("XML")
install.packages("httr")
library(XML)
library(httr)

url <- "https://www.melon.com/song/popup/lyricPrint.htm?songId=11111"
source <- htmlParse(rawToChar(GET(url)$content))
source

aa <- xpathSApply(source, "//div[@class='box_lyric_text']", xmlValue)
aa
aa <- gsub("[\r\n\t]","",aa)

#-----------------------
install.packages("rvest")
library(rvest)
#https://news.daum.net/series/
url_daum = "http://news.daum.net/series/"
h_daum = read_html(url_daum)
h_daum %>% html_node(".item_series a")
h_daum %>% html_nodes(".item_series a")
daum <- h_daum %>% html_nodes(".item_series a") %>% html_text()
daum
is(daum)
li <- strsplit(daum, ",")
li
is(li)
li[1]
li <- gsub("['\n,']","",li)
li



