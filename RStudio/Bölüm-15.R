mydata <- read.table('data.txt')
mydata

mydata <- read.table('data.txt', header = T)
mydata

mydata <- read.table('data.txt', header = T, nrows = 2)#ilk 2 tanesini alır
mydata

mydata <- read.table('data.txt', header = T, skip = 1)#ilk 1 tanesini almaz geri kalanını alır
mydata

#sepli ayırma
mydata<-read.table('data1.txt',sep = '.')
mydata

#csv okuma
mycsv <- read.csv("deneme.csv")
mycsv

#rds okuma
myrds<-readRDS("deneme.rds")
myrds

#internetten indirme
url.show('http://softlect.in/datasets/sbuxPrices.csv')
mydata<-read.table('http://softlect.in/datasets/sbuxPrices.csv',sep = ',', header = T)
mydata

#clipboard alma ctrl c ile kopyaladığımızı direk dataframe olur
mydata<-read.table('clipboard')

#elimizdeki dataframe i csv yapmak
id<-c(101,102,103)
name<-c('Tolga','Sema','Cimir')
students<-data.frame(id,name)

write.csv(students, file = "output.csv")
