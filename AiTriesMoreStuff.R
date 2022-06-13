# Description: TBA

## Import R packages ##########################################################

library(tidyverse)

## Set working directory for R Studio ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## We want it to be the root of this repo, i.e. "/smol-puhe"

wd <- getwd() %>% str_replace("/scripts/R/praat_processing$", "")
setwd(wd)
getwd()
rm(wd)

## Import data ################################################################

tb <- read_csv("./data/filtered_data.csv")
spec(tb)

## Make training set ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set.seed(-2022)

train_size <- 0.7
train_index <- sample(c(TRUE, FALSE),
                       nrow(tb),
                       replace=TRUE,
                       prob=c(train_size, 
                              1 - train_size))

train <- tb[train_index, ]
test <- tb[!train_index, ]

## Logistic regression ########################################################
## Y -> gender
## X -> f0

model_f0 <- glm(gender ~ f0, family = "binomial", data = tb)

tb_new <- tb %>%
  add_column(above_f0_median = as.numeric(tb$f0 > median(tb$f0)))

colnames(tb_new)
