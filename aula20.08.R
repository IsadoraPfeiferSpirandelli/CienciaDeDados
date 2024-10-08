#####GRÁFICOS

library(palmerpenguins)
library(dplyr)
library(ggplot2)

pinguins <- penguins
str(pinguins)
summary(pinguins)

pinguins <- na.omit(pinguins) #omitir dados faltantes


#quais especies de pinguins vivem em quais ilhas
ggplot(data = pinguins, mapping = aes(x=island, fill=species)) +
  geom_bar()+
  theme_minimal()+
  labs(x = "ilha", #labs: eu modifico o grafico no eixo x e y, o título e a legenda
       y = "frequência",
       title = "Espécie em cada ilha",
       fill = "espécies")+
  scale_fill_manual(values = c("Adelie"="#a6cee3", "Chinstrap"="#e78ac3", "Gentoo"="#7570b3"))+
  facet_wrap(~sex)



ggplot(pinguins, aes(x = sex))+
  geom_bar()+
  facet_wrap(~species)


#criar boxplot em que representa variavel peso, de cada especie
ggplot(data = pinguins, mapping = aes(x = sex, y = body_mass_g, fill = sex) )+
  geom_boxplot()+
  theme_minimal()+
  facet_wrap(~species)+
  labs(x = "sexo",
       y = "peso",
       fill = "sexo")+
  scale_x_discrete(labels=c("female"="fêmea", "male"="macho"))+ #renomeando no eixo x
  scale_fill_manual(values = c("female"="#f781bf", "male"="#1f78b4"))


#mesma coisa pro tamanho do bico 
ggplot(data = pinguins, mapping = aes(x = sex, y = bill_length_mm, fill = sex) )+
  geom_boxplot()+
  theme_minimal()+
  facet_wrap(~species)+
  labs(x = "sexo",
       y = "comprimento do bico",
       fill = "sexo")+
  scale_x_discrete(labels=c("female"="fêmea", "male"="macho"))
  

#mesma coisa para profundidade do bico
ggplot(data = pinguins, mapping = aes(x = sex, y = flipper_length_mm, fill = sex) )+
  geom_boxplot()+
  theme_minimal()+
  facet_wrap(~species)+
  labs(x = "sexo",
       y = "profundidade do bico",
       fill = "sexo")


#peso por asa
ggplot(pinguins, aes(x=body_mass_g, y=flipper_length_mm, color=species, size=bill_length_mm))+
  geom_point(alpha=0.5)+
  theme_minimal()





