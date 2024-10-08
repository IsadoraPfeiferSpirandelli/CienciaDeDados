####MODELO KNN

library(ggplot2)
library(dplyr)

read.csv("cancer.csv")

dados <- read.csv("cancer.csv", header = TRUE)
str(dados)

dados$diagnosis <- as.factor(dados$diagnosis) #transformando em fator e nao em character
str(dados)

# garantindo que os nossos dados estarao certos na hora de buscar pelas caracteristicas

#teste e treinmento
n <- round(0.8*nrow(dados))
n
indices_treinamento <- sample(1:nrow(dados), size = n, replace = FALSE)
treinamento <- dados[indices_treinamento,]
teste <- dados[-indices_treinamento,]

#padronizando para que a media sejam iguais e nossas analises nao sejam diferentes em diferentes escalas 
#todos com media 0 e variancia 1
?scale

treinamento_padronizado <- scale(treinamento[,-1]) #retirando a nossa variavel resposta do grupo de treinamento
teste_padronizado <- scale(teste[,-1]) #retirando a nossa variavel resposta do grupo de teste   

library(class) #biblioteca para poder usar knn
?knn

modelo_knn <- knn(train = treinamento_padronizado, test = teste_padronizado, cl = treinamento$diagnosis, k = 1)
#cross validation: pode definir qual o melhor valor de k-vizinhos
modelo_knn

acuracia_knn <- mean(teste$diagnosis == modelo_knn)

#entre com os numeros de vizinhos no modelo e me retorne a acuracia

calcula_acuracia <- function(k){
  modelo_knn <- knn(train = treinamento_padronizado, test = teste_padronizado, cl = treinamento$diagnosis, k = k)
  acuracia_knn <- mean(teste$diagnosis == modelo_knn)
  return(acuracia_knn)
}

calcula_acuracia(4) #quero que o meu ponto teste leve em criterio 4 vizinhos (aleatorio b,m,b,bq vai me resultar em B, já q possui mais

####cross validation em casa

table(modelo_knn, teste$diagnosis) #acertei de fato alguns e de uns pelo bonde errei

#explicação Gini
#G = P_a*G_a + P_b*G_b
#G_a = P_x*(P_x - 1) + P_y(P_y - 1)

(72+33)/(72+33+7+2) #acuracia feito a mao

#-------------------------------
#modelo de arvore, instala pacote rpart e rpart.plot
#rpart cria o modelo da arvore de decisao e rpart.plot cria o grafico
#. com todas as variaveis / existem dois tipos de arvore
library(rpart)
library(rpart.plot)

?rpart

modelo_arvore <- rpart(formula = diagnosis~ ., data = treinamento, method = "class")

rpart.plot(modelo_arvore, extra = 101)