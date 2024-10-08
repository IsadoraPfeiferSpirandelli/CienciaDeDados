1+1 # "#"é para comentários e aperto ctrl+enter para executar
1-10 #subtração
5*75 #produto
12/4 #divisão
3**2 #potência
3^2 #outra forma para potência

#criando objetos:
a <- 12/4 #guardando esse resultado no a
b <- a*5 #pode ser tbm: a*5 -> b
c <- 3+2*16
# stinha "<-" para guardar e "=" para dar nome ao argumento

numero <- 32+345 # usar o = só para argumento de funçao
class(numero) #qual a classe do objeto que criei
class(a)

W <- "ciencia" #aspas para delimitar uma palavra
class(W)
#character = string
x <- "3"
class(x)
x+23 #vai dar erro pq nao da pra somar uma palavra com numero

y <- TRUE
class(y) #objeto logito - para fazer um filtro dentro do conjunto de dados
y+10 # true é quem tem a caract que quero usar - pela logica vale 1

z<-FALSE
z+10 #falso vale 0, pessoa que nao tem a caract

TRUE+TRUE
FALSE+FALSE
y+y
z+z 

y+y+z

#para nomear objeto não pode começar com número, não pode ter espaço, e tem diferença entra letra maiúscula e minúscula



#VETORES
#criamos vetores usando a função c
x<-c(3,12,43,567) #vetor de tamanho 4
x
q <- c(1,21,34,123)
x+q #soma de vetores guardados em objetos
x+10

x+c(10,20) #soma de veteros com um que nao esta guardado no objeto -> reciclagem: quando usamos vetores de tamanho diferente, recicla o menor ate caber dentro do maior

x+c(10,20,30)#da uma mensagem de aviso, pois os numeros de quantidade de num dos vetores nao sao multiplos

c(1,2,"3") #virou tudo string, pois só é possivel criar vetor com elementos da mesma classe -> vai converter pra mais facil
c(1,2,"isa") #converteu para string pois é mais facil transformar os numeros em string, do que o nome em numero
#não faz sentido ter vetor com objetos de classes diferentes quando faço a análise de uma variável, não seria compatível
C(1,2,TRUE)


C(21,20,22,25,30,NA)#NA é dados faltantes, nao converte em numero ??ver pq nao deu certo
c(21,20,22,25,30,NoN)




#acessar elementos de um vetor
u <- C(11,22,33,44,55,66)
u[4]
u[2,4]#matriz -> usar virgula nesse caso dá ideia de dimensão
u[2:4]#vetor sequencial
u[c(2,4)] #"pegue do vetor u, as posiçoes 2 e 4"
u[c(2,4,2)]

menor_30 <- u<30
u<30 #1 -ele pega cada entrada e compara com 30 e vai falando se é vdd ou nao
u[u<30]# coloca o 1, dentro do [] no u, ele vai pegar só quem é true
u[menor_30]
#&=e, |=ou
u[u<30 & u>10]

u[c(TRUE, FALSE, TRUE, FALSE, FALSE, FALSE)] #vetor lógico
which(u<30)#quer saber quem é verdadeiro e nos retorna a posiçao -> vetor de posição
which(c(TRUE, FALSE, TRUE)) #onde tem o true
length(u)#função "length" retorna o tamanho do vetor
length(which(u<30)) #"quantos elementos de u sao menores que 30"
 
 sum(u<30) #é pra fazer a soma de vetor
 sum(u[menor_30])#somou 11 com 22 que sao os menores que 30
 
 
#warning massage = consegue executar, mas avisa que tem algo estranho/errado.

 
#CRIAR VETORES SEQUENCIAIS
 
 vetor1 <- 100:577 #criand vetor de 100 até 577 
 #na resposta, o que ta no colchete é a posicao do primeiro vetor da linha
 vetor1
 vetor1[11]
 vetor1[243]


 v2 <- 1:100
 v2
 v2 [69]
 
 
 
#a função seq
 #pergutando para o R o que é essa fução
 ?seq
 seq(from=4, to=77, by=3) #foi até o 76 pq se continuasse passaria do ponto que eu queria (77)

 
 
 
 #a função sample
 
 ?sample #para eu pedir ajuda do r para me explicar alguma coisa
 samle() #coloco argumento dentro dos parênteses 
 
 #exemplo de sorteio de dado:
 sample(x = 1:6, size = 1, replace = 1)

 dado <-  sample(x = 1:6, size = 1000, replace = 1)
 dado 
  dado == 1 #vetor de pergunta lógica "=="
  deu_1 <- dado == 1
 sum(deu_1) #saber quandos dados sairam com 1
 sum(deu_1)/1000 #proporção de sair numero 1
 mean(deu_1) #proporção de sair 1
 
 #ex.: joguem dois dados um milhao de vezes e estimem a probabilidade de sair a soma 7
 
set.seed(2133) 
dado1 <- sample(x = 1:6, size = 1000000, replace = TRUE)

dado2 <- sample(x = 1:6, size = 1000000, replace = TRUE)

dado1 
dado2 

soma <- dado1+dado2
soma 
soma[1:10] #ver apenas os 10 primeiros resultados
mean(soma) #media da soma

#ex.: sorteio de megasena
sorteio <- sample(x=1:60, size=6, replace=FALSE) #replace=FALSE pq o que eu sortiei não tem como devolver/sortear de novo.

bilhete <- c(2,38,59,18,33,14)

sorteio

bilhete%in%sorteio #quem do meu bilhete está dentro do meu sorteio. vai comparando todos os numeros do blhete com todos do sorteio -> essa linha é um vetor lógico
sum(bilhete%in%sorteio)

legth(bilhete) #essa função retorna o tamanho de um vetor
max(bilhete) #valor máximo
min(bilhete) #valor mínimo
mean(bilhete) #méda de um vetor

summary(bilhete) #resumo
#1st.qu. = primeiro quartil -> 25%, abaixo dele é o valor mostrado
#3rd. qu. = terceiro quartil


#usando a função table
table(soma) #tabela de frequencia - mostra a frequencia do argumento
 barplot(table(soma)) #para gerar gráfico no plots
 mean(soma==7) 
 

 
 
 
 
 
 
 
 
 
soma <- 0 
for(i in 1:20){
  soma <- soma + i
} 

soma 




medias <- c() #criando vetor vazio para guardar coisas dentro dele
for(i in 1:500){
  media <- mean(sample(1:6, size=1000, replace=TRUE))
  medias <- c(medias, media) #vai acrescentando as medias calculadas no espaço vazio -> concatenar é juntar tudo dentrode um vetor
}
medias
hist(medias) #criando histograma



medias <- c() 
for(i in 1:500){
  medias[i] <- mean(sample(1:6, size=1000, replace=TRUE))
} #medias[1] é para ir criando as posiçoes em ordem 

#exemplo de uso com dados faltantes (NA)
x <- c()
for(i in c(1,2,10)){
  x[i] <- i
}
 x

 #é diferente de :
 x <- c()
 for(i in c(1,2,10)){
   x <- c(x,i)
 }
 x

 
 
for(i in c("a", "b", "d")) {
  print(i)
}

#while 
soma <- 0
i <- 1
while(soma<1000){
  soma <- soma+i
  i <- i+1
}
soma 
i 


 
#exemplo:

acertos <- 0 #para verificar quantos acertos eu tive em ddeterminado momento
semanas <- 0 #semanas que vou jogar
bilhete <- c(1,45,32,30,55,11) #vou jogar sempre o mesmo
while(acertos < 4){
  semanas <- semanas + 1
  sorteio <- sample(1:60, size=6, replace=FALSE)
  acertos <- sum(bilhete%in%sorteio) 
}
acertos
semanas
 
 