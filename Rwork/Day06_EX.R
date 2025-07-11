setwd(dir = "C:/pycode/Rwork/Data")
rm(list=ls())
# 로지의 심박수 데이터
heart_rates <- c(93,109,110,89,112,117)
# t-검정 실행 (mu= 115이 수의사의 가정 평균)
t.test(heart_rates,mu= 115)

tdata<- read.csv("two_sample.csv",header=T)
head(tdata)
str(tdata)

# 300 - 73 = 227
result <- subset(tdata, !is.na(score),c(method,score))
str(result)

m1 <- subset(result, method ==1) #1 - PT

m2 <- subset(result, method ==2) #2 - 실기

head(m1)
head(m2)
m1score <- m1$score
m2score <- m2$score
length(m1score)
length(m2score)
# h0 : 두 집단의 분포는 차이가 없다.
# h1 : 두 집단의 분포에 차이가 있다. 
var.test(m1score, m2score)

t.test(m1score, m2score,alternative = "two.side")# 귀무가설 기각 대립선택 
t.test(m1score, m2score,alternative = "greater")
t.test(m1score, m2score,alternative = "less") # 귀무가설 기각 대립선택 
t.test(m1score, m2score,paired = T)

# h0 : m1score - m2score = 0
# h1 : m1score - m2score != 0(two.side)
# h1 : m1score - m2score >0(greater)
# h1 : m1score - m2score <0 (less)
# 단측검정상 다 돌려봐야한다. 
# 두 집단의 평균차이가 존재한다! 라는 결론을 낸다.
# 실기 코딩수업이 pt보다 평균값이 높다 
# 