## Packages
library(tidyverse)

## Config
wd <- getwd() %>% str_replace("/scripts$", "")
setwd(wd)
getwd()
rm(wd)

## Import data
tsv_base_path <- "./data/unprocessed/cv-corpus-9.0-2022-04-27/fi"

tb <- read_tsv(paste(tsv_base_path, "validated.tsv", sep = "/"))


## Unique values
spec(tb)

unique(tb$gender)

unique(tb$age)

### Number of speakers
length(unique(tb$client_id))
