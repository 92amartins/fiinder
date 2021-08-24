library(rvest)
library(dplyr)

URL <- "https://www.fundsexplorer.com.br/ranking"

page = xml2::read_html(URL)

df = html_node(df, "#table-ranking") %>%
  html_table()

df %>%
  filter(`DY (12M)Média` != "N/A" & `P/VPA` != "N/A") %>%
  filter(as.integer(`Liquidez Diária`) > 1000) %>%
  filter((gsub(",", ".", `P/VPA`) > 0.7) & (gsub(",", ".", `P/VPA`) < 1)) %>%
  arrange(desc(`DY (12M)Média`)) %>%
  select(`Códigodo fundo`,`DY (12M)Média`, `P/VPA`, `Liquidez Diária`) %>%
  top_n(20, `DY (12M)Média`)
