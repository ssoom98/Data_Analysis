#library()

setwd("C:/Users/User/Desktop/Rwork")
exam <- read.csv("csv_exam.csv")
list.files()
View(exam)
str(exam)
head(exam)
summary(exam)

dim(exam)
#install.packages("dplyr")
library(dplyr)
library(ggplot2)
data(mpg)
head(mpg)
str(mpg)
summary(mpg)

ggplot(data = mpg, aes(x= displ, y=hwy )) + geom_point() + labs(title = "배기량 vs 고속도록 연비",x = "배기량(L)" ,y="고속도로 연비(mpg)" )

# 전처리 (정제, 파생변수, 범주화,필터링 //)
summary(exam)
exam %>% filter(class==1) # ctrl + shift + m = %>%
exam %>% filter(class==2)
exam %>% filter(class!=1)
exam %>% filter(class ==1 & math >=50)
exam %>% filter(class %in% c(1,3,5))

table(is.na(exam))
sum(is.na(exam))
sum(is.na(exam$class))
mean(exam$score) # NA

mean(exam$score,nam rm = TRUE) # NA가 제거된 형태로 구해짐


# 2, 4 그룹의 영어 점수 평균을 구하기

exam %>% filter(class %in% c(2,4)) %>% group_by(class) %>% summarise(mean_score = mean(math))
