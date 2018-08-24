# R - dane ze strony internetowej (EWIB) 
# 

# usuwa wszystkie zmienne
# rm(list=ls())

# Analiza plików HTML/XML, zawiera pipey "%>%"  
library(rvest)

# String manipulation
library(stringr)


# link do strony z danymi
url <- "https://pl.wikipedia.org/wiki/Lista_bank%C3%B3w_dzia%C5%82aj%C4%85cych_w_Polsce"
webpage <- read_html(url)

webpage

# pobieram dane z odpowiedniego miejsca strony do wektora
records <- webpage %>% 
  html_nodes("table") %>%
  .[[1]] %>%
  html_nodes("th, td") %>%
  html_text() %>%
  gsub('[\r\n\t]', '', .)

records



# ostatnie 1 informacji jest niepotrzebne
records = head(records, -3)

# ustawienie danych w formacie macierzy
mx_rec = matrix(records, ncol = 13, byrow = TRUE)

#wynik_frame <- data.frame(mx_rec)
wynik_df <- records %>%
  tail(-13) %>% 
  matrix(ncol = 13, byrow = TRUE) %>% 
  data.frame

colnames(wynik_df) <- head(records, 13)



# CZY DA SIÊ KRÓCEJ, LEPIEJ, DOK£ADNIEJ ?? --> DA SIÊ :)
url <- "https://pl.wikipedia.org/wiki/Lista_bank%C3%B3w_dzia%C5%82aj%C4%85cych_w_Polsce"
webpage <- read_html(url)

webpage

#html_form(read_html("https://pl.wikipedia.org/wiki/Lista_bank%C3%B3w_dzia%C5%82aj%C4%85cych_w_Polsce"))

# pobieram dane z odpowiedniego miejsca strony
records <- webpage %>% 
  html_nodes("table") %>% 
  .[[1]] %>% 
  html_table()

records


movie <- read_html("https://www.filmweb.pl/film/Iniemamocni+2-2018-740144")
cast <- html_nodes(movie, "tr")

cast
html_text(cast)
html_name(cast)
html_attrs(cast)
html_attr(cast, "class")


records_2 <- read_html("https://www.ssa.gov/oact/babynames/numberUSbirths.html") %>% 
  html_nodes(".border") %>% 
  html_table() %>% 
  data.frame()

str(records_2)
