# Description TBA

## Import R packages ##########################################################

library(tidyverse)

## Set working directory for R Studio ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## We want it to be the root of this repo, i.e. "/smol-puhe"

wd <- getwd() %>% str_replace("/scripts/R/praat_processing$", "")
setwd(wd)
getwd()
rm(wd)

## Test example from ??????????????????????????????????????????????????????????
## "Timeseries average based on a defined time interval (bin)"
## https://stackoverflow.com/a/48837132
## Thanks Andrew ^^

set.seed(-2022)
df = data.frame(ts = seq(1,100,by=0.5), Var = runif(199,1, 10))

this <- df %>%
  group_by(interval = round(ts / 10) * 10) %>%
  summarize(Var_mean = mean(Var, trim=1))

print.data.frame(this)

