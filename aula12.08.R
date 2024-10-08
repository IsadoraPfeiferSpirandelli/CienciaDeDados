#exemplo aniversarios - em uma sala com 10 pessoas, qual a prob de ter pelo menos duas pessoas que fazem aniversario no mesmo dia
aniversarios <- sample(x=1:365, size=10, replace=TRUE)#x é o conjunto que vou analisar, size é o tamanho - nesse caso vao ser 10 pessoas, replace=TRUE é quando permito repetição
aniversarios
duplicated(aniversarios) #se der true, significa que tenho pelo menos dois iguais- vai comparando com os seus antecessores
any(duplicated(aniversarios))

#condição: ter pelo menos duas pessoas que faca aniversario no mesmo dia
resultados <- c()
for(j in 1:100000){
  aniversarios <- sample(x=1:365, size=10, replace=TRUE)
  resultados[j] <- any(duplicated(aniversarios)) #os true estao sendo guardados dentro do resultados
}
mean(resultados)


soma <- function(x,y){
  return(x+y)
}




#usando um for dentro de um function:
calcula_aniversarios <- function(n) {
  resultados <- c()
  for(j in 1:100000){
    aniversarios <- sample(x=1:365, size=n, replace=TRUE)
    resultados[j] <- any(duplicated(aniversarios)) #os true estao sendo guardados dentro do resultados
  }
  return(mean(resultados))
 } #n é o numero de pessoas
calcula_aniversarios(10)
calcula_aniversarios(15)
calcula_aniversarios(20)
calcula_aniversarios(23) #mais de 50% de chances de ter 
calcula_aniversarios(40)
