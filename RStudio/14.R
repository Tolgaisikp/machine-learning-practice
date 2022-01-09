#Dataframe
id<-c(101,102,103)
name<-c('Bob','Alice','John')
marks<-c(78.25,59.45,63.85)

student<- data.frame(id,name,marks)
student

slist<-list(id,name,marks)
slist

#Dataframe Indexing

student[1,]

student[1,2:3]

student[1,2]
student[[1]][2]

report<-subset(student, marks<65)
report

report<-subset(student, marks<60 & id==102)
report

report<-subset(student, marks<65, select = c(name))
report

report<-subset(student, marks<65, select = name:marks)# veya -name yazarsak aynýsý çýkar
report

#rbind cbind
id<-c(101,102,103)
name<-c('Bob','Alice','John')
marks<-c(78.25,59.45,63.85)

student<- data.frame(id,name,marks)
student

student<- rbind(student, data.frame(id=104,name='Jack',marks=45.85))
student

student<- cbind(student, age=c(18,25,32,34))
student

#Dataframe edit() func
id<-c(101,102,103)
name<-c('Bob','Alice','John')
marks<-c(78.25,59.45,63.85)

student<- data.frame(id,name,marks)
student

studentedit<-edit(student)
studentedit


#Missing data
x<-c(5,4,8,9,NA)
is.na(x)

y<-is.na(x)
x[!y]

id<-c(1,2,3)
temp<-c(25,NA,27)
wind<-c(75,54,94)
humid<-c(NA,21,45)
weather<-data.frame(id,temp,wind,humid)
weather

weatherNA <- complete.cases(weather)
weatherNA

weather[weatherNA,]#na olanlarý gösterir
