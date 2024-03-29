pacman::p_load(pacman,dpylr,GGally,ggplot2,ggthemes,ggvis,httr,lubridate,plotly,rio,rmarkdown,shiny,stringr,tidyr)

library(datasets)

?USJudgeRatings
head(USJudgeRatings)

data<-USJudgeRatings

#define variable groups
x<-as.matrix(data[-12])#giri� sonu�lar�

y<-data[,12]#��kt� sonu�lar�

#using variable groups
reg1<-lm(y~x)#nesne

#veya ayr� ayr� veririz
reg1<-lm(RTEN ~ CONT + INTG + DMNR + DILG + CFMG +
         DECI + PREP + FAMI + ORAL + WRIT + PHYS, 
         data = USJudgeRatings)

reg1

summary(reg1)

#daha fazla istatistik veri
anova(reg1)#Varyans analizi
coef(reg1)#Katsay� (Coefficient)
confint(reg1)
resid(reg1)

hist(residuals(reg1))

#Ek modeller
#Iki ek kitapl�k kullan�n
p_load(lars,caret)

#Geleneksel kademeli regresyon
stepwise<-lars(x,y,type = "stepwise")

#A�amal� gibi, ancak daha iyi genelle�tirilebilir
forward<-lars(x,y,type = "forward.stagewise")

#Lar: en k���k a�� regresyonu
lar<-lars(x,y,type = "lar")

#Lasso: en az mutlak b�z�lme ve se�im eperat�r�
lasso<-lars(x,y,type = "lasso")


r2comp<-c(stepwise$R2[6],forward$R2[6],lar$R2[6],lasso$R2[6] %>% round(2))
names(r2comp)<-c("stepwise","forward","lar","lasso")
r2comp
