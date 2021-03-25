library(datasets)
head(iris)

plot(iris$Species)

plot(iris$Petal.Length)#verilerin uzunluk daðýlýmlarý
plot(iris$Petal.Width)

plot(iris$Species, iris$Sepal.Length)#özelliklerine göre uzunluk daðýlýmý
plot(iris$Species, iris$Petal.Width)
plot(iris)#bütün veriseti arasýndaki baðlantýlarýn grafiði


#plot ayarlarý
plot(iris$Sepal.Length, iris$Sepal.Width,
     col="#cc0000",
     pch=19,
     main="Iris: Sepal Length vs. Sepal Width",
     xlab = "Sepal Length",
     ylab = "Sepal Width"
     )

#matematiksel grafikler
plot(cos,0,2*pi)

plot(dnorm,-3,+3,
     col="#cc0000",
     lwd=5,
     main="Standard Normal Distribution",
     xlab="z-scores",
     ylab="Density")
