setwd(dir = "C:/pycode/Rwork/Data")
rm(list=ls())
#install.packages("gmodels") # gmodels 패키지 설치
library(gmodels) # CrossTable() 함수 사용
#install.packages("ggplot2") # diamonds 데이터 셋 사용을 위한 패키지 설치
library(ggplot2)

xdata <- read.csv("cleanDescriptive.csv", header=TRUE,fileEncoding = "euc-kr")
xdata

head(diamonds)
str(diamonds)
CrossTable(x=diamonds$color,y = diamonds$cut)

str(xdata)
xdata$level2[xdata$level == 1] <- "고졸" 
xdata$level2[xdata$level == 2] <- "대졸" 
xdata$level2[xdata$level == 3] <- "대학원졸" 
str(xdata)
xdata$pass2[xdata$pass==1]<- "합격"
xdata$pass2[xdata$pass==2]<- "불합격"
x<- table(xdata$pass2)
x

xlevel <- xdata$level2
ypass <- xdata$pass2

CrossTable(xlevel,ypass)
