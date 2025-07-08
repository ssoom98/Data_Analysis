rm(list = ls())

## Data 준비 - 대용량데이터 (1차원 - 벡터 , 2차원 - matrix)
## Data 준비 - 대용량데이터 (1차원 - list , 2차원 - DataFrame)

x1 <- c(10,20,30, 40,50.1)
x1*2
mean(x1)
median(x1)
summary(x1)
x1[1:4]

x1[x1 > 30]
x1[x1>20 & x1<40]
d <- 1:10
str(d)
d<- range(10)

sum(x1>20) # 논리연산으로 True값을 더해서 합을 리턴
sum(x1[x1>20]) 

espresso <- c(4, 5, 3, 6, 5, 4, 7)
americano <- c(63, 68, 64, 68, 72, 89, 94)
latte <- c(61, 70, 59, 71, 71, 92, 88)

m<- matrix(1:7,nrow=7, ncol = 1)
m[4,1]
m1 <- cbind(m,espresso)
m2 <- cbind(m1, americano)
m3 <- cbind(m2, latte)
m3
summary(m3)

df <- data.frame(espresso,americano)
str(df)

df$espresso
df['americano']
data(iris)
str(iris)
iris
table(iris$Species)
summary(iris)

iris[[1]]


cafe <- list(espresso = c(4, 5, 3, 6, 5, 4, 7),
             americano = c(63, 68, 64, 68, 72, 89, 94),
             latte = c(61, 70, 59, 71, 71, 92, 88),
             price = c(2.0, 2.5, 3.0),
             menu = c('espresso','americano','latte'))
cafe$americano # $키를 사용할때 쓰는 방식

cafe[[1]]
typeof(cafe[['americano']])
typeof(cafe['americano']) # 리턴 되는 타입이 달라진다 

names(cafe$price)<- factor(cafe$menu)
names(cafe$price)

sale.espresso <- cafe$price['espresso'] * cafe$espresso
sale.americano <-cafe$price['americano'] * cafe$americano
sale.latte <-cafe$price['latte'] * cafe$latte

sale.americano
sale.espresso
sale.latte
sale.day<- sale.americano + sale.espresso + sale.latte
sale.day

