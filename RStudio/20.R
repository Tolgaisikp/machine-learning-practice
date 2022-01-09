#Data Formats
#
n1<-15
typeof(n1)

n2<-15.15
typeof(n2)


n1<-"c"
typeof(n1)

n2<-"tolga"
typeof(n2)

#Vector
v1<-c(1,2,3,4,5)
is.vector(v1)

v2<-c("a","b","c")
is.vector(v2)

#Matrix
n1<-matrix(c(1,2,3,4,5,6), nrow = 2)
n1

#Array
a1<-array(c(1:24),c(4,3,2))
a1


vn<-c(1,2,3,4)
vc<-c("a","b","c","d")
vl<-c(T,F,T,T)

dfa<-cbind(vn,vc,vl)#sayý logic olsada hepsini ch yapar
dfa

typeof(dfa)

df<-as.data.frame(cbind(vn,vc,vl))
df

typeof(df)

#list
o1<-c(1,2,5)
o2<-c("d","a")
o3<-c(T,T,T,T,T,F)
ls<-list(o1,o2,o3)
ls

#coercing type
(coerce1<-c(1,"b",T))#hem tanýmlar hem yazdýrý
typeof(coerce1)#baskýlar hepsini karakter yapar

(coerce5<-as.numeric(c("1","2","3")))
typeof(coerce5)

co1<-as.data.frame(matrix(1:9,nrow = 3))
co1

co2<-data.frame(matrix(1:9,nrow = 3))
co2


#Factors
x<-1:3
y<-1:9

#combine(x deðiþkeni 3 y deðiþkeni 9 9a göre 3lüyü 3er kez yazar)
df<-cbind.data.frame(x,y)
df

typeof(df)

typeof(df$x)
str(df)

#as.factor
x1<-as.factor(c(1:3))
x1

df1<-cbind.data.frame(x1,y)
df1

typeof(df1$x1)
str(df1)

#labels for factor
x<-c(1:3)
y<-1:9

df<-cbind.data.frame(x,y)
df

df$x<-factor(df$x,
             levels = c(1,2,3),
             labels = c("macOS","Windows","Linux"))
df
typeof(df$x) 


#ordered factor öncelikli labeling 
x<-c(1:3)
y<-1:9

df<-cbind.data.frame(x,y)
df

df$x<-ordered(df$x,
             levels = c(3,1,2),
             labels = c("No","Maybe","Yes"))
df


#data
x<-seq(30,0,by=-3)
x

#consoleden giriþ
x1<-scan()
x1

#tekrarlama
x2<-rep(T,5)
x2
