# TBA

## Import R packages ##########################################################

library(tidyverse)

## Set working directory for R Studio ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## We want it to be the root of this repo, i.e. "/smol-puhe"

wd <- getwd() %>% str_replace("/scripts/R$", "")
setwd(wd)
getwd()
rm(wd)

## Path for Praat parameter tsv  ##############################################

praat_param_path <- "./scripts/Praat/"

## Create tibble to store parameters ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

tb <- tibble(
  speaker_number = c(1:9, 1:43),
  speaker_gender = c(rep("female", 9), rep("male", 43)),
  praat_param = NA
)

## Export tb to tsv file ??????????????????????????????????????????????????????

praat_param_file <- paste0(praat_param_path, "praat_param.tsv")

write_tsv(tb, praat_param_file)
