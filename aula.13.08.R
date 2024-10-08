#####MANIPULAÇÃO DE DADOS

dados <- read.table("titanic.txt", sep=',', header=TRUE) #para imprimir a tabela, do outo lado coloco: View(dados)

dados <- [,-1] #-1 é para apagar somente a primeira coluna

summary(dados) #resumo dos dados
#coluna survived é categorico, só quero saber qual a categoria, nada de numero - modificando:
dados$Survived <- as.factor(dados$Survived)

dados$Pclass <- as.factor(dados$Pclass)

#quero saber quantas pessoas morreram e quantas morreram da 3° classe
summary(dados[dados$Pclass==3,]) #mostra as mortes e sobreviventes

terceira_classe <- dados[dados$Pclass==3,] #usando uma coluna para filtrar linhas de quem estava na 3°classe
table(terceira_classe$Survived)
barplot(table(terceira_classe$Survived))
prop.table(table(terceira_classe$Survived))


dados$Sex <- as.factor(dados$Sex)
summary(dados)

#quantos homens morreram e sobreviveram na 3° classe
summary(terceira_classe[terceira_classe$Sex=="male",])

homens_terceira <- terceira_classe[terceira_classe$Sex=="male",]
summary(homens_terceira)

summary(terceira_classe[terceira_classe$Sex=="female",])


homens_primeira <- dados[(dados$Pclass==1)&(dados$Sex=="male"),]
summary(homens_primeira)
