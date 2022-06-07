# This script extracts the audio clips from `validated.tsv` and sorts them
# into separate folder by gender value = "female", "male"
# as well as by different speakers, i.e. by client_id

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

## Male speakers ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Character vector of male speakers' client id's
male_client_ids <- tb %>%
  select(client_id, gender) %>%
  filter(gender == "male") %>%
  distinct(client_id)

num_male_speakers <- nrow(male_client_ids)

### Create output directories for each male speakers
male_speaker_base_path <- 
  "./data/unprocessed/male_audio/male_speaker_"
male_speaker_paths <- 
  paste0(male_speaker_base_path, 1:num_male_speakers)

for (i in 1:num_male_speakers){
  dir.create(male_speaker_paths[i], recursive = TRUE)
}

### Get the audio clip paths for each male speaker
### and copy them to the appropriate output directory
for (i in 1:num_male_speakers){
  speaker_clips <- tb %>%
    select(client_id, gender, path) %>%
    filter(client_id %in% male_client_ids[i,], gender == "male") %>%
    select(path) %>%
    as_vector() %>%
    paste(cv_corpus_clips_path, ., sep="/")
  
  file.copy(speaker_clips, male_speaker_paths[i])
}
