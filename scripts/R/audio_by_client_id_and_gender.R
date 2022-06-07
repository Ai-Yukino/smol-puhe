# This script extracts the audio clips from `validated.tsv` and sorts them
# into separate folder by gender value (i.e. NA, "other", "female", "male")

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

### Create output directories for each female speakers
female_speaker_base_path <- 
  "./data/unprocessed/female_audio/female_speaker_"
female_speaker_paths <- 
  paste0(female_speaker_base_path, 1:num_female_speakers)

for (i in 1:num_female_speakers){
  dir.create(female_speaker_paths[i], recursive = TRUE)
}

### Get the audio clip paths for each female speaker
### and copy them to the appropriate output directory
for (i in 1:num_female_speakers){
  speaker_clips <- tb %>%
    select(client_id, gender, path) %>%
    filter(client_id %in% female_client_ids[i,], gender == "female") %>%
    select(path) %>%
    as_vector() %>%
    paste(cv_corpus_clips_path, ., sep="/")

  file.copy(speaker_clips, female_speaker_paths[i])
}











