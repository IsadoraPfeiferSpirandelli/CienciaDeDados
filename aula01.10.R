##pagina para importar indicadores social

#arquivo .xlsx corresponde a excel

data
#retirar os que nao sao estados
analfabetismo <- data[-c(1, 29:31),]
analfabetismo

#fazer um mapa do brasil com a intensidade de cores em relação ao analfab.
install.packages("geobr")
library(geobr)
library(dplyr)
library(ggplot2)

###lendo municípios
rio <- read_municipality(code_muni = 3304557)
rio

#camada que faz conexão entre os pontos para fechar o poligono e dar o mapa -> geom_sf
rio |> 
  ggplot()+
  geom_sf()+
  theme_void()



udia <- read_municipality(code_muni = 3170206 )
udia

udia |> 
  ggplot()+
  geom_sf()+
  theme_void()


###lendo estados
estados <- read_state()

estados|>
  ggplot()+
  geom_sf(fill="white", col="pink")+
  theme_void() #traz apenas o grafico

analfabetismo$Territorialidades #para saber nomes de todos os estados e como está escrito
estados$name_state #vimos que os nomes estao iguais e não terá problema

estados$name_state %in% analfabetismo$Territorialidades
#x %in% y = "quem do x esta dentro do y"

sim <- estados$name_state %in% analfabetismo$Territorialidades
sum(sim)#depois que arrumei os nomes

estados$name_state[!sim] #to pegando quem do 1° nao ta dentro do 2°

estados$name_state[c(11,18,19,23,24)] #acessando especificamente os estados com nomes diferente para alterar o nome deles
estados$name_state[c(11,18,19,23,24)] <- c("Rio Grande do Norte", "Espírito Santo", "Rio de Janeiro", "Rio Grande do Sul", "Mato Grosso do Sul")


estados$name_state
analfabetismo$Territorialidades

#ordenar em ambos os casos por ordem alfabética
#estados em ordem
order(estados$name_state)
estados$name_state[2]
estados$name_state[14]

estados <- estados[order(estados$name_state),] #substituindo por nome alfabética
estados

#analfabetismo em ordem
order(analfabetismo$Territorialidades)
analfabetismo$Territorialidades[1]

analfabetismo <- analfabetismo[order(analfabetismo$Territorialidades),]
analfabetismo


estados$taxa <-  analfabetismo$`Taxa de analfabetismo - 25 anos ou mais de idade 2021` #criando coluna taxa

estados |> 
  ggplot()+
  geom_sf(aes(fill=taxa))+
  theme_void()+
  scale_fill_gradient(high = "#132B43", low = "#56B1F7")




