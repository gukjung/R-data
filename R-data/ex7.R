#RDBMS와 연동
install.packages("DBI")
install.packages("RJDBC")
install.packages("RSQLite")

Sys.setenv(JAVA_HOME='C:/Program Files/Java/jdk-14.0.1')
library(rJava)
library(DBI)
library(RJDBC)
library(RSQLite)

# 개인용 SQLite와 연동
conn <- dbConnect(RSQLite::SQLite(), ":memory:")
conn
head(mtcars, 3)

dbWriteTable(conn, "mtcars", mtcars)
dbListTables(conn)
dbListFields(conn, "mtcars")
query <- "select * from mtcars"
aa <- dbGetQuery(conn, query)
aa

query <- "select mpg, cyl, disp from mtcars"
aa <- dbGetQuery(conn, query)
aa


bb <- dbGetQuery(conn, "select mpg, cyl, disp from mtcars where mpg > 30")
bb
class(bb)
dbDisconnect(conn) #db해제

# MariaDB or MySql
drv <- JDBC(driverClass = "org.mariadb.jdbc.Driver",
            classPath = "C:/Users/KITCOOP/Downloads/Test-datas-for-R-master/Test-datas-for-R-master/sql_connector/mariadb-java-client-1.3.6.jar")
drv
conn <- dbConnect(drv, "jdbc:mysql://127.0.0.1:3306/test", "root", "123")
conn
dbListTables(conn)

query <- "select * from sangdata"
goods <- dbGetQuery(conn, query)
goods
class(goods)
barplot(goods$su, col = rainbow(7), names.arg = goods$sang) #names.arg = goods$sang 상품 이름 plot에 띄움움

goods <- dbGetQuery(conn, "select * from sangdata where sang like '%가죽%'")
goods

#자료 추가
#query <- "insert into sangdata values(10,'커피믹스',5,3000)"
#dbSendUpdate(conn, query)
df <- data.frame(code=11,sang='볼펜',su=100,dan=100)
df
dbSendUpdate(conn, "insert into sangdata values(?,?,?,?)", df$code,df$sang,df$su,df$dan)
dbGetQuery(conn, "select * from sangdata")

#자료수정
# query = "update sangdata set sang='지우개' where code=11"
# dbSendUpdate(conn, query)
# dbGetQuery(conn, "select * from sangdata")
dbSendUpdate(conn, "update sangdata set sang=? where code=11", '마우스')
dbGetQuery(conn, "select * from sangdata")

#자료삭제
#query = "delete from sangdata where code=11"
#dbSendUpdate(conn, query)
#dbGetQuery(conn, "select * from sangdata")

query = "delete from sangdata where code=10"
dbSendUpdate(conn, query)
dbGetQuery(conn, "select * from sangdata")


#csv 파일을 읽어 mariadb에 저장
install.packages("dplyr")
library(dplyr)
#install.packages("readr")
#library(readr)
#remove.packages("readr")
sangdf <- read.csv("sangpum.csv", header = T)
sangdf

#문자열 연결 함수
paste("Hi","Everybody")
paste0("Hi","Everybody")

#insert 함수 작성
func <- function(conn, table, df){
  batch <- apply(df, 1, FUN = function(x) paste0("'", trimws(x), "'", collapse=",")) %>%
    paste0("(",.,")", collapse = ",\n")
  #print(batch)
  query <- paste("insert into", table, "values", batch)
  print(query)
  dbSendUpdate(conn, query)
}

func(conn, "sangdata", sangdf)

dbGetQuery(conn, "select * from sangdata")
















