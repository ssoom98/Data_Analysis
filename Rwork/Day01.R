# install.packages("ggplot2")
library(ggplot2)

x1 <- c(10,20,30,40,50)
x1[5]
# R 은 0번부터가 아니라 1번 부터 
x2 <- c('apple','orange','banana',40)
x2[4]

mean(x1)

qplot(y = x1,geom = 'histogram')
colors<-c('red','yellow')
barplot(x1,col = colors)

?barplot


