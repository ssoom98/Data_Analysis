rm(list  = ls())
library(ggplot2)
data("chickwts")
head(chickwts)
str(chickwts)
summary(chickwts)

df_ch <- as.data.frame(chickwts)
df_ch

#ggplot(chickwts, aes(x = feed, y = weight, fill = feed)) +
#  geom_boxplot() +
#  labs(fill = "Feed Type")  # 범례 제목 설정

qplot(data = chickwts, x = feed, y = weight , geom = "boxplot")
by(chickwts$weight, chickwts$feed, summary)

chickwts$weights
