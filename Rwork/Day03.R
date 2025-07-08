rm(list  = ls())
data("mtcars")
str(mtcars)

a<- mtcars$mpg
b<- mtcars$hp
cov(a,b)
cor(a,b)  # 두 변량간에는 음의 상관관계가 강하게나타나다. 
# 인과관계는 아니라서 누가 원인결과인지 모른다.(회귀분석을 적용하여 파악해야한다.)

summary(mtcars)
