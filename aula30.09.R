#AULA30.09 - RASPAGEM
###### RASPAGEM DE DADOS #######

install.packages("dplyr")

install.packages("rvest") #pacote que vou usar para a raspagem de dados

library(dplyr)

library(rvest)

#pegar a url da página 

url <- "https://www.bbc.com/portuguese/articles/c3dv8yy3d8jo"

html <- read_html(url) #lendo o html dessa página

html

##raspar o título bbc

html|>
  
  html_elements("h1") #pegando os elementos que são h1

#tirando os codigos para vir apenas o título da noticia

html|>
  
  html_elements("h1")|>
  
  html_text2()

##raspar titulo wikipedia

url1 <- "https://pt.wikipedia.org/wiki/Lista_de_unidades_federativas_do_Brasil_por_alfabetiza%C3%A7%C3%A3o#:~:text=Esta%20%C3%A9%20a%20lista%20de%20unidades%20federativas%20do%20Brasil%20por"

html1 <- read_html(url1)

html1

html1|>
  
  html_elements("h1")|>
  
  html_text2()


#pelo span

html1|>
  
  html_elements("span.mw-page-title-main")|>  #to entrando dentro do span, mas dentre todos, quero o que tem essa classe (mw-page-title-main). Ponto singuinifica que to querendo a classe
  
  html_text2()

#raspando a tabela da wiki

#class = wikitable sortable jquery-tablesorter -> separados por espaço me da classes diferentes

tabela1 <- html1 |> 
  
  html_element("table.wikitable") |> #element me retor apenas a entrada da primeira
  
  html_table()

tabela1

#segunda forma de fazer:

tabelas <- html1 |>
  
  html_elements("table")|>
  
  html_table()

tabelas

principal <- tabelas[[3]]

