# Randomly select a clip from each speaker 
# to use for calibrating Praat parameters

## Import R packages ##########################################################

library(tidyverse)

## Set working directory for R Studio ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## We want it to be the root of this repo, i.e. "/smol-puhe"

wd <- getwd() %>% str_replace("/scripts/R/praat_processing$", "")
setwd(wd)
getwd()
rm(wd)

## cv_corpus paths ############################################################

cv_corpus_path <- "./data/unprocessed/cv-corpus-9.0-2022-04-27/fi"
cv_corpus_clips_path <- "./data/unprocessed/cv-corpus-9.0-2022-04-27/fi/clips"

## Read in tsv file as tibble ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

tb <- read_tsv(paste(cv_corpus_path, "validated.tsv", sep = "/"))

## Sampling parameters ########################################################

speakers_sample_size <- 5
clips_sample_size <- 1

## Female speakers ############################################################

### Character vector of female speakers' client id's
female_client_ids <- tb %>%
  select(client_id, gender) %>%
  filter(gender == "female") %>%
  distinct(client_id)

num_female_speakers <- nrow(female_client_ids)

### Sample clips
set.seed(-2022)

female_speakers_sample <- sample(1:num_female_speakers, speakers_sample_size)

for (i in female_speakers_sample){
  speaker_clips <- tb %>%
    select(path, client_id, gender) %>%
    filter(client_id == unlist(
      female_client_ids[i,]),
      gender == "female"
    ) %>%
    select(path)
  
  print(i)
  print(deframe(
    sample_n(speaker_clips, clips_sample_size)
  ))
}

## Male speakers ############################################################

### Character vector of male speakers' client id's
male_client_ids <- tb %>%
  select(client_id, gender) %>%
  filter(gender == "male") %>%
  distinct(client_id)

num_male_speakers <- nrow(male_client_ids)

### Sample clips
set.seed(-2022)

male_speakers_sample <- sample(1:num_male_speakers, speakers_sample_size)

for (i in male_speakers_sample){
  speaker_clips <- tb %>%
    select(path, client_id, gender) %>%
    filter(client_id == unlist(
      male_client_ids[i,]),
      gender == "male"
    ) %>%
    select(path)
  
  print(i)
  print(deframe(
    sample_n(speaker_clips, clips_sample_size)
  ))
}
