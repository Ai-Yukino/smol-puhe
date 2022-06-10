# This script reads in`validated.tsv`
# See the `README.md` in https://github.com/common-voice/cv-dataset
# for more details about `validated.tsv`

## Import R packages ##########################################################
library(tidyverse)

## Set working directory for R Studio ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## We want it to be the root of this repo, i.e. "/smol-puhe"

wd <- getwd() %>% str_replace("/scripts/R$", "")
setwd(wd)
getwd()
rm(wd)

## cv_corpus paths ############################################################
cv_corpus_path <- "./data/unprocessed/cv-corpus-9.0-2022-04-27/fi"

## Read in tsv file as tibble ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tb <- read_tsv(paste(cv_corpus_path, "validated.tsv", sep = "/"))

## Unique values ##############################################################
spec(tb)

unique(tb$gender)

unique(tb$age)

### Number of speakers
length(unique(tb$client_id))

### Number of female speakers
tb %>%
  select(client_id, gender) %>%
  filter(gender == "female") %>%
  distinct(client_id) %>%
  count()
  
### Number of male speakers
tb %>%
  select(client_id, gender) %>%
  filter(gender == "male") %>%
  distinct(client_id) %>%
  count

### Interesting values ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Character vector of male speakers' client id's
male_client_ids <- tb %>%
  select(client_id, gender) %>%
  filter(gender == "male") %>%
  distinct(client_id)

### Male speaker 29
tb %>%
  select(client_id, gender, age, path) %>%
  filter(client_id == unlist(
    male_client_ids[29,]),
    path %in% c("common_voice_fi_25812281.mp3",
                "common_voice_fi_25812261.mp3") 
    ) %>%
  distinct(gender, age, path)




