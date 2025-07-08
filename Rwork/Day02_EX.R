rm(list = ls())
#install.packages("readxl")
library(readxl)


df_exam <- read_excel("C:/Users/User/Desktop/Rwork/excel_exam.xlsx")
str(df_exam)
df_exam[['english']]

summary(df_exam)

df_exam1 <- df_exam
df_exam$class <- as.factor(df_exam1$class)
str(df_exam1)

summary(df_exam1)

