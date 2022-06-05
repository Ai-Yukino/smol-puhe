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

## Make output paths ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

other_output_path <- "./data/unprocessed/other_audio"
dir.create(other_output_path)

NA_output_path <- "./data/unprocessed/NA_audio"
dir.create(NA_output_path)

female_output_path <- "./data/unprocessed/female_audio"
dir.create(female_output_path)

male_output_path <- "./data/unprocessed/male_audio"
dir.create(male_output_path)

## Read in tsv file as tibble #################################################
tb <- read_tsv(paste(cv_corpus_path, "validated.tsv", sep = "/"))

## Copy other clips ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Character vector of paths to other audio clips
other_clips <- tb %>%
  select(path, gender) %>%
  filter(gender == "other") %>%
  select(path) %>%
  mutate(path = paste(cv_corpus_clips_path, path, sep = "/")) %>%
  deframe()

file.copy(other_clips, other_output_path)

## Copy NA clips ##############################################################

### Character vector of paths to NA audio clips
NA_clips <- tb %>%
  select(path, gender) %>%
  filter(is.na(gender)) %>%
  select(path) %>%
  mutate(path = paste(cv_corpus_clips_path, path, sep = "/")) %>%
  deframe()

file.copy(NA_clips, NA_output_path)

## Copy female clips ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Character vector of paths to female audio clips
female_clips <- tb %>%
  select(path, gender) %>%
  filter(gender == "female") %>%
  select(path) %>%
  mutate(path = paste(cv_corpus_clips_path, path, sep = "/")) %>%
  deframe()

file.copy(female_clips, female_output_path)

## Copy male clips ############################################################

### Character vector of paths to female audio clips
male_clips <- tb %>%
  select(path, gender) %>%
  filter(gender == "male") %>%
  select(path) %>%
  mutate(path = paste(cv_corpus_clips_path, path, sep = "/")) %>%
  deframe()

file.copy(male_clips, male_output_path)

