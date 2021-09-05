rm(list=ls())

library(censusapi)
library(zipcode)

data("zipcode")

mycensuskey <- "df9e0036b1d36e28e6a40766e6f00e2ae4c6cee9"
myvintage <- 2017

# availablegeos <- listCensusMetadata(name = "acs/acs5", vintage = myvintage,  type = "g")
# availablevars <- listCensusMetadata(name = "acs/acs5", vintage = myvintage)

# B01003.  Total Population
# B09001.  Population Under 18 Years by Age
# B01002.  Median Age by Sex
# B25034.  Year Structure Built
# B25107.  Median Value by Year Structure Built
# B25009.  TENURE BY HOUSEHOLD SIZE

test <- getCensus(name = "acs/acs5", 
                       vintage=myvintage, 
                       key=mycensuskey, 
                       vars = c("NAME", "B01003_001E", "B01002_001E","B01002_002E","B01002_003E","B25034_001E", "B25034_002E","B25107_001E", "B25107_002E", "B25009_002E", "B25009_010E"), 
                       region = "zip code tabulation area:*")


colnames(data) <- c("Zip", "zip", "Median_Income", "Median_Age", 
                    "Total_Population", "Male_Population", "Female_Population", "White", "AfricanAmerican", "AmericanIndian_Alaska_Native", "Asian")


data <- mutate(data, Other = Total_Population - White - AfricanAmerican - AmericanIndian_Alaska_Native-Asian)


census <- merge(data, zipcode, by = c ("Zip" = "zip"))
