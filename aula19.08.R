####FREQ. E GRAFICOS

library(dplyr)
library(ggplot2)

titanic <- read.table(file="titanic.txt", header=TRUE, sep=",")
str(titanic)
titanic[1,] #infos sobre o 1° passageiro
titanic[10,]
titanic[,10]
titanic <- titanic[,-1]

titanic$Survived <- as.factor(titanic$Survived)

titanic$Pclass <- as.factor(titanic$Pclass)

titanic$Sex <- as.factor(titanic$Sex)

str(titanic)


#calculando frequencia:
table(titanic$Survived) #0=mortos e 1=vivos
barplot(table(titanic$Survived))

prop.table(table(titanic$Survived))
barplot(prop.table(table(titanic$Survived)))

barplot(table(titanic$Pclass))
barplot(table(titanic$Sex))

#acessando valores de uma coluna:
table(titanic$Pclass)[2] #chamo pelo nome dela dentro do []
table(titanic$Sex)["female"]

#GRÁFICOS
 hist(titanic$Age)

 mean(titanic$Age, na.rm = TRUE) #quero retirar os dados faltantes
 
 is.na(titanic$Age) #pergunto se é NA e me retorna valores lógicos
 
 sum( is.na(titanic$Age)) #me retorna total de NA's
 na.omit(titanic)
 na.omit(titanic$Age)

 str(na.omit(titanic))

 titanic$Age[!is.na(titanic$Age)] #
 
 which(!is.na(titanic$Age))
 
 
 #boxplot
 boxplot(titanic$Age)

 plot(x=titanic$Age, y=titanic$Fare, type="p", pch=16) 
 plot(x=titanic$Age, y=titanic$Fare, type="p", pch=9, main = "grafico feio", xlab = "idade", ylab = "preço")
 plot(x=titanic$Age, y=titanic$Fare, type="l", main = "grafico feio", xlab = "idade", ylab = "preço")
 
 
 
 #usando o dplyr
 
select(titanic, Age, Pclass)

titanic|> 
  select( Age, Pclass) |>
  filter(Pclass==3)

filter(select(titanic, Age, Pclass), Pclass==3)  


#aprendendo o ggplot2

ggplot(data=titanic, mapping = aes(x=Survived))

ggplot(data=titanic, mapping = aes(x=Survived)) + 
  geom_bar()+
  theme_minimal()


ggplot(data=titanic, mapping = aes(x=Survived, fill=Sex))+ 
  geom_bar()+
  theme_minimal()

#grafico de quem morreu de acordo com a classe
ggplot(data=titanic, mapping = aes(x=Pclass, fill=Survived)) + 
  geom_bar()+
  theme_minimal()

#grafico de quem morreu de acordo com a classe de acordo comsexo fem e masc
ggplot(data=titanic, mapping = aes(x=Pclass, fill=Survived)) + 
  geom_bar()+
  theme_minimal()+
  facet_wrap(~Sex)

ggplot(data=titanic, mapping = aes(x=Pclass, fill=Survived)) + 
  geom_bar()+
  theme()+ #tirei o minimal para ver a separação entre homem e mulher
  facet_wrap(~Sex)



 
 
 
 
 
 
 
 
 
 