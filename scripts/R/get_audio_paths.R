# This script extracts the file path of all the audio  clips `validated.tsv` 
# per each gender value (i.e. NA, "other", "female", "male")

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

## Read in tsv file as tibble #################################################
tb <- read_tsv(paste(cv_corpus_path, "validated.tsv", sep = "/"))

## List of clips by gender
## https://www.r-bloggers.com/2017/08/finding-distinct-rows-of-a-tibble/

other <- tb %>%
  select(path, gender) %>%
  filter(gender == "other") %>%
  select(path)

female <- tb %>%
  select(path, gender) %>%
  filter(gender == "female") %>%
  select(path)

male <- tb %>%
  select(path, gender) %>%
  filter(gender == "male") %>%
  select(path)

na <- tb %>%
  select(path, gender) %>%
  filter(is.na(gender)) %>%
  select(path)

sum(count(other), count(female), count(male), count(na)) == count(tb)

## TBA -> what type of file to export to use with Praat?
## Answer: see copy_and_sort_audio_by_gender.R script in this same directory
