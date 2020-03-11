## reference https://www.datacamp.com/community/tutorials/scraping-javascript-generated-data-with-r
## assuming phantomjs already install and saham.js is placed in the working folder
system("phantomjs saham.js")
saham_dat = read_html("data/saham.html",encoding ="UTF-8")
saham=saham_dat%>%html_nodes("table")%>%.[[1]]%>%html_table()
