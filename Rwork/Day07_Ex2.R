setwd(dir = "C:/pycode/Rwork/Data")
rm(list=ls())
anova_data<- read.csv("three_sample.csv",header = TRUE)
head(anova_data)
anova_data<- subset(anova_data,!is.na(score),c(method,score))
anova_data
summary(anova_data)
plot(anova_data$score)
length(anova_data$score)
data2<- subset(anova_data,score<=14)
str(data2)
length(data2$score)
boxplot(data2$score)
data2$method2[data2$method==1] <- "방법1"
data2$method2[data2$method==2] <- "방법2"
data2$method2[data2$method==3] <- "방법3"
table(data2$method2)

df <- data.frame(교육방법=data2$method2, 
                 성적=data2$score)
df

help(aov) # 형식) aov(종속변수 ~ 독립변수, data=data set)
result <- aov(score ~ method2, data=data2)
names(result)
summary(result)
TukeyHSD(result) # 분산분석의 결과로 사후검정
