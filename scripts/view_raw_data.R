## Import R packages ##########################################################
library(tidyverse)

## Set working directory for R Studio #########################################
wd <- getwd() %>% str_replace("/scripts$", "")
setwd(wd)
getwd()
rm(wd)

## cv_corpus paths ############################################################
cv_corpus_path <- "./data/unprocessed/cv-corpus-9.0-2022-04-27/fi"

## Read in tsv file as tibble #################################################
tb <- read_tsv(paste(cv_corpus_path, "validated.tsv", sep = "/"))

## Unique values
spec(tb)

unique(tb$gender)

unique(tb$age)

### Number of speakers
length(unique(tb$client_id))
