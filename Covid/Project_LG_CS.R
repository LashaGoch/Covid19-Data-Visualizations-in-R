library(readr)
library(dplyr)
data <-
  read_csv("https://covid.ourworldindata.org/data/owid-covid-data.csv")

#unique(data$location)
head(data)
tail(data)

hist(data$total_cases_per_million)

OECD <- c("Austria", "Australia", "Belgium", "Canada", "Chile", "Colombia", 
          "Czech Republic", "Denmark", "Estonia", "Finland", "France", "Germany", 
          "Greece", "Hungary", "Iceland", "Ireland", "Israel", "Italy", "Japan", "Korea", 
          "Latvia", "Lithuania", "Luxembourg", "Mexico", "Netherlands", "New Zealand", 
          "Norway", "Poland", "Portugal", "Slovakia", "Slovenia", "Spain", 
          "Sweden", "Switzerland", "Turkey", "United Kingdom", "United States")

head(OECD)
data$OECD <- ifelse(data$location %in% OECD, 1, 0)

data <- data.frame(data)

table(unique(data$OECD))

glimpse(data)
summary(data)

hist(data$OECD)

EU <- c("Austria", "Belgium", "Bulgaria", "Croatia", "Cyprus", 
        "Czech Republic", "Denmark", "Estonia", "Finland", "France", 
        "Germany", "Greece", "Hungary", "Ireland", "Italy", "Latvia", 
        "Lithuania", "Luxembourg", "Malta", "Netherlands", "Poland", 
        "Portugal", "Romania", "Slovakia", "Slovenia", "Spain", "Sweden")

data$EU <- ifelse(data$location %in% EU, 1, 0)
head(data$EU)

hist(data$EU)


