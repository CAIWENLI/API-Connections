rm(list=ls())

install.packages("googlesheets")

# install.packages("boxr")
# devtools::install_github("brendan-r/boxr")
# Sys.info()[["user"]]

library(boxr)
options(httr_oob_default=TRUE) 
box_auth() 

# options(httr_oob_default = FALSE )

client_id <-"yx52dl7k9mgt5ol1n4fr9xtornxtqfqb"

client_secret <- "B32xVhhpRJvqyCetMCTYvf8sgOgMZxSK"

redirectURI <- "http://localhost:3000/return"

box_auth(client_id = client_id,  client_secret = client_secret, interactive = TRUE, cache = "~/.boxr-oauth", write.Renv = TRUE)

file <- box_read(281866275341)

# box_write(file,"TestBoxr2.csv",46210969937)



