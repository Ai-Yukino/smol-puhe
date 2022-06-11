## Import R packages ##########################################################

library(tidyverse)

## Set working directory for R Studio ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## We want it to be the root of this repo, i.e. "/smol-puhe"

wd <- getwd() %>% str_replace("/scripts/R/praat_processing$", "")
setwd(wd)
getwd()
rm(wd)

tb <- read_csv("./data/filtered_data.csv")
spec(tb)

## Logistic regression ########################################################
## gender ~ f0

ggplot(tb, aes(x=f0, y=gender)) +
  geom_point(alpha=.5, aes(color = cut(tb$gender, c(-1, 0.5, 1)))) +
  scale_color_manual(name = "Gender",
                     values = c("(-1,0.5]" = "#ff0080",
                                "(0.5,1]" = "#0000ff"),
                     labels = c("Female", "Male")) +
  stat_smooth(method="glm", se=FALSE,
              method.args = list(family=binomial), col="#a349a4") +
  labs(title = "Logistic regression",
       subtitle = "gender ~ f0",
       caption = "Data: smol-puhe/data/filtered_data.csv")

# ggsave("logistic_gender_f0.png")

model_f0 <- glm(gender~f0, data = tb)
summary(model_f0)

## Logistic regression ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## gender ~ f0 / f1

tb$f0_over_f1 <- tb$f0 / tb$f1

ggplot(tb, aes(x=f0_over_f1, y=gender)) +
  geom_point(alpha=.5, aes(color = cut(tb$gender, c(-1, 0.5, 1)))) +
  scale_color_manual(name = "Gender",
                     values = c("(-1,0.5]" = "#ff0080",
                                "(0.5,1]" = "#0000ff"),
                     labels = c("Female", "Male")) +
  stat_smooth(method="glm", se=FALSE,
              method.args = list(family=binomial), col="#a349a4") +
  labs(title = "Logistic regression",
       subtitle = "gender ~ f0 / f1",
       caption = "Data: smol-puhe/data/filtered_data.csv") + 
  xlab("f0 / f1")

# ggsave("logistic_gender_f0_over_f1.png")

model_f0_over_f1 <- glm(gender~f0_over_f1, data = tb)
summary(model_f0_over_f1)

## Logistic regression ########################################################
## gender ~ f1 / f0

tb$f1_over_f0 = tb$f1 / tb$f0

ggplot(tb, aes(x=f1_over_f0, y=gender)) +
  geom_point(alpha=.5, aes(color = cut(tb$gender, c(-1, 0.5, 1)))) +
  scale_color_manual(name = "Gender",
                     values = c("(-1,0.5]" = "#ff0080",
                                "(0.5,1]" = "#0000ff"),
                     labels = c("Female", "Male")) +
  stat_smooth(method="glm", se=FALSE,
              method.args = list(family=binomial), 
              col="#a349a4") + 
  labs(title = "Logistic regression",
       subtitle = "gender ~ f1 / f0",
       caption = "Data: smol-puhe/data/filtered_data.csv") + 
  xlab("f1 / f0")

# ggsave("logistic_gender_f1_over_f0.png")

model_f1_over_f0 <- glm(gender~f1_over_f0, data = tb)
summary(model_f1_over_f0)

## Logistic regression ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## gender ~ f1 - f0

tb$f1_minus_f0 = tb$f1 - tb$f0

ggplot(tb, aes(x=f1_minus_f0, y=gender)) +
  geom_point(alpha=.5, aes(color = cut(tb$gender, c(-1, 0.5, 1)))) +
  scale_color_manual(name = "Gender",
                     values = c("(-1,0.5]" = "#ff0080",
                                "(0.5,1]" = "#0000ff"),
                     labels = c("Female", "Male")) +
  stat_smooth(method="glm", se=FALSE,
              method.args = list(family=binomial), 
              col="#a349a4") + 
  labs(title = "Logistic regression",
       subtitle = "gender ~ f1 - f0",
       caption = "Data: smol-puhe/data/filtered_data.csv") + 
  xlab("f1 - f0")

# ggsave("logistic_gender_f1_minus_f0.png")

model_f1_minus_f0 <- glm(gender~f1_minus_f0, data = tb)
summary(model_f1_minus_f0)

  # References __________________________________________________________________
# https://www.statology.org/plot-logistic-regression-in-r/
# https://www.color-hex.com/color-palette/3899
# https://stackoverflow.com/questions/29966582/ggplot-geom-point-with-colors-based-on-specific-discrete-values
# https://stackoverflow.com/questions/61227134/r-ggplot-geom-point-color-gradient-based-on-variable
  
