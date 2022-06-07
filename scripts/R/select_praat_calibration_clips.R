# Randomly select a clip from each speaker 
# to use for calibrating Praat parameters

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
cv_corpus_clips_path <- "./data/unprocessed/cv-corpus-9.0-2022-04-27/fi/clips"

## Read in tsv file as tibble ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

tb <- read_tsv(paste(cv_corpus_path, "validated.tsv", sep = "/"))

## Female speakers ############################################################

### Character vector of female speakers' client id's
female_client_ids <- tb %>%
  select(client_id, gender) %>%
  filter(gender == "female") %>%
  distinct(client_id)

num_female_speakers <- nrow(female_client_ids)

### Randomly select calibration clip from each female speaker
set.seed(-2022)

for (i in 1:num_female_speakers){
  speaker_clips <- tb %>%
    select(path, client_id) %>%
    filter(client_id == unlist(female_client_ids[i,])) %>%
    select(path)
  
  print(i)
  print(deframe(
    sample_n(speaker_clips, 1)
    ))
}

## Male speakers ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Character vector of male speakers' client id's
male_client_ids <- tb %>%
  select(client_id, gender) %>%
  filter(gender == "male") %>%
  distinct(client_id)

num_male_speakers <- nrow(male_client_ids)

### Randomly select calibration clip from each male speaker
set.seed(-2022)

for (i in 1:num_male_speakers){
  speaker_clips <- tb %>%
    select(path, client_id) %>%
    filter(client_id == unlist(male_client_ids[i,])) %>%
    select(path)
  
  print(i)
  print(deframe(
    sample_n(speaker_clips, 1)
  ))
}







