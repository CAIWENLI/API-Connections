#Packages:
install.packages("rlang")
install.packages("tibble")
install.packages("geosphere")
install_github('EAVWing/ZipRadius')
install_github('arilamstein/choroplethrZip@v1.5.0')
#install_github('ggplot2')
#install_github('magrittr')
#install_github('dplyr')
#install_github('zipcode')

require(devtools)
library(ZipRadius)
library(devtools)
library(choroplethrZip)
library(ggplot2)
library(geosphere)
library(magrittr) # need to run every time you start R and want to use %>%
library(dplyr)    # alternative, this also loads %>%

#Bringing in Zipcode database. 
library(zipcode)
data(zipcode)

test <- zipRadius("33484", 10.5)
test

makeZipMap <- function(zipcode, radius){
  choro = choroplethrZip::ZipChoropleth$new(getZipPop(zipcode, radius))
  suppressMessages(suppressWarnings(choro$prepare_map()))
  choro$legend = "Population"
  ec_zips = getZips(zipcode, radius)
  ec_df   = choro$choropleth.df[choro$choropleth.df$region %in% ec_zips,]
  ec_plot = choro$render_helper(ec_df, "", choro$theme_clean())
  
  ec_plot + ggplot2::coord_map()
}
makeZipMap("30316", 500) 
