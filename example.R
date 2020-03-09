library(rvest)
urlString <- "https://www.valueresearchonline.com/funds/fundSelector/returns.asp?cat=10&exc=susp%2Cclose&rettab=st"
urlString %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="fundCatData"]/table[1]') %>%
  html_table(fill=TRUE)
