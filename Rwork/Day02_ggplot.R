rm(list  = ls())
library(ggplot2)
data("mpg")
head(mpg)
tail(mpg)
df_mpg <- as.data.frame(mpg)
str(df_mpg)

x <- as.factor(df_mpg$fl)
x
qplot(x, geom = 'bar',main = "연료 종류별 빈도수")

summary(x)
# 연료 종류 빈도수 집계
df <- as.data.frame(table(mpg$fl))
colnames(df) <- c("fl", "count")

# 파이그래프 그리기
ggplot(df, aes(x = "", y = count, fill = fl)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") + 
  labs(title = "연료 종류별 비율 (파이그래프)", x = NULL, y = NULL) +
  theme_void()

# x축 = 구동방식, y축 = 연비
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot")

