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


## List of clips by gender
## https://www.r-bloggers.com/2017/08/finding-distinct-rows-of-a-tibble/

other_partial_paths <- tb %>%
  select(path, gender) %>%
  filter(gender == "other") %>%
  select(path)

female_partial_paths <- tb %>%
  select(path, gender) %>%
  filter(gender == "female") %>%
  select(path)

male_partial_paths <- tb %>%
  select(path, gender) %>%
  filter(gender == "male") %>%
  select(path)

na_partial_paths <- tb %>%
  select(path, gender) %>%
  filter(is.na(gender)) %>%
  select(path)

sum(count(other_partial_paths), count(female_partial_paths), 
    count(male_partial_paths), count(na_partial_paths)) == count(tb)

## Copy clips to separate directors in order to quickly import into Praat

# clips_path <- "./data/cv-corpus-9.0-2022-04-27/fi/clips"
# 
# female_paths <- 
#   female_partial_paths %>%
#   mutate(path = paste(clips_path, path, sep = "/")) %>%
#   deframe()
# 
# female_dir <- "./data/acoustics/female"
# 
# dir.create(female_dir)
# 
# file.copy(female_paths, female_dir)











