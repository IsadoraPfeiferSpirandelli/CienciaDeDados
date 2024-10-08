library(palmerpenguins)
library(ggplot2)
library(dplyr)

dados <- penguins 
dados

dados <- na.omit(dados)
dados

n <- round(0.8*nrow(dados))

indices_treinamento <- sample(1:nrow (dados), size = n, replace = FALSE) #enumeracao e 1 ate 333

treinamento <- dados[indices_treinamento,]

teste <- dados[-indices_treinamento,]

ggplot(data = treinamento, mapping = aes(x=flipper_length_mm, y=bill_length_mm, col= species))+
  geom_point()+
  facet_wrap(~sex)
#esse tem divisao vertical/horizontal

ggplot(data = treinamento, mapping = aes(x=body_mass_g, y=bill_length_mm, col= species))+
  geom_point()+
  facet_wrap(~sex)


treinamento |>
  filter(sex == "female") |>
  ggplot(aes(x=body_mass_g, y=bill_length_mm, color = species))+
  geom_point()+
  geom_vline(xintercept = 4000)+
  geom_hline(yintercept = 41)


treinamento |> 
  filter(sex == "male") |>
  ggplot(aes(x=body_mass_g, y=bill_length_mm, color = species))+
  geom_point()+
  geom_vline(xintercept = 4900)+
  geom_hline(yintercept= 45)


classificacao <- c()

for(k in 1:nrow(teste)){
  if(teste$sex[k] == "female"){
    if(teste$body_mass_g[k] > 4000) {
      classificacao[k] <- "Gentoo"
    } else{
      if(teste$bill_length_mm[k] < 41) {
        classificacao[k] <- "Adelie"
      }else{
        classificacao[k] <- "Chinstrap"
      }
    }
  }
  else{
    if(teste$body_mass_g[k] > 4900) {
      classificacao[k] <- "Gentoo"
    }else{
      if(teste$bill_length_mm[k] <- 45) {
        classificacao[k] <- "Adelie"
      }else{
        classificacao[k] <- "Chinstrap"
      }
    }
  }
}

mean(classificacao == teste$species)



