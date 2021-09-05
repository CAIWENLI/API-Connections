
library(dplyr)
library(zipcode)

dma <- read.csv("~/R/Projects/R-DCM/Clients/Michaels/Assets/Inputs/dma_2017.csv")
data(zipcode.civicspace)

zipcode.civicspace$zip <- as.character(zipcode.civicspace$zip)
dma$ZIP.Code <- as.character(dma$ZIP.Code)
dma.cities <- dma %>% 
  inner_join(zipcode.civicspace , by = c("ZIP.Code" = "zip"))

write.csv(dma.cities,"~/R/Projects/R-DCM/Clients/Michaels/Assets/Outputs/dma.cities.csv")

dma.cities$TV.HHs <- as.numeric(dma.cities$TV.HHs)
dma.cities.only <- dma.cities %>% 
  group_by(city, DMA.Name) %>% 
  summarise(nzip = n(),
            tv.hits = sum(TV.HHs))
write.csv(dma.cities.only,"~/R/Projects/R-DCM/Clients/Michaels/Assets/Outputs/dma.cities.only.csv")
