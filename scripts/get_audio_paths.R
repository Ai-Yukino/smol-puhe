## Packages
library(tidyverse)

## Config
wd <- getwd() %>% str_replace("/scripts$", "")
setwd(wd)
getwd()
rm(wd)

## Import data
tb <- read_tsv("../smol-puhe/data/cv-corpus-9.0-2022-04-27/fi/validated.tsv")

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
