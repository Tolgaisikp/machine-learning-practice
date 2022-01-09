topla = function(a,b){
  x <- a + b
  return (x)
}

topla(5,10)

formals(topla)

topla1 = function(a,b,c){
  x <- a + b + c
  return (x)
}

topla1(8,4,2)

myeval = function(x,y){
  w = x + y
  h = x * y
  result = list('sum' = w, 'mul' = h)
  return(result)
} 

myeval(5,17)

#inline fonksiyonlar (tek satýrlýk)
sum2 = function(x,y) x+y

sum2(5,2.5)
