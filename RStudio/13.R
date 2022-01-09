#Matrix Operation
a<-matrix(c(1,2,3,4,5,6,7,8,1),3,3,T)
b<-matrix(c(9,8,7,6,5,4,3,2,1),3,3,T)

a+b
a-b
a*b
a/b

a%*%b

t(a)#transpose iþlemi

solve(a)

#Matrix özel fonksiyonlarý
a<-matrix(c(1:9),3,3)
a

rowSums(a)#satýrlarý toplama
colSums(a)#sütunlarý toplama

rowMeans(a)#ortalama

apply(a, 1, sum)#satýr 
apply(a, 2, sum)#sütun


#Lists
x<-list("tolga",20,T)
x

number <- c(20,25,28,15,17)
name <- c('Tolga','Kamil','Mehmet','Hüseyin','Sema')
player <- list(number,name)
player


t<-list(c(1,2,3),c('taþýk','kaþýk','tolga'))
t

#List Indexing
player[1]
player[2]

player[[1]][1]<-15
player

#subset list operator
number <- c(20,25,28,15,17)
name <- c('Tolga','Kamil','Mehmet','Hüseyin','Sema')
player <- list('age' = number,'name' = name)

player$name
player$age

player[c(1)]
player[c('name')]

#list concate

class<-list(c('A','B','F','F','D'))
class<-c(player,'class'=class)
class

