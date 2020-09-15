library(datasets)
data(iris)
?iris
class(iris)
names(iris)
unique(iris$Species)
nrow(iris)

tapply(iris$Sepal.Length, iris$Species, mean)
round()

apply(iris[,1:4], 2, mean)
colMeans(iris)

data(mtcars)


temp <- tapply(mtcars$mpg, mtcars$cyl, mean)
class(temp)
y <- temp[3]
x <- temp[1]
class(temp[3])

x-y
