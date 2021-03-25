x <- rep(1,times=5)
x

y <- rep('a', 3)
y

z <- rep(x, 2)
z

x <- 1:3

t <- rep(x, each=5) #sýralý þekilde 5 tekrar eder
t

#Selection Control

x<-10

if(x>10){
  print("10dan büyük")
}else if(x<10){
  print("10dan küçük")
}else{
  print("10 a eþit")
}

#ifelse fonksiyonu
x<-16
ifelse(x>15, "15ten büyük", "15ten küçük")

x<-16
ifelse(x%%2==0, "çift sayý", "tek sayý")

#for döngüleri
x <- 0:10
for(i in x){
  print(i)
}

y <- letters
for(i in y){
  print(i)
}

x <- y[1:5]
x

#while döngüleri
i<-1
while(i<=5){
  print(i)
  i<-i+1
}

#repeat döngüleri
i<-1
repeat{#bu iþlem sürekli devam edilir
  print(i)
  if(i>5)
    break
  i <- i + 1
}

#break 
for(i in 1:10){
  if(i%%2==1)
    next
  print(i)
  if(i==8)
    break
}
