#####FLORESTA

dados <- read.csv(file ="Carseats.txt", sep=";", header=TRUE) #csv é pq é separado por vírgula e o txt nem sempre é por vírgula, então tenho que identificar qual é o tipo deseparação
dados

str(dados) 
summary(dados)

####
library(ggplot2)
library(rpart)
library(rpart.plot)


dados <- read.table(file="Carseats.txt", header = TRUE, sep = ";")
dados
str(dados)
 
dados$ShelveLoc <- as.factor(dados$ShelveLoc)
dados$US <- as.factor(dados$US)
dados$Urban <- as.factor(dados$Urban)

vendas <- ifelse(dados$Sales <= 8, "baixo", "alto")
vendas

dados$vendas <- as.factor(ifelse(dados$Sales <= 8, "baixo", "alto")) #(condição, se a cond for TRUE imprime baixo, se a cond for FALSE imprime alto)
dados$vendas

#tirando a variavel que transformei (sales)
dados <- dados[,-1]

#######fazendo a árvore
set.seed(123)
n <- round(0.8*nrow(dados))
n
indice_treinamento <- sample(1:nrow(dados), size = n , replace = FALSE )
treinamento <- dados[indice_treinamento,]
teste <- dados[-indice_treinamento,]

library(rpart)
library(rpart.plot)
arvore <- rpart(formula = vendas~., data=treinamento, method = "class" )
rpart.plot(arvore)

previsão.treinamento <- predict(arvore, treinamento, type = "class") #overfeeling - bem no treino e mal no teste
mean(previsão.treinamento==treinamento$vendas)

previsão.arvore <- predict(arvore, teste, type = "class") #overfeeling - bem no treino e mal no teste
mean(previsão.arvore==teste$vendas)

#######floresta
library(randomForest)
floresta <- randomForest(formula=vendas~., data=treinamento)
floresta

previsao.floresta <- predict(floresta, newdata = teste, type = "class")
mean(previsao.floresta==teste$vendas)

importance(floresta) #qual a importancia da floresta

#tirando os que tem menos importancia
floresta1 <- randomForest(formula=vendas~.-Urban, data=treinamento)
floresta1

previsao.floresta1 <- predict(floresta1, newdata = teste, type = "class")
mean(previsao.floresta1==teste$vendas)

floresta2 <- randomForest(formula=vendas~.-Urban-US, data=treinamento)
floresta2

previsao.floresta2 <- predict(floresta2, newdata = teste, type = "class")
mean(previsao.floresta2==teste$vendas)

floresta3 <- randomForest(formula=vendas~.-Urban -US -Education, data=treinamento)
floresta3

previsao.floresta3 <- predict(floresta3, newdata = teste, type = "class")
mean(previsao.floresta3==teste$vendas)


names(arvore)
arvore$cptable


arvore.podada <- prune(arvore, cp=0.02205882 )
rpart.plot(arvore.podada)
nrow(arvore.podada$frame)

previsão.podada <- predict(arvore.podada, teste, type = "class")
mean(previsão.podada==teste$vendas)
