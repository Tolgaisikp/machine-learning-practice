pacman::p_load(pacman,dpylr,GGally,ggplot2,ggthemes,ggvis,httr,lubridate,plotly,rio,rmarkdown,shiny,stringr,tidyr)


#summary
library(datasets)
head(iris)

summary(iris)#bize bu dataset hakkýndaki bilgileri verir mesela mim max mean median 
#özel olarak
summary(iris$Species)#kaçar tane kategorik deðiþken olduðunu
summary(iris$Sepal.Length)#bu sayýsal deðiþkenlerin min max mean 


#describe
#daha genel bilgileri görmek için kullanýrýz 

head(iris)

p_load(psych)

p_help(psych, web = F)

describe(iris)

describe(iris$Sepal.Length)

#Selecting Case
hist(iris$Petal.Length)
summary(iris$Petal.Length)

# kategoriye göre seçim

# Versicolor
hist(iris$Petal.Length[iris$Species == "versicolor"],
     main = "Petal Length: Versicolor")

# Virginica
hist(iris$Petal.Length[iris$Species == "virginica"],
     main = "Petal Length: Virginica")

# Setosa
hist(iris$Petal.Length[iris$Species == "setosa"],
     main = "Petal Length: Setosa")

# deðere göre seçim

# Short petals only (all Setosa)
hist(iris$Petal.Length[iris$Petal.Length < 2],
     main = "Petal Length < 2")

# her iksiini kullanarak seçim

# Short Virginica petals only
hist(iris$Petal.Length[iris$Species == "virginica" & 
                         iris$Petal.Length < 5.5],
     main = "Petal Length: Short Virginica")

#alt örnek kýsa yolu
i.setosa<-iris[iris$Species=="setosa",]

head(i.setosa)
summary(i.setosa)

hist(i.setosa$Sepal.Length)#sadece setosalarýn sepal uzunluðu
