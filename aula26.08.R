####ÁRVORE DE DECISÃO

library(palmerpenguins)
library(ggplot2)
library(dplyr)

pinguinsggplot2pinguins <- penguins
str(pinguins)
summary(pinguins)
pinguins <- na.omit(pinguins)

#vou trabalhar apenas com variáveis numéricas
pinguins <- pinguins|>
  select(species, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g ) #selecionando do conjunto essa variáveis

n <- round( 0.8*nrow(pinguins))

indices_treinamento <- sample(1:nrow(pinguins), size=n, replace=FALSE)#selecionando pinguins aleatoriamente

treinamento <- pinguins[indices_treinamento, ]

teste <- pinguins[-indices_treinamento,]

#peso=x e asa=y por especies - vimos que não é uma boa escolha
ggplot(data = treinamento, mapping =aes(x=body_mass_g,y=flipper_length_mm, col=species) )+
  geom_point()+
  theme_minimal()

#bico com asa ficou bom, pois os dados estao em conjuntos aglomerados e distintos
ggplot(data = treinamento, mapping =aes(x=bill_length_mm,y=flipper_length_mm, col=species) )+
  geom_point()+
  theme_minimal()

#bico com bico - BOM
ggplot(data = treinamento, mapping =aes(x=bill_length_mm,y=bill_depth_mm, col=species) )+
  geom_point()+
  theme_minimal()

#bico com massa
ggplot(data = treinamento, mapping =aes(x=bill_length_mm,y=body_mass_g, col=species) )+
  geom_point()+
  theme_minimal()











ggplot(data = treinamento, mapping =aes(x=bill_length_mm,y=flipper_length_mm, col=species) )+
  geom_point()+
  theme_minimal()

#calculando a distancia do primeiro do teste com todos do treinamento, pois dentro do treinamento ja encontrei o padrao de classificação
distancias <- c()
for (j in 1:nrow(treinamento)) { #j para dist interna
  distancias[j] <- sqrt((treinamento$bill_length_mm[j]-teste$bill_length_mm[1])**2+(treinamento$flipper_length_mm[j]-teste$flipper_length_mm[1])**2)#usando conceito de distancia
  }
distancias

order(distancias)[1]
treinamento$species[order(distancias)[1]] #pinguim mais proximo do teste
teste$species[1]#peguei o primeiro pinguim do teste e descobri a especie


distancias <- c()
for (j in 1:nrow(treinamento)) {
  distancias[j] <- sqrt((treinamento$bill_length_mm[j]-teste$bill_length_mm[2])**2+(treinamento$flipper_length_mm[j]-teste$flipper_length_mm[2])**2)#usando conceito de distancia
}
order(distancias)[2]
treinamento$species[order(distancias)[2]] 
teste$species[2]


classificacao <- c()
for (k in 1:nrow(teste)) {
  distancias <- c()
  for (j in 1:nrow(treinamento)) {
    distancias[j] <- sqrt((treinamento$bill_length_mm[j]-teste$bill_length_mm[k])**2+(treinamento$flipper_length_mm[j]-teste$flipper_length_mm[k])**2)
  }
  menor_distancia <- order(distancias)[1] #posicao do menor pinguim do teste
  classificacao[k] <- treinamento$species[menor_distancia]
}
classificacao #esta me devolvendo a numeração que ele deu para cada categoria, mudando:
  
classificacao <- c()
for (k in 1:nrow(teste)) {
  distancias <- c()
  for (j in 1:nrow(treinamento)) {
    distancias[j] <- sqrt((treinamento$bill_length_mm[j]-teste$bill_length_mm[k])**2+(treinamento$flipper_length_mm[j]-teste$flipper_length_mm[k])**2)
  }
  menor_distancia <- order(distancias)[1] #posicao do menor pinguim do teste
  classificacao[k] <- as.character(treinamento$species[menor_distancia])#usar "as.character" para sair apenas caracteres
}
classificacao #agora me retorna caract.

mean(classificacao==teste$species)#taxa de acerto


