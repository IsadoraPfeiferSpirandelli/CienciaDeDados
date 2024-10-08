install.packages("palmerpenguins") #função para instalar pacote
library(palmerpenguins) #para ler o pacote
dados <- penguins

#estrutura do conjunto
str(dados)

#resumo estatistico dos dados
summary(dados)

#analisando:
dados[1,] #aparece apenas os dados do primeiro pringuim
dados[1,1] #aparece a especie do primeiro pinguim
dados[,1] #imprime toda a coluna de espécies

mean(dados[,3], na.rm=TRUE) #media de todos os tamanhos de bico - deu dado faltante (NA), colocando na.rm=TRUE ele vai tirar todos os dados faltantes 
?mean
 #CHAMANDO PELO NOME DA COLUNA
dados$bill_length_mm #extrai o vetor
mean(dados$bill_length_mm, na.rm=TRUE) #MANEIRA MAIS ELEGANTE DE EXTRAIR UMA VARIAVEL DO CONJUNTO DE DADOS

adelie <- dados[dados$species=="Adelie",]
mean(adelie$bill_length_mm, na.rm=TRUE)
