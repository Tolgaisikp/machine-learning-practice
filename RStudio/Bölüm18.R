#Bar Chart
library(datasets)

head(mtcars)

barplot(mtcars$cyl)#cyl daðýlýmý


#karþýlaþtýrma
barplot(mtcars$cyl)
plot(mtcars$cyl)#nokta olarak gösterir

mtcars$cyl

#Histograms 
head(iris)

hist(iris$Sepal.Length)
hist(iris$Sepal.Width)

#histograms by group
par(mfrow = c(3,1))#bizim plots bölümüüzü üç parçaya böler

hist(iris$Petal.Width [iris$Species == "setosa"],
     xlim=c(0,3),
     breaks=9,
     main="Petal Width For Setosa",
     xlab="",
     col="red")

hist(iris$Petal.Width [iris$Species == "versicolor"],
     xlim=c(0,3),
     breaks=9,
     main="Petal Width For Versicolor",
     xlab="",
     col="purple")

hist(iris$Petal.Width [iris$Species == "virginica"],
     xlim=c(0,3),
     breaks=9,
     main="Petal Width For Virginica",
     xlab="",
     col="blue")

par(mfrow = c(1,1))

#Scatter Plots
head(mtcars)

hist(mtcars$hp)

plot(mtcars$wt,mtcars$mpg,
     pch=19,#þekil
     cex=1.5,#kalýnlýk
     col="#cc0000",#renklendirme
     main="MPG as a Function of Weigth of Cars",
     xlab="WT (in 1000 pounds)",
     ylab="MPG"
     )

#overlaying plot
#üst üste birkaç grafiðin bindirilmiþ hali
head(lynx)

hist(lynx,
     breaks = 14,
     freq = F,
     col = "thistle1",
     main = paste("Histogram of Annual Canadian Lynx",
                  "Trappings","1821-1934"),
     xlab = "Number of Lynx Trapped")

curve(dnorm(x,mean=mean(lynx),sd = sd(lynx)),#üstteki fonksiyýnun üstüne eðri grafiðini çiziyoruz
      col = "thistle4",
      lwd = 2,
      add = T)  

#line plot
lines(density(lynx),col="blue",lwd=2)
lines(density(lynx,adjust = 3),col="purple",lwd=2)

#rug plot
rug(lynx,lwd=2,col="yellow")

#çekirdek yoðunlýuk tahmincisi
