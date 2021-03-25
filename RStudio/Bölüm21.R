pacman::p_load(pacman,dpylr,GGally,ggplot2,ggthemes,ggvis,httr,lubridate,plotly,rio,rmarkdown,shiny,stringr,tidyr)

#CSV
csv<-import("C:/Users/Tolga/Desktop/R01_Course_Files/R01_Course_Files/R01_5_4_ImportingData_Datasets/mbb.csv")

head(csv)

txt<-import("C:/Users/Tolga/Desktop/R01_Course_Files/R01_Course_Files/R01_5_4_ImportingData_Datasets/mbb.txt")

head(txt)

xlsx<-import("C:/Users/Tolga/Desktop/R01_Course_Files/R01_Course_Files/R01_5_4_ImportingData_Datasets/mbb.xlsx")

head(xlsx)

#Data Viewer
View(csv)

#read tabele
txt1<-read.table("C:/Users/Tolga/Desktop/R01_Course_Files/R01_Course_Files/R01_5_4_ImportingData_Datasets/mbb.txt", header = T)
View(txt1)

csv1<-read.csv("C:/Users/Tolga/Desktop/R01_Course_Files/R01_Course_Files/R01_5_4_ImportingData_Datasets/mbb.csv", header = T)
View(csv1)



#hierarchical clustering
library(datasets)

?mtcars
head(mtcars)

cars<-mtcars[,c(1:4,6:7,9:11)]
head(cars)

hc<-cars %>%
    dist %>%#Mesafe / benzemezlik matrisini hesapla (pipe ise gelen verileri sonraki fonksiyona yollar)
    hclust#Hiyerarþik kümeleri hesaplama

hc#32þer tane parçaya ayýrtýr

plot(hc)#dendrogram


#boxes to plot
rect.hclust(hc,k=2,border = "gray")
rect.hclust(hc,k=3,border = "blue")
rect.hclust(hc,k=4,border = "green4")
rect.hclust(hc,k=5,border = "darkred")
rect.hclust(hc,k=6,border = "black")


#principal components
cars<-mtcars[,c(1:4,6:7,9:11)]
head(cars)

#pca hesaplama
pc<-prcomp(cars,center = T,scale. = T)
pc


pc<-prcomp(~ mpg + cyl + disp + hp + wt + qsec + am + gear + carb,
           data = mtcars,
           center = T,
           scale = T)

pc

plot(pc)

predict(pc) %>% round(2)

biplot(pc)
