## Packages
library(tidyverse)

## Config
wd <- getwd() %>% str_replace("/scripts$", "")
setwd(wd)
getwd()
rm(wd)

## Import data
tb <- read_tsv("../smol-puhe/data/cv-corpus-9.0-2022-04-27/fi/validated.tsv")

## Unique values
spec(tb)

unique(tb$gender)

unique(tb$age)

### Number of speakers
length(unique(tb$client_id))
