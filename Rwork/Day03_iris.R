data(iris)
str(iris)
summary(iris)
table(iris$Species)
iris_num <- iris[,1:4]
iris_num
cor(iris_num)

#install.packages("corrplot")
library(corrplot)
cor_matrix <- cor(iris_num)
corrplot::corrplot(corr = cor_matrix,method= "number")
#install.packages("GGally")
library(GGally)

ggpairs(iris, columns = 1:4, aes(color = Species))

ggpairs(iris, columns = 1:4, mapping = aes(color = Species))
