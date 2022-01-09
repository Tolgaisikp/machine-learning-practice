#dplyr package 
install.packages('dplyr')
library(dplyr)
mydata<-read.csv('murders.csv')
mydata
dim(mydata)
str(mydata)

mydata[c(1,3)]#1.ve 2.değişkenler gösterildi

names(mydata)#bütün değişkenlerin adları


#dplyr select func

mysubdata<-select(mydata,region:murders)
mysubdata

mysubdata<-select(mydata,murders:region)#ters yazarsak tersten gösterir
mysubdata


#dplyr filter func
mysubdata <- filter(mydata, murders>450)
mysubdata

mysubdatamurders <- select(mysubdata,state,murders,region)
mysubdatamurders


#dplyr arrange func
mysubdata<-arrange(mydata,population)#popülasyonu küçükten büyüğe sıralar
mysubdata

head(mysubdata,5)
tail(mysubdata,5)


#dplyr rename func
mydata<-rename(mydata,abbrivation=abb)#abb olanı abbreviattir
names(mydata)

mysubdata<-select(mydata,state,abbrivation,murders)
mysubdata


#dplyr mutate func
mysubdata<-mutate(mydata,ratio=murders/population)#yeni bir değer ekleyip o değere murders ile populasyonun bölümünü yazdık
names(mysubdata)
mysubdata

mysubdata<-transmute(mydata,ratio=murders/population, state=state)#sadece ratio değerini döndüren bir dataframe
head(mysubdata)


#dplyr groupby func
mysubdata<-group_by(mydata,region)
mysubdata
# Groups:   region [4] şeklinde çıktı verir yani toplam 3 grup bulunmaktadır
summarise(mysubdata,sum(murders))#elimizdeki dataframede her regiondan kaç tane bulunduğu

summarise(mysubdata,mean(murders))


#dplyr pipe operator
#Pipe operatörü |> bir fonksiyonun sonucunu diğer fonksiyona ilk değer olarak geçirir.
mysubdata<-arrange(mydata,murders)
mysubdatamurders<-select(mysubdata,state,murders)
mysubdatamurders

arrange(mydata,murders) %>% select(state,murders) %>% head(5)#aynı işlemi pipe operator ile yaptık ilkinden gelen datayı selecte vererek öncekinde 3 satırda yaptığımızı bunda tek satırda yaptık

