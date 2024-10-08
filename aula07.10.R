###MANIPULAÇÃO DE TEXTO

library(rvest)
library(dplyr)
library(ggplot2)

url <- "https://www.bbc.com/portuguese/articles/c3e9p3dq0vgo"

html <- read_html(url)
html

#objetivo: trazer todo o texto para o r
#1)analisando
html|>
  html_elements("p")|>
  html_text2()
#2) pegando apenas o parágrafo de texto
texto <- html|>
  html_elements("p.bbc-hhl7in")|> #pegando a classe do elemento p
  html_text2()
texto
#3)
titulo <- html|>
  html_elements("h1")|>
  html_text2()
titulo

#4)transformando texto em apenas uma entrada
paste(c("a", "b"), collapse = " ")
texto <- paste(texto, collapse = " ")

noticias <- data.frame(titulo, texto) #apenas colocando os vetores titulo e texto
noticias

#raspando uma quantidade maior de noticias
url.base <- "https://www.bbc.com/portuguese/topics/cr50y580rjxt"
html.base <- read_html(url.base)

links <- html.base|>
  html_elements("ul.bbc-k6wdzo") |> #classe da ul - lista de noticias
  html_elements("li") |>
  html_elements("a") |>
  html_attr("href") #pego o atribulo do elemento a, que é sempre um link

#armazenando todos as noticias
titulos <- c()
textos <- c()

#percorrendo as entradas do vetor links
for (j in 1:length(links)) {
  url <- links[j]
  html <- read_html(url)
  titulos[j] <- html|>
    html_elements("h1")|>
    html_text2()
  texto <- html|>
    html_elements("p.bbc-hhl7in")|>
    html_text2()
  textos[j] <- paste(texto, collapse = " ")
}
titulos
textos
textos[8]
titulos[8]

noticias <- data.frame(titulos, textos)

noticias <- noticias|>
  mutate(categoria=rep("Ciências", times=24))


##########
install.packages("tidytext")
library(tidytext)

#objetivo: quais sao as paravras mais frequentes deste texto e faça um grafico para mostrar a freq.
#tokenizar um texto : pego um texto e quebro em particlas menores

#1) tokenizar
noticias[1,]|>
  unnest_tokens(output = "word", input = "textos") |> #quebrou o texto por palavra
  select(word)|>
  count(word, sort = TRUE)|>
  top_n(10)

#2) tirar as top word - conectivos
install.packages("stopwords")
library(stopwords)

stopwords("pt") #pt = portugues

stopwords_pt <- data.frame(word=stopwords("pt"))

noticias[3,]|> #2 é o numero da noticia
  unnest_tokens(output = "word", input = "textos") |> #quebrou o texto por palavra
  select(word)|>
  anti_join(stopwords_pt)|>
  count(word, sort=TRUE)|>
  top_n(10)|>
  mutate(word=reorder(word, n))|> #reordenando as palavras pela freq n
  ggplot(aes(y=word, x=n))+
  geom_col()+
  theme_minimal()


