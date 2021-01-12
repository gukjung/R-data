#원격 db의 jikwon 테이블에 근무년수(x)에 대한 연봉(y)을 이용하여 선형회귀분석 모델을
# 작성한 후 근무년수를 입력하면 예상연봉이 나올 수 있도록 하라.
# lm 모델 만들고 jikwon_pay가 종속변수 
rm(list=ls())

install.packages("RJDBC")
library(RJDBC)

# MariaDB or MySql
drv <- JDBC(driverClass = "org.mariadb.jdbc.Driver",
            classPath = "C:/Users/KITCOOP/Downloads/Test-datas-for-R-master/Test-datas-for-R-master/sql_connector/mariadb-java-client-1.3.6.jar")
drv
conn <- dbConnect(drv, "jdbc:mysql://127.0.0.1:3306/test", "root", "123")
conn
dbListTables(conn)

query <- "select * from jikwon where jikwon_pay "
jikwon <- dbGetQuery(conn, query)
jikwon
head(jikwon)


model <- lm(jikwon_pay ~  jikwon_ibsail,data=jikwon)
model



ibsa <- jikwon_ibsail
jikwon <- data.frame(jikwon_ibsail, jikwon_pay)






func <- function(){
  x <- jikwon
  x
  ibsa <- readline("근무년수를 입력:")
  ibsa <- as.numeric(ibsa)
  newdata <- data.frame(jikwon_libsail=ibsa)
  predict(lm, newdata=newdata)
}

fucn()

#-----------------------e답----------------------
# 원격 db의 jikwon 테이블에서 근무년수(x)에 대한 연봉(y)을 이용하여 선형회귀 분석 모델을
# 작성한 후 근무년수를 입력하면 예상연봉이 나올 수 있도록 하라.
# pay종속 년도만 독립변수
rm(list = ls())
gc()

install.packages("RJDBC")
library(RJDBC)


drv <- JDBC(driverClass = "org.mariadb.jdbc.Driver", classPath = "C:/work/mariadb-java-client-1.3.6.jar")
drv

conn <- dbConnect(drv, "jdbc:mysql://127.0.0.1:3306/test", "root", "123")
conn
dbListTables(conn)

query <- "select jikwon_pay, (DATE_FORMAT(NOW(), '%Y')- DATE_FORMAT(jikwon_ibsail, '%Y')) as jikwon_ibsail from jikwon"
jikwon <- dbGetQuery(conn, query)
jikwon <- as.data.frame(jikwon)
jikwon
nrow(jikwon)

model <- lm(jikwon_pay ~ jikwon_ibsail, data = jikwon)
model
summary(model)
anova(model)
cor(jikwon)
View(jikwon)
head(model, 6)

par(mfrow = c(2,2))
plot(lm)
boxTidwell(jikwon_pay ~ jikwon_ibsail, data = jikwon)
# Pr(>|z|) < 0.5 등분산성 만족하지 않음.





#----직원 만들어서 근무년수 뽑고 뭔 지랄한거 -------------------
library(shiny)
team<-c("A","B","C")
member<-letters[1:9]
years<-as.integer(c(5,6,7,9,3,4,4,5,2))
team_mem<-data.frame(team=rep(team,c(4,3,2)),member,years)
team_mem

# Define UI for application that draws a histogram
ui <- fluidPage(
  h2("부서의 직원선택"),
  selectInput("depart","부서를 선택하세요."
              ,c("A팀"="A","B팀"="B","C팀"="C")),
  selectInput("inDepart","부서의 직원을 선택하세요.",choices=character(0)),
  h2("직원명단"),
  tableOutput("tbl"),
  textOutput("txt")
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  observe({
    x<-team_mem[team_mem$team==input$depart,"member"]
    x<-as.character(x)
    if(is.null(x))
      x<-character(0)
    updateSelectInput(session=getDefaultReactiveDomain(),"inDepart",choices = x)
  })
  
  output$txt<-renderText({
    mem_year<-team_mem[team_mem$member==input$inDepart,"years"]
    paste(input$depart,'팀의 ',input$inDepart,' 직원의 경력은 ',mem_year,' 년입니다.'
          ,sep="")
  })
  
  output$tbl<-renderTable({
    team_mem
  })
}

# Run the application 
shinyApp(ui = ui, server = server)