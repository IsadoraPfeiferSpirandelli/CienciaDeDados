####FLORESTA

library(ggplot2)
library(rpart)
library(rpart.plot)


dados <- read.csv(file ="Heart.csv", sep=",", header=TRUE)
dados

unique(dados$ChestPain)
unique(dados$Fbs)
unique(dados$RestECG)
unique(dados$ExAng)
unique(dados$Slope)
unique(dados$Ca)
unique(dados$Thal)

dados$ChestPain <- as.factor(dados$ChestPain)

dados$Sex <- as.factor(dados$Sex)

dados$Fbs <- as.factor(dados$Fbs)

dados$RestECG <- as.factor(dados$RestECG)

dados$ExAng <- as.factor(dados$ExAng)

dados$Slope <- as.factor(dados$Slope)

dados$Thal <- as.factor(dados$Thal)

dados$AHD <- as.factor(dados$AHD)

summary(dados)
dados <- dados[,-1]

dados <- na.omit(dados)


ggplot(data = dados, aes(x=AHD, y=Chol))+
  geom_boxplot()


ggplot(data = dados, aes(x=AHD, y=MaxHR))+
  geom_boxplot()

table(dados$ChestPain, dados$AHD)

ggplot(data = dados, aes(x= ChestPain, fill = AHD))+
  geom_bar()

n <- round(0.8*nrow(dados))
indice_treinamento <- sample(1:nrow(dados), size = n, replace = FALSE)
treinamento <- dados[indice_treinamento,]
teste <- dados[-indice_treinamento,]

set.seed(1909)

arvore.dados <- rpart(formula = AHD ~., data=treinamento, method = "class")
rpart.plot(arvore.dados, extra=101)


previsao <- predict(arvore.dados, newdata = teste, type= "class")
previsao
mean(previsao == teste$AHD)
table(teste$AHD, previsao)

library(randomForest)
floresta.dados <- randomForest(formula=AHD ~., data=treinamento)
floresta.dados

previsao.floresta <- predict(floresta.dados, newdata=teste, type = "class")
mean(previsao.floresta == teste$AHD)

importance(floresta.dados)

floresta.dados1 <- randomForest(formula= AHD ~. -Fbs, data=treinamento)
previsao.floresta1 <- predict(arvore.dados, newdata = teste, type= "class")
previsao
mean(previsao.floresta1 == teste$AHD)


floresta.dados2 <- randomForest(formula= AHD ~. -Fbs -ResetECG -Sex -Slope, data=treinamento)
previsao.floresta2 <- predict(arvore.dados, newdata = teste, type= "class")
previsao
mean(previsao.floresta2 == teste$AHD)

varImpPlot(floresta.dados)
#selecionando os 6 mais importantes

floresta.dados3 <- randomForest(formula = AHD ~. MaxHR + ChestPain + Thal + Ca + Oldpeak + Age, data = treinamento)
previsao.dados3 <- predict(floresta.dados3, newdata = teste, type= "class")
mean(previsao.dados3 == teste$AHD)