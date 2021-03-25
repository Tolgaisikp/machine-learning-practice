pacman::p_load(pacman,dpylr,GGally,ggplot2,ggthemes,ggvis,httr,lubridate,plotly,rio,rmarkdown,shiny,stringr,tidyr)

library(datasets)

?USJudgeRatings
head(USJudgeRatings)

data<-USJudgeRatings

#define variable groups
x<-as.matrix(data[-12])#giriþ sonuçlarý

y<-data[,12]#çýktý sonuçlarý

#using variable groups
reg1<-lm(y~x)#nesne

#veya ayrý ayrý veririz
reg1<-lm(RTEN ~ CONT + INTG + DMNR + DILG + CFMG +
         DECI + PREP + FAMI + ORAL + WRIT + PHYS, 
         data = USJudgeRatings)

reg1

summary(reg1)

#daha fazla istatistik veri
anova(reg1)#Varyans analizi
coef(reg1)#Katsayý (Coefficient)
confint(reg1)
resid(reg1)

hist(residuals(reg1))

#Ek modeller
#Iki ek kitaplýk kullanýn
p_load(lars,caret)

#Geleneksel kademeli regresyon
stepwise<-lars(x,y,type = "stepwise")

#Aþamalý gibi, ancak daha iyi genelleþtirilebilir
forward<-lars(x,y,type = "forward.stagewise")

#Lar: en küçük açý regresyonu
lar<-lars(x,y,type = "lar")

#Lasso: en az mutlak büzülme ve seçim eperatörü
lasso<-lars(x,y,type = "lasso")


r2comp<-c(stepwise$R2[6],forward$R2[6],lar$R2[6],lasso$R2[6] %>% round(2))
names(r2comp)<-c("stepwise","forward","lar","lasso")
r2comp
