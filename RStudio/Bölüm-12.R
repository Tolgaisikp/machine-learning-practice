#Math Func
x<-c(4.258,-3.853,5.457,7.504)

abs(x)#mutlak

ceiling(x)#yukarý yuvarlama

floor(x)#aþaðý yuvarlama

round(x)#yakýnlýða göre yuvarla

round(x,2)

trunc(x)#.dan sonrasýný siler

x<-c(16,25,36,81,144)

sqrt(x)

exp(x)

log(x)

log(x, base = 2)

log10(x)

factorial(x)

#Random number generate
x<-rnorm(10)#10tane random sayý
x<-rnorm(10, mean = 10, sd = 1)#ortalama 10 olan sd? random 10 sayý
x  

#Matrix
m<-matrix(nrow = 5, ncol = 2)#5satýr 2sütun matrix
m

dim(m)#boyutlarý

x<-rnorm(10)
m<-matrix(x, nrow = 5, ncol = 2)
m

m1<-matrix(x, nrow = 5, ncol = 2, byrow = T)#sütunsal
m1

m2<-matrix(x, nrow = 5, ncol = 2, byrow = F)#satýrsal
m2

#vectorü matrise çevirme
a<-c(1,2,3,4,5,6)
a
dim(a)<-c(2,3)
a

#tanýmlama
a<-matrix(4,3,3)
a

b<-diag(1,3,3)#birim matris
b

c<-diag(5,3,3)
c

d<-diag(1:4)
d

diag(3)
diag(d)

#Matrix(naming row and columns)
m<-matrix(c(2,3,4,0,1,2,-1,-3,5),3,3,T)

m#amacýmýz satýr ve sütunlara isim verme

rownames(m) <- c(0,1,2)
colnames(m) <- c('A','B','C')
m

#Matrix Indexing
A<-matrix(c(1,5,6,7,4,9,2,4,-1,4,-8,9),4,4,T)
A

A[1,1]

A[1:3,1:3]

A[,ncol(A)]
A[nrow(A),]

A[-1,-1]

A[1,2]=11111
A

B = A[,2:3]
B

diag(B)#köþegenlerindeki deðerleri alýr 1111 ve alt çaprazý 2

#Matrix Func
A<-matrix(c(1,5,6,7,4,9,2,4,-1,4,-8,9),4,4,T)
A

B<-rbind(A,c(10,11,12,13))#satýr ekler
B

C<-rbind(A,B)
C

D<-cbind(B,c(10,11,12,13,14))
D
