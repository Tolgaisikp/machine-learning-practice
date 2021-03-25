#Vectors
x <- c(10,20,30,40,50)
x

y <- c('a','b','c')
y

z<-10:14
z

y<-c(x,x)
y

z <- y <- x <- c(1.25,5,3) 

x <- vector('numeric', length = 5)

y <- vector('logical', length = 5)

x <- c(1.25,5,3) 
length(x)

#Vector Indexings

x<-c(10,20,30,40,50,60,70,80)

x[1]

x[-1]# o sýradaki deðeri siler

x[3:7]

x[c(1,5,7)]

x[10]#Null ifade verir

x[3] <- 12

x

x[10] <- 10

x#uzunluktan 10 a akadar null 10.ya 10 u ekler


x[-10] <- 12#10. hariç hepsine 12 yaz

x

x<-c(10,20,30,40,50,60,70,80)

y<-c(T,F,F,T,T,F,T,T)

x[y]#true olanlarý yazdýrýr

x<-c(10,20,30,40,50,60,70,80)

y<-c(T,F)#bittikten sonra tekrar baþa geçer

x[y]


for(i in 1:length(x))#veya seq_along(x) yazarak 1:length(x) yazmaya gerek kalmaz
  print(x[i])

for(i in x)
  print(i)
