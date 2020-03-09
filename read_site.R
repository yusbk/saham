## ----------------------------------------------------------------
## Analysis of shares from www.oslobors.no
## ----------------------------------------------------------------

if (!require(robotstxt)) install.packages("robotstxt")
## Required packages
pkgs <- c("robotstxt", "rvest", "selectr", "xml2", "dplyr", "stringr",
          "forcats", "magrittr", "tidyr", "ggplot2", "lubridate", "tibble", "purrr")

nypkg <- pkgs[!(pkgs %in% installed.packages()[, "Package"])]
if (length(nypkg)) install.packages(nypkg)

sapply(pkgs, require, character.only = TRUE)

## Check if website can be extracted
## If it's TRUE then it's extractable
robotstxt::paths_allowed(paths = c("https://www.oslobors.no/markedsaktivitet/#/list/shares/quotelist/ob"))

## Download the site

sahamHTML <- "https://www.oslobors.no/markedsaktivitet/#/list/shares/quotelist/ob/all/all/false"
saham <- xml2::read_html(sahamHTML)


sahamXPath <-
    "/html/body/div[2]/ui-view/div/ui-view/div[4]/div/ui-view/div/quotes/table"

sahXpath01 <- "/html/body/div[2]/ui-view/div/ui-view/div[4]/div/ui-view/div/quotes/table/tbody/tr[1]"
sxpath20 <- "/html/body/div[2]/ui-view/div/ui-view/div[4]/div/ui-view/div/quotes/table/tbody/tr[1]/td[5]/a"



sahamCSS <- "body > div:nth-child(4) > ui-view > div > ui-view > div:nth-child(4) > div > ui-view > div > quotes > table"
sahTbl <-
    "body > div:nth-child(4) > ui-view > div > ui-view > div:nth-child(4) > div > ui-view > div > quotes > table"
sahBdy <- "body > div:nth-child(4) > ui-view > div > ui-view > div:nth-child(4) > div > ui-view > div > quotes > table > tbody"


html_nodes(saham, xpath = sahXpath01)
html_nodes(saham, "table")
html_table(saham)
html_nodes(saham, css = sahTbl)

html_nodes(saham, xpath = sxpath20) %>%
    html_text()


library(XML)

## Oslo børs
oslHTML <-
    "https://www.oslobors.no/markedsaktivitet/#/list/shares/quotelist/ose/all/all/false"
oslHTML2 <- "https://www.oslobors.no/markedsaktivitet/#/list/shares/quotelist/ose/all/all"
oslpath <-
    "/html/body/div[2]/ui-view/div/ui-view/div[4]/div/ui-view/div/quotes/table"

sosl <- xml2::read_html(oslHTML)

html_nodes(sosl, xpath = oslpath)

tbl <- XML::readHTMLTable(oslHTML2)

oslHTML %>%
  read_html() %>%
  html_nodes(xpath='//*[@data-reacid=".d"]/table') %>%
  html_table(fill = TRUE)


## From Investor.no
## ----------------
inv <- "https://investor.dn.no/#!/Kurser/Aksjer/"
tblpath <- "/html/body/div[2]/div[1]/div/div[4]/table"
tblpath02 <- "/html/body/div[2]/div[1]/div/div[4]"
tblpath01 <- ".//table[contains(@class, 'table-static')]"
tblcss <-
    "#dninvestor-content > div:nth-child(1) > div > div.container.bright-section > table"
tblcss2 <- "#dninvestor-content > div:nth-child(1)"

inv %>%
    read_html() %>%
    html_nodes(css = tblcss2)

inv %>%
    read_html() %>%
    html_nodes(xpath = tblpath02) %>%
    html_nodes(css = c("container"))

    html_table()

inv %>%
    read_html("table") %>%
    html_table(fill = TRUE)
