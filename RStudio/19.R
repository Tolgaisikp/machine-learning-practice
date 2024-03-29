pacman::p_load(pacman,dpylr,GGally,ggplot2,ggthemes,ggvis,httr,lubridate,plotly,rio,rmarkdown,shiny,stringr,tidyr)


#summary
library(datasets)
head(iris)

summary(iris)#bize bu dataset hakk�ndaki bilgileri verir mesela mim max mean median 
#�zel olarak
summary(iris$Species)#ka�ar tane kategorik de�i�ken oldu�unu
summary(iris$Sepal.Length)#bu say�sal de�i�kenlerin min max mean 


#describe
#daha genel bilgileri g�rmek i�in kullan�r�z 

head(iris)

p_load(psych)

p_help(psych, web = F)

describe(iris)

describe(iris$Sepal.Length)

#Selecting Case
hist(iris$Petal.Length)
summary(iris$Petal.Length)

# kategoriye g�re se�im

# Versicolor
hist(iris$Petal.Length[iris$Species == "versicolor"],
     main = "Petal Length: Versicolor")

# Virginica
hist(iris$Petal.Length[iris$Species == "virginica"],
     main = "Petal Length: Virginica")

# Setosa
hist(iris$Petal.Length[iris$Species == "setosa"],
     main = "Petal Length: Setosa")

# de�ere g�re se�im

# Short petals only (all Setosa)
hist(iris$Petal.Length[iris$Petal.Length < 2],
     main = "Petal Length < 2")

# her iksiini kullanarak se�im

# Short Virginica petals only
hist(iris$Petal.Length[iris$Species == "virginica" & 
                         iris$Petal.Length < 5.5],
     main = "Petal Length: Short Virginica")

#alt �rnek k�sa yolu
i.setosa<-iris[iris$Species=="setosa",]

head(i.setosa)
summary(i.setosa)

hist(i.setosa$Sepal.Length)#sadece setosalar�n sepal uzunlu�u
